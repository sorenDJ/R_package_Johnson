#'
#'
#'
#'
#'
#'

samp_2B_seq <- function(file, na_values, col2count, output_csv, filter){
  sample_data <- read_csv(file = file, na = na_values)
  counts <- sample_data %>% 
    count({{col2count}})
  filtered_data <- sample_data %>% 
    filter({{col2count}} %in% filter)
  write.csv(filtered_data, file = output_csv)
  return(counts)
    
}