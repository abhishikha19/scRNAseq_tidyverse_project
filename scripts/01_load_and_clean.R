library(tidyverse)
library(janitor)

meta <- read_csv("data/cell_metadata.csv") %>%
  clean_names()

expr <- read_csv("data/gene_expression.csv") %>%
  clean_names()

cat("\n=== Metadata overview ===\n")
glimpse(meta)

cat("\n=== Expression overview ===\n")
glimpse(expr)

meta_summary <- meta %>%
  summarise(
    total_cells = n(),
    unique_cell_types = n_distinct(cell_type),
    unique_samples = n_distinct(sample)
  )

expr_summary <- expr %>%
  summarise(
    total_records = n(),
    unique_genes = n_distinct(gene),
    unique_cells = n_distinct(cell_id)
  )

print(meta_summary)
print(expr_summary)
