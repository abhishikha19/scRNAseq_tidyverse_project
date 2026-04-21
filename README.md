# Exploratory Single-Cell RNA-seq Analysis Using tidyverse

## Overview
This mini project demonstrates exploratory analysis of single-cell RNA-seq data using **tidyverse** in R. It covers metadata cleaning, cell-level quality control, marker gene analysis, and visualization of cell-type-specific expression patterns.

## Project Goals
- Inspect single-cell quality control metrics
- Summarize cell-level metadata across cell populations
- Analyze marker gene expression across cell types
- Build a tidyverse-based workflow for exploratory transcriptomics analysis
- Create a portfolio-ready GitHub project

## Project Structure
```text
scRNAseq_tidyverse_project/
├── data/
│   ├── cell_metadata.csv
│   └── gene_expression.csv
├── scripts/
│   ├── 01_load_and_clean.R
│   ├── 02_qc_analysis.R
│   ├── 03_marker_analysis.R
│   └── 04_visualization.R
├── results/
│   └── figures/
└── README.md
```

## Marker Genes
- **CD3D**: T-cell marker
- **MS4A1**: B-cell marker
- **LYZ**: Monocyte marker

## Requirements
```r
install.packages(c("tidyverse", "janitor"))
```

## How to Run
1. Open the project in RStudio
2. Run the scripts in numerical order
3. Review summary tables in `results/`
4. Review generated plots in `results/figures/`

## Skills Demonstrated
- Data wrangling with `dplyr`
- Data import with `readr`
- Data cleaning with `janitor`
- Group-wise summaries
- Joining metadata and expression tables
- Visualization with `ggplot2`
- Exploratory single-cell transcriptomics analysis

## Suggested Extensions
- Add UMAP coordinates and clustering plots
- Integrate Seurat-derived metadata
- Compare samples or conditions
- Add pseudobulk summaries
- Extend to differential expression analysis

## Author
Dr. Abhishikha Sharma
