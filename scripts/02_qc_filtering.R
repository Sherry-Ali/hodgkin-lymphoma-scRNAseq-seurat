# ============================================================
# 02 Quality Control & Filtering
# ============================================================

library(Seurat)
library(Matrix)

HL <- readRDS("HL_01_raw.rds")

mt_genes <- grep("^MT-", rownames(HL), value = TRUE)

counts_matrix <- GetAssayData(HL, assay = "RNA", layer = "counts")
HL$percent.mt <- Matrix::colSums(counts_matrix[mt_genes, , drop = FALSE]) /
                 Matrix::colSums(counts_matrix) * 100

HL <- subset(
  HL,
  subset = nFeature_RNA > 200 &
           nFeature_RNA < 1200 &
           percent.mt < 5
)

saveRDS(HL, "HL_02_qc.rds")
