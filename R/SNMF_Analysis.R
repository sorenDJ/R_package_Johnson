#Run a population structure analysis using a sparse non-negative matrix factorization algorithm
#'
#'
#'
#'
#'
#Need code below to install LEA
#if (!requireNamespace("BiocManager", quietly = TRUE))
#install.packages("BiocManager")

#BiocManager::install("LEA")

op_K_snmf <- function(vcf_file, K, new_name, repetitions, project_name){
  convert_output <- vcf2geno(vcf_file, new_name)
  assign(project_name, snmf(new_name, K = K, entropy = TRUE, repetitions = repetitions, project = "new"), envir = .GlobalEnv)
  project_name <- snmf(new_name, K = K, entropy = TRUE, repetitions = repetitions, project = "new")
  cross_entropy_plot <- plot(project_name, cex = 1.2, col = 'lightblue', pch = 19)
  summary_1 <- summary(project_name)
  return(summary_1)
  return(cross_entropy_plot)
}