#'Creates a genlight object from a vcf file that can be used in adegent package to look at population structure
#'
#'need packages ape, poppr, vcfR
#'@param vcf_file the path to the vcf file that will be used to create the genlight object
#'@param pop_data a text file with the samples and population data to be analyzed, should have a heading for each of the columns
#'@param genlight_name the name of the output genelight object, needs to be in quotes
#'@param sample_col the name of the column that contains the sample names
#'@param pop_col the column from the population text file to be used as the population data
#'@usage
#' genlight_creator(vcf_file = "c_ven_phy_50_pop.vcf", pop_data = "c_ven_pop_5.txt", genlight_name = "gl.test", sample_col = sample, pop_col = sub_species)
#'@export

genlight_creator <- function(vcf_file, pop_data, genlight_name, sample_col, pop_col){
  new_vcf_object.VCF <- read.vcfR(vcf_file)
  new_vcf_object.VCF
  pop.data <- read.table(pop_data, sep = "\t", header = TRUE)
  all(colnames(new_vcf_object.VCF@gt)[-1] == pop.data$sample_col)
  genlight_1 <- vcfR2genlight(new_vcf_object.VCF)
  ploidy(genlight_1) <- 2
  pop(genlight_1) <- pop.data$pop_col
  assign(genlight_name, genlight_1, envir = .GlobalEnv)
  if(is.ggplot(genlight_name) == TRUE){
    return("Error-- What is going on")
  }
  return(genlight_name)
}