#' Produce a .txt file with needed information for population data
#' 
#' need tidyverse package
#' @param file the file path to the csv file to be converted to text file
#' @param columns the columns in the csv file that are to be kept for the text file
#' @param sample_col the column that has the sample numbers/names that will be used to select certain rows
#' @param samples the samples that are to be kept for the text file
#' @param NA_values values in the csv file that should be read as NA values
#' @param output_file the file path for the output text file
#' @usage
#' pop_data_output(file = "/cloud/project/data/DNA_Samples_Data_Analysis.csv", columns = c(SJ_number, Species, sub_species), sample_col = SJ_number, samples = c("AR01", "AR02", "AR03"), NA_values = c("", "na"), output_file = "/cloud/project/test_pop_data.txt")
#' @export

pop_data_output <- function(file, columns, sample_col, samples, NA_values, output_file){
  data <- read_csv(file = file, col_select = {{columns}}, na = NA_values)
    filtered_data <- data %>% 
    filter({{sample_col}} %in% samples) 
  write.table(filtered_data, output_file, sep = "\t", row.names = FALSE)
  if(is.data.frame(filtered_data) == FALSE){
    return("ERROR-- Not dataframe")
  }
   return(filtered_data)
  
}
