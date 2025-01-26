# SCRIPTS

Directory Purpose: This directory contains **all scripts** used for data processing, analysis, visualization, and any other computational steps in your project workflow. 

---

## Script Descriptions 

Each script should be named descriptively to indicate its function/ purpose, inputs and outputs. For example:

* `data_cleaning.R`: Script used to clean and tidy the raw plant growth data.
	* Inputs: `../data/growth_measurements.csv`
	* Outputs: `../data/growth_measurements_cleaned.csv`
	* Scripts Sourced: NA
* `regression_analysis_script.R`: Script used to perform regression analysis on the cleaned data.
	* Inputs: `../data/growth_measurements_cleaned.csv`
	* Outputs: `../results/growth_analysis_output.csv`, `../results/summary_plots.pdf`
	* Scripts Sourced: NA

---

## Input/Output Map
| Script | Inputs | Outputs |
|--------|--------|---------|
| `01_data_cleaning.R` | `../data/raw/specimens.csv` | `../data/processed/specimens_tidy.csv` |

---

## Workflow Order
1. `01_data_cleaning.R`
2. `02_merge_datasets.py`
3. `03_analysis.Rmd`

---

## Script Relationship Diagram

* A relationship diagram depicting the interdepencenies of the scripts, their inputs and their outputs can be useful if there is complexity

---

## Execution Instructions 

Basic instructions on how to run each script, including any dependencies or required input files.

## Notes or Instructions
- Document script dependencies (e.g., required R packages, Python libraries) either here or within each script.  
- Use consistent naming conventions and keep script functionality modular and transparent.
