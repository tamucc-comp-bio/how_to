# How to Organize Biological Data


---

## Tidy Data

It is important to be deliberate and methodical in the organization of your data.  You will likely work with many data formats, most of them being unwieldy and not "[tidy](https://vita.had.co.nz/papers/tidy-data.pdf)".  You do, however, have control over the data that you record manually and the information that you extract and wrangle in computer code from raw data files of varying formats.  For most biologists, the tidy format be the most benficial and easy to understand.

![tidy-1](https://r4ds.hadley.nz/images/tidy-1.png)

Figure 1.  From [R for Data Science](https://r4ds.hadley.nz/data-tidy).  In tidy data, one file holds one table. In each table, the rows are observations and the columns are variables that store information about the observations.  Each row should contain only 1 observation.  Each column should contain only 1 variable.  Notes about an observation can be made in a column named `notes`.  One column should contain the `observation_id` which is a [unique identifier](https://en.wikipedia.org/wiki/Unique_identifier) assigned to that observation.

---

## Data Science Philosophy

After data is digitized, *all manipulations of the data should be documented and executed in code*. This facilitates transparency, reproduction of methods, and we are progressing toward a day when you’re scientific research papers will be rejected if you don’t provide the scripts used to process your data. 

As an example, if you collect latitude and longitude of locations using a GPS, you should not be moving that data over into MS Excel because there is no record of how that transfer of the data occurred that could be evaluated by an independent observer.  Rather, you would write the commands in a file (script) that can be executed by a computer to [join](https://en.wikipedia.org/wiki/Relational_algebra#Joins_and_join-like_operators) the GPS waypoints to the other [metadata](https://en.wikipedia.org/wiki/Metadata) associated with the locations. 

If your digitized data is not tidy, then you would write a script to tidy it. It follows that, ultimately all of your data will be organized into tidy tables. When considering all data for a MS Thesis, Ph.D. Dissertation chapter, or a publication in a scientific journal; most projects will involve many unique tidy tables which need to be organized into a [database](https://en.wikipedia.org/wiki/Database). 

---

## Relationships Between Data Files (Databases)

We will focus on organizing our data based upon the relational model (Codd 1970) as a [relational database](https://en.wikipedia.org/wiki/Relational_database).  The relational database we describe here consists of several tidy data files that are connected by common columns of data (keys).  

The [primary key](https://en.wikipedia.org/wiki/Primary_key) is the column with a unique value for each observation (row) or a set of columns that uniquely define an observation when combined. In Fig. 2 below, the column named `faa` is the primary key for the `airports` table. In contrast, the `flights` table columns named `year`, `month`, `day`, `hour`, and `flight` collectively comprise the primary key. 

A [foreign key](https://en.wikipedia.org/wiki/Foreign_key) is a column in one data file that contains the same values as the primary key of another data file. Foreign keys typically contain values that are duplicated in several rows. In Fig. 2 below, the columns named `origin` and `dest` in the `flights` data file are both foreign keys in relation to the `faa` primary key of the `airports` data file. These columns all contain FAA airport codes. This relationship is signified by the lines that start at the primary key and point at the foreign key.  In `airports`, every row of the `faa` column contains a unique aiport code.  On the other hand, since there are many flights that share the same airport code, the `flights` data file contains many rows with the same airport codes in the `origin` and `dest` columns. 

![relational-1](https://d33wubrfki0l68.cloudfront.net/245292d1ea724f6c3fd8a92063dcd7bfb9758d02/5751b/diagrams/relational-nycflights.png)

Figure 2. From [R for Data Science](https://r4ds.had.co.nz/relational-data.html). [Entity relationship](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model) diagram (ERD) depicting the relationships between tidy tables of data in a relational database. There are 5 data tables represented: airports, flights, weather, planes, and airlines. Only the keys in each table are names, e.g. `faa` in airports, etc... Primary keys are denoted with shading.  Foreign keys are denoted as unshaded. All other columns are represented by `...`. Lines in the diagram depict the relationships between pairs of columns by originating at the primary and terminating at the matching foreign key in the relationship.   

It is advisable to create an ERD such as that displayed in Fig. 2 for your research project _before_ you collect the data.  The less thought you put into organizing your data prior to collecting it, the more time and lines of code it will take to organize the data into a relational database that can be easily analyzed.  

---

## Naming Files and Columns

All files and columns should be named using human readable and understandable words (not abbreviations).  The contents of the file and the columns should be self evident from their names.  Avoid using spaces, use `gps_waypoints.gpx` instead of `gps waypoints.gpx`.

---

## Directory Structure

``` css
project_name/
├── data_raw/
├── data_processed/
├── scripts/
├── results/
├── documentation/
└── references/
```
Figure 3. Simple default directory structure for basic projects

All raw data files should be stored in you `git` repository in a directory named `data`.  Avoid unnecessary creation of additional directories and especially try to avoid nesting directories unless neccessary for organizational purposes (avoid creating a maze).  One rule to follow is that for every dir you create, you need to put a `README.md` in that dir to describe the contents. [Consult this guide to formatting the contents of a *.md file](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).

``` css
project_name/
├── data/
│   ├── raw_data/
│   └── processed_data/
├── scripts/
│   ├── data_processing/
│   ├── analysis/
│   └── visualization/
├── results/
│   ├── figures/
│   ├── tables/
│   └── reports/
├── documentation/
│   ├── manuals/
│   ├── protocols/
│   └── notebooks/
├── references/
│   ├── papers/
│   └── notes/
├── code/
│   ├── src/
│   └── tests/
└── config/
```
Figure 4. More complex directory structure with 2 levels of nesting for more complex projects.  Generally students should use Fig 3 as the model.

1. Data

    raw_data/: Contains unprocessed raw data files.
   
    processed_data/: Contains data that has been cleaned and processed.

3. Scripts

    data_processing/: Scripts for cleaning and processing raw data.
   
    analysis/: Scripts for analyzing the data and generating results.
   
    visualization/: Scripts for creating visualizations (graphs, plots, etc.).

5. Results

    figures/: Contains generated figures, graphs, and plots.
   
    tables/: Contains any tables of results generated from the analysis.
   
    reports/: Final reports or intermediate analysis results.

7. Documentation

    manuals/: Any manuals or supplementary documentation.
   
    protocols/: Detailed protocols for experiments or analyses.
   
    notebooks/: Jupyter or R notebooks with exploratory analyses or step-by-step procedures.

9. References

    papers/: Relevant research papers and articles.
   
    notes/: Notes and summaries of key literature.

11. Code

    src/: Source code for any custom scripts, functions, or modules.
    
    tests/: Unit tests and other tests for your code.

13. Config

    config/: Configuration files for software or analysis tools (e.g., YAML, JSON).
   
---

## Documentation of Data Files and Organization

A `README.md` file should occur in every dir and should describe the files and their contents.  It's also a good idea to make a diagram, like Fig 2, describing the relationships among your data files and displaying that in the README.md.


---

### [Return to how_to/README.md](https://github.com/tamucc-comp-bio/how_to/blob/main/README.md)

