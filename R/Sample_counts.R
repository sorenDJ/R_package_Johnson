#' Use to check number of samples with a certain variable and then filter out samples that have a certain value for that varaible and create a new csv file with those samples
#'
#'need tidyverse package
#'@param file a csv file with the sample data
#'@param na_values list of values in csv file to be treated as NA values
#'@param col2count the column in the csv file to use as the variable to see how many sample belong to each variable
#'@param output_csv the file path and name of the csv file with the filtered data
#'@param filter list of values for the selected column that is to be filtered into a new csv file
#'@usage
#' samp_2B_seq(file = "/cloud/project/data/DNA_Samples_Data_Analysis.csv", na_values = c("", "na"), col2count = strange_topology, output_csv = "/cloud/project/Output_files/test_output.csv", filter = c("yes", NA))
#'@export

samp_2B_seq <- function(file, na_values, col2count, output_csv, filter){
  sample_data <- read_csv(file = file, na = na_values)
  counts <- sample_data %>% 
    count({{col2count}})
  filtered_data <- sample_data %>% 
    filter({{col2count}} %in% filter)
  if(is.data.frame(filtered_data) == FALSE){
    return("filtered data is not a data frame")
  }
  write.csv(filtered_data, file = output_csv)
  return(counts)
  
}