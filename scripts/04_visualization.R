library(tidyverse)

dir.create("results/figures", showWarnings = FALSE, recursive = TRUE)

meta <- read_csv("data/cell_metadata.csv")
expr <- read_csv("data/gene_expression.csv")

p1 <- meta %>%
  ggplot(aes(x = cell_type, y = nFeature_RNA, fill = cell_type)) +
  geom_boxplot() +
  theme_minimal() +
  labs(
    title = "Detected Genes per Cell Type",
    x = "Cell Type",
    y = "Number of Features"
  )

ggsave("results/figures/qc_features_by_celltype.png", p1, width = 7, height = 5)

p2 <- meta %>%
  ggplot(aes(x = percent_mt, fill = cell_type)) +
  geom_histogram(bins = 20, alpha = 0.7, position = "identity") +
  theme_minimal() +
  labs(
    title = "Mitochondrial Percentage Distribution",
    x = "Percent Mitochondrial Reads",
    y = "Cell Count"
  )

ggsave("results/figures/mt_distribution.png", p2, width = 7, height = 5)

marker_genes <- c("CD3D", "MS4A1", "LYZ")

p3 <- expr %>%
  filter(gene %in% marker_genes) %>%
  left_join(meta, by = "cell_id") %>%
  ggplot(aes(x = cell_type, y = expression, fill = cell_type)) +
  geom_boxplot() +
  facet_wrap(~ gene, scales = "free_y") +
  theme_minimal() +
  labs(
    title = "Marker Gene Expression Across Cell Types",
    x = "Cell Type",
    y = "Expression"
  )

ggsave("results/figures/marker_expression.png", p3, width = 10, height = 6)
