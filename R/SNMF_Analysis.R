# Use a sparse non-negative matrix factorization algorithm to calculate optimal K and return snmf project
#'
#'@param vcf_file file path for the vcf file to be used for the analysis
#'@param K a range of numbers to be used to check the number of ancestral populations
#'@param new_name file path and name of the new converted .geno file
#'@param repetitions number of times the cross-validation should be run
#'@param project_name the name you want the snmf project to be called, needs to be in quotes
#'@usage
#' op_K_snmf(vcf_file = "/cloud/project/data/c_ven_phy_50_pop.vcf", K = 4:5, new_name = "/cloud/project/Output_files/test_2.geno", repetitions = 2, project_name = "snmf_test_2")
#'
#'@export

op_K_snmf <- function(vcf_file, K, new_name, repetitions, project_name){
  convert_output <- LEA::vcf2geno(vcf_file, new_name)
  if(is.numeric(repetitions) == FALSE){
    return("ERROR-- repitions is not numeric")
  }
  assign(project_name, snmf(new_name, K = K, entropy = TRUE, repetitions = repetitions, project = "new"), envir = .GlobalEnv)
  project_name <- LEA::snmf(new_name, K = K, entropy = TRUE, repetitions = repetitions, project = "new")
  cross_entropy_plot <- plot(project_name, cex = 1.2, col = 'lightblue', pch = 19)
  summary_1 <- summary(project_name)
  return(summary_1)
  return(cross_entropy_plot)
}