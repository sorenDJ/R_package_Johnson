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

op_K_snmf <- function(vcf_file, K, new_name, repetitions){
  convert_output <- vcf2geno(vcf_file, new_name)
  snmf_project = snmf(new_name, K = K, entropy = TRUE, repetitions = repetitions, project = "new")
  cross_entropy_plot <- plot(snmf_project, cex = 1.2, col = 'lightblue', pch = 19)
  summary(snmf_project)
  return(cross_entropy_plot)
}