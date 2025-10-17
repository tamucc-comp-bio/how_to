setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)
#install.packages("dm")
library(dm)

# Read in Tibbles (Dataframes)
list2env(read_rds("example_2stage_pcr_reldb.rds"), envir = .GlobalEnv)

# Create the dm object from the individual tibbles
dm_nokeys <- 
  dm(
    extraction_data = extraction_data,
    pcr1_data       = pcr1_data,
    pcr1_gels       = pcr1_gels,
    pcr2_data       = pcr2_data,
    pcr2_gels       = pcr2_gels,
    pcr_protocols   = pcr_protocols,
    pcr_recipes     = pcr_recipes
  )

dm_nokeys %>%
  dm_draw()

# Identify Primary Key Candidate Columns
all_pk_candidates <- 
  map_dfr(
    names(dm_get_tables(dm_nokeys)),
    ~ {
      dm_enum_pk_candidates(dm_nokeys, table = !!sym(.x)) %>%
        mutate(table = .x, .before = columns)
    }
  )

print(all_pk_candidates, n = Inf)

# Define primary keys for the tables.
# (Adjust these if your tables have different unique identifiers.)
dm_pkeys <- 
  dm_nokeys %>%
  dm_add_pk(table = extraction_data, column = normalized_dna_sample_id) %>%
  dm_add_pk(table = pcr1_data, column = pcr1_id) %>%
  dm_add_pk(table = pcr2_data, column = pcr2_id) %>%
  dm_add_pk(table = pcr1_gels, column = pcr1_gel_lane_id) %>%
  dm_add_pk(table = pcr2_gels, column = pcr2_gel_lane_id) %>%
  dm_add_pk(table = pcr_protocols, column = cycler_protocol_id) %>%
  dm_add_pk(table = pcr_recipes, column = pcr_recipe_id)

dm_draw(dm_pkeys)

# Identify Foreign Key Candidate Columns
dm_enum_fk_candidates(
  dm = dm_pkeys,
  table = pcr1_data,
  ref_table = extraction_data
) %>% 
  print(n = Inf)

# Add foreign key relationships based on your join logic:
dm_allkeys <- 
  dm_pkeys %>%
  dm_add_fk(
    table  = pcr1_data, 
    column = pcr1_template_dna_sample_id,
    ref_table = extraction_data
  ) %>%
  dm_add_fk(
    table = pcr1_gels, 
    column = pcr1_id,
    ref_table = pcr1_data,
  ) %>%
  dm_add_fk(
    table  = pcr2_gels, 
    column = pcr2_id,
    ref_table = pcr2_data
  ) %>%
  dm_add_fk(
    table  = pcr2_data, 
    column = pcr2_template_dna_sample_id,
    ref_table = pcr1_data
  ) %>%
  dm_add_fk(
    table  = pcr1_data, 
    column = pcr1_recipe_id,
    ref_table = pcr_recipes
  ) %>%
  dm_add_fk(
    table  = pcr2_data, 
    column = pcr2_recipe_id,
    ref_table = pcr_recipes
  ) %>%
  dm_add_fk(
    table  = pcr1_data, 
    column = pcr1_cycler_protocl_id,
    ref_table = pcr_protocols
  ) %>%
  dm_add_fk(
    table  = pcr2_data, 
    column = pcr2_cycler_protocl_id,
    ref_table = pcr_protocols
  )

dm_draw(dm_allkeys)

# connect many to many for join operations
dm_allkeys_detailed <-
  dm_allkeys %>%
  
  dm_add_fk(
    table  = pcr1_data, 
    column = dna_extract_tube_id,
    ref_table = extraction_data,
    ref_columns = dna_extract_tube_id
  ) %>%
  dm_add_fk(
    table  = pcr1_data, 
    column = filter_id,
    ref_table = extraction_data,
    ref_columns = filter_id
  ) %>%
  dm_add_fk(
    table  = pcr1_data, 
    column = sample_type,
    ref_table = extraction_data,
    ref_columns = sample_type
  ) %>%
  
  dm_add_fk(
    table  = pcr1_data, 
    column = pcr1_template_dna_plate_id,
    ref_table = extraction_data,
    ref_columns = normalized_dna_plate_id
  ) %>%
  dm_add_fk(
    table  = pcr1_data, 
    column = pcr1_template_dna_plate_col,
    ref_table = extraction_data,
    ref_columns = normalized_dna_plate_col
  ) %>%
  dm_add_fk(
    table  = pcr1_data, 
    column = pcr1_template_dna_plate_row,
    ref_table = extraction_data,
    ref_columns = normalized_dna_plate_row
  ) %>%
  
  dm_add_fk(
    table  = pcr2_data, 
    column = dna_extract_tube_id,
    ref_table = pcr1_data,
    ref_columns = dna_extract_tube_id
  ) %>%
  dm_add_fk(
    table  = pcr2_data, 
    column = filter_id,
    ref_table = pcr1_data,
    ref_columns = filter_id
  ) %>%
  dm_add_fk(
    table  = pcr2_data, 
    column = sample_type,
    ref_table = pcr1_data,
    ref_columns = sample_type
  )    

dm_draw(dm_allkeys_detailed)
