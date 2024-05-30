# How to Organize Data

It is important to be deliberate and methodical in the organization of your data.  You will likely work with many data formats, most of them being unwieldy.  You do, however, have control over your metadata and the information that you extract from raw data files of varying formats.  For most biologists, the format that be the most benficial and easy to understand will be tidy formatted data files organized as a relational database.

---

## Tidy Data

![tidy-1](https://github.com/Ph-IRES/2024_LastName_ProjName/assets/12803659/b3c8f084-9b89-405b-8bd2-1b02e0acf8f0)

Figure 1.  From R for Data Science.  In tidy data, one file holds one table. In each table, the rows are observations and the columns are variables that store information about the observations.  Each row should contain only 1 observation.  Each column should contain only 1 variable.  Notes about an observation can be made in a column named `notes`

---

## Relational Data

![relational-1](https://d33wubrfki0l68.cloudfront.net/245292d1ea724f6c3fd8a92063dcd7bfb9758d02/5751b/diagrams/relational-nycflights.png)

Figure 2. From R for Data Science. It is best to store your project data into multiple tidy data sheets.  Each pair of sheets are connected by a common column or common set of columns. In the example above, the `flights` tidy data sheet has the columns `year`, `month`, etc...  and each row is a commercial airline flight.  The flights data sheet does not store the weather because it would be inefficient.  All flight departing at the same time from the same airport have the same weather.  There is a separate `weather` tidy data sheet where each row represents the weather at a given time at a given airport.  Because `flights` and `weather` have common columns, they can be linked together by those columns (aka Keys), and the weather for a given flight can be queried. 

For the data in your projects, you will generally have at least a `specimens` tidy data file that stores the information you've collected on each specimen, as well as a `sampling location` tidy data file that stores the information about the locations from which the specimens were collected.  The common column between the two files should be `location_id`. In the `sampling_location` file, each sampling location is listed once and the `location_id` column is a *primary key*.  In the `specimens` data file, the same location will occur in several rows if several specimens were collected from a location and the `location_id` column is a *foreign_key*.  As you add more tidy data files to your relational database, you will want to be sure you have matching primary and foreign keys to link them to the existing files.

---

## Naming Files and Columns

All files and columns should be named using human readable and understandable words (not abbreviations).  The contents of the file and the columns should be self evident from their names.

---

## Directory Structure

All raw data files should be stored in you `git` repository in a directory named `data`.  Avoid unnecessary creation of additional directories and especially try to avoid nesting directories unless neccessary for organizational purposes (avoid creating a maze).  One rule to follow is that for every dir you create, you need to put a `README.md` in that dir to describe the contents.

---

## Documentation of Data Files and Organization

A `README.md` file should occur in every dir and should describe the files and their contents.  It's also a good idea to make a diagram, like Fig 2 above, describing the relationships among your data files.
