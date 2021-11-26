#' Produce a .txt file with needed information for population data
#' 
#' 
#' 
#' 
#' 

pop_data_output <- function(file, columns, sample_col, samples, NA_values){
  data <- read_csv(file = file, col_select = {{columns}}, na = NA_values)
#  filtered_data <- filter(data, {{sample_col}} %in% samples)
    filtered_data <- data %>% 
    filter({{sample_col}} %in% samples) 
  write.table(filtered_data, "pop_output_file.txt", sep = "\t", row.names = FALSE)
   return(filtered_data)
  
}
