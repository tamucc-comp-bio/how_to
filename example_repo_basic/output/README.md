# Outputs & Processed Data

## Directory Purpose
This directory stores **intermediate outputs** from data processing steps or preliminary analysis results. Files in this directory are typically generated automatically by scripts in the `scripts/` directory.

## File Descriptions
- **(example) `cleaned_plant_data.csv`**  
  Data that have been processed (e.g., outlier removal, normalization) and are ready for further analysis.  

- **(example) `soil_data_summary.txt`**  
  A text-based summary (e.g., means, standard deviations) of soil composition measurements.

## Key Files
1. `specimens_tidy.csv`  
   - **Primary Key**: specimen_id  
   - **Foreign Keys**: site_id, collector_id  
   - **Variables**: 12 columns including weight_g, length_mm  

2. `sites_geo.csv`  
   - Merges GPS waypoints with site metadata

## Quality Checks
- Missing values: <1% (see `scripts/quality_check.R`)
- Outliers flagged in `quality_notes` column



## Notes or Instructions
- These files are typically *not* the final figures or tables used for publication; final results typically go into the `results/` directory.  
- You may choose to subdivide this directory into subfolders if many intermediate output files are generated (e.g., `output/data_processing/`, `output/model_results/`), but keep the structure as simple as possible.
