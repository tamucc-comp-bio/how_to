# Results

## Directory Purpose
This directory contains **final or near-final outputs** such as analyzed data files, figures, plots, tables, and summary reports suitable for publication or inclusion in a thesis/manuscript.

## Key Findings
1. Significant size variation between sites (p<0.01)
2. Temperature correlation: r=0.72

## File Descriptions
- **(example) `growth_analysis_output.csv`**  
  - Created by: `../scripts/analysis_growth.R`  
  - Contains regression coefficients, p-values, and summary statistics related to plant growth.  

- **(example) `growth_plots.pdf`**  
  - Created by: `../scripts/analysis_growth.R`  
  - Collection of scatter plots, bar charts, and boxplots visualizing the relationships in the data.  

## File Legend
| Figure | Script Source | Description |
|--------|---------------|-------------|
| `fig1.png` | `scripts/03_analysis.Rmd` | Size distribution by site |
| `table1.csv` | `scripts/03_analysis.Rmd` | ANOVA results |

## Notes or Instructions
- Do *not* manually edit files here; they should be produced entirely by scripts to ensure reproducibility.  
- If there are multiple experiments or sub-projects, consider creating subdirectories (e.g., `results/experiment1`, `results/experiment2`) to keep final outputs organized.
