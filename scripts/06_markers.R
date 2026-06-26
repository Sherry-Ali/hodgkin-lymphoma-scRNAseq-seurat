# ============================================================
# 06 Marker Gene Identification
# ============================================================

library(Seurat)
library(dplyr)

HL <- readRDS("HL_05_clustered.rds")

HL.markers <- FindAllMarkers(HL, only.pos = TRUE)

write.csv(HL.markers, "HL_markers.csv", row.names = FALSE)

saveRDS(HL, "HL_06_markers.rds")
