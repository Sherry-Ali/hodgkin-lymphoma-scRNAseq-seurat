# ============================================================
# 07 Automated Cell Type Annotation (SingleR)
# ============================================================

library(Seurat)
library(SingleR)
library(celldex)

HL <- readRDS("HL_06_markers.rds")

ref_db <- HumanPrimaryCellAtlasData()
test_data <- GetAssayData(HL, layer = "data")

predictions <- SingleR(
  test = test_data,
  ref = ref_db,
  labels = ref_db$label.main,
  clusters = HL$seurat_clusters
)

HL$SingleR_labels <- predictions$labels[match(HL$seurat_clusters, rownames(predictions))]
Idents(HL) <- "SingleR_labels"

saveRDS(HL, "HL_07_annotated.rds")
