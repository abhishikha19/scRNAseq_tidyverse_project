library(tidyverse)

dir.create("results", showWarnings = FALSE, recursive = TRUE)

meta <- read_csv("data/cell_metadata.csv")

qc_summary <- meta %>%
  group_by(cell_type) %>%
  summarise(
    n_cells = n(),
    mean_counts = mean(nCount_RNA),
    mean_features = mean(nFeature_RNA),
    mean_percent_mt = mean(percent_mt),
    .groups = "drop"
  )

write_csv(qc_summary, "results/qc_summary.csv")

filtered_meta <- meta %>%
  filter(nFeature_RNA > 200,
         nCount_RNA > 500,
         percent_mt < 10)

write_csv(filtered_meta, "results/filtered_cells.csv")

print(qc_summary)
