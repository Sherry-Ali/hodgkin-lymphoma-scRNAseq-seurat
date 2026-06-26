# ============================================================
# 01 Load Data
# ============================================================

library(Seurat)
library(hdf5r)

h5_path <- "C:/Users/alial/OneDrive/Desktop/BMS_samples/HL/Targeted_NGSC3_DI_HodgkinsLymphoma_Pan_Cancer_raw_feature_bc_matrix.h5"

raw_counts <- Read10X_h5(h5_path)

HL <- CreateSeuratObject(
  counts = raw_counts,
  project = "HL_scRNAseq",
  min.cells = 3,
  min.features = 200
)

saveRDS(HL, "HL_01_raw.rds")
