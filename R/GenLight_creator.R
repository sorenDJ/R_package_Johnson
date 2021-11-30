#'
#'
#'
#'
#'
#'

genlight_creator <- function(vcf_file, pop_data, genlight_name, pop_col){
  new_vcf_object.VCF <- read.vcfR(vcf_file)
  new_vcf_object.VCF
  pop.data <- read.table(pop_data, sep = "\t", header = TRUE)
  all(colnames(new_vcf_object.VCF@gt)[-1] == pop.data$sample)
  genlight_name <- vcfR2genlight(new_vcf_object.VCF)
  ploidy(genlight_name) <- 2
  pop(genlight_name) <- pop.data$pop_col
  assign(genlight_name, genlight_name, envir = .GlobalEnv)
  return(genlight_name)
}