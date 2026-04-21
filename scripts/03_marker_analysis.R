library(tidyverse)

dir.create("results", showWarnings = FALSE, recursive = TRUE)

meta <- read_csv("data/cell_metadata.csv")
expr <- read_csv("data/gene_expression.csv")

marker_genes <- c("CD3D", "MS4A1", "LYZ")

marker_summary <- expr %>%
  filter(gene %in% marker_genes) %>%
  left_join(meta, by = "cell_id") %>%
  group_by(cell_type, gene) %>%
  summarise(
    mean_expression = mean(expression, na.rm = TRUE),
    median_expression = median(expression, na.rm = TRUE),
    n_cells = n(),
    .groups = "drop"
  )

write_csv(marker_summary, "results/marker_summary.csv")

print(marker_summary)
