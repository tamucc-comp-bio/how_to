# How to Organize Biological Data


---

## Data Science Philosophy

After data is digitized, *all manipulations of the data should be documented and executed in code*. This facilitates transparency, reproduction of methods, and we are progressing toward a day when you’re scientific research papers will be rejected if you don’t provide the scripts used to process your data. 

---

## Tidy Data

It is important to be deliberate and methodical in the organization of your data.  You will likely work with many data formats, most of them being unwieldy.  You do, however, have control over your metadata and the information that you extract from raw data files of varying formats.  For most biologists, the format that be the most benficial and easy to understand will be tidy formatted data files organized as a [relational database](https://en.wikipedia.org/wiki/Relational_database).

![tidy-1](https://github.com/Ph-IRES/2024_LastName_ProjName/assets/12803659/b3c8f084-9b89-405b-8bd2-1b02e0acf8f0)

Figure 1.  From R for Data Science.  In tidy data, one file holds one table. In each table, the rows are observations and the columns are variables that store information about the observations.  Each row should contain only 1 observation.  Each column should contain only 1 variable.  Notes about an observation can be made in a column named `notes`.  One column should contain the `observation_id` which is a unique name assigned to that observation.

---

## Relationships Between Data Files

![relational-1](https://d33wubrfki0l68.cloudfront.net/245292d1ea724f6c3fd8a92063dcd7bfb9758d02/5751b/diagrams/relational-nycflights.png)

Figure 2. From R for Data Science. It is best to store your project data into multiple tidy data sheets.  Each pair of sheets are connected by a common column or common set of columns. In the example above, the `flights` tidy data sheet has the columns `year`, `month`, etc...  and each row is a commercial airline flight.  The flights data sheet does not store the weather because it would be inefficient.  All flight departing at the same time from the same airport have the same weather.  There is a separate `weather` tidy data sheet where each row represents the weather at a given time at a given airport.  Because `flights` and `weather` have common columns, they can be linked together by those columns (aka Keys), and the weather for a given flight can be queried. 

For the data in your projects, you will generally have at least a `specimens` tidy data file that stores the information you've collected on each specimen, as well as a `sampling location` tidy data file that stores the information about the locations from which the specimens were collected.  The common column between the two files should be `location_id`. In the `sampling_location` file, each sampling location is listed once and the `location_id` column is a *primary key*.  In the `specimens` data file, the same location will occur in several rows if several specimens were collected from a location and the `location_id` column is a *foreign_key*.  As you add more tidy data files to your relational database, you will want to be sure you have matching primary and foreign keys to link them to the existing files.

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

