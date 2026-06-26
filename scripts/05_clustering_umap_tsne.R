# ============================================================
# 04 PCA & Dimensionality
# ============================================================

library(Seurat)

HL <- readRDS("HL_03_norm_hvg.rds")

HL <- ScaleData(HL)
HL <- RunPCA(HL, features = VariableFeatures(HL))

saveRDS(HL, "HL_04_pca.rds")
