# ============================================================
# Hodgkin Lymphoma scRNA-seq Pipeline
# Master Script: run_all.R
# Author: Sherry Ali
# ============================================================

message("------------------------------------------------------------")
message(" HL scRNA-seq Pipeline — Starting")
message("------------------------------------------------------------")

scripts <- c(
  "scripts/01_load_data.R",
  "scripts/02_qc_filtering.R",
  "scripts/03_normalization_hvg.R",
  "scripts/04_pca_dimensionality.R",
  "scripts/05_clustering_umap_tsne.R",
  "scripts/06_markers.R",
  "scripts/07_singler_annotation.R"
)

run_step <- function(script_path) {
  message("\n▶ Running: ", script_path)
  tryCatch(
    {
      source(script_path)
      message("✔ Completed: ", script_path)
    },
    error = function(e) {
      message("✖ Error in: ", script_path)
      message("  → ", e$message)
      stop("Pipeline halted.")
    }
  )
}

for (s in scripts) {
  run_step(s)
}

message("\n------------------------------------------------------------")
message(" HL scRNA-seq Pipeline — Completed Successfully")
message(" Output: HL_07_annotated.rds")
message("------------------------------------------------------------")
