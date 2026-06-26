# ============================================================
# 03 Normalization & HVG Selection
# ============================================================

library(Seurat)

HL <- readRDS("HL_02_qc.rds")

HL <- NormalizeData(HL)
HL <- FindVariableFeatures(HL, selection.method = "vst", nfeatures = 2000)

saveRDS(HL, "HL_03_norm_hvg.rds")
