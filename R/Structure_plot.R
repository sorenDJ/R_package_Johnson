#'Create a structure/admixture plot through LEA using snmf
#'
#'need LEA package
#'@param project_name the project name that was created through snmf and using the SNMF_Analysis function. Can also be any snmf Project
#'@param K the number of populations that are to be used for the structure analysis
#'@param colors a list of colors to be used for the structure plot, need the same amount of colors as K
#'@usage
#' snmf_structure_plot(project_name = snmf_test_2, K = 4, colors = c("green", "blue", "purple", "red"))
#'@export


snmf_structure_plot <- function(project_name, K, colors){
  best <- which.min(cross.entropy(project_name, K = K))
  if(K != length(colors)){
    return("Number of colors does not equal K")
  }
  structure_plot <- barchart(project_name, K = K, run = best, border = NA, space = 0, col = colors, xlab = "Individuals", ylab = "Ancestry Proportions", main = "Ancestry Matrix")
  axis(1, at = 1:length(structure_plot$order), labels = structure_plot$order, las = 1, cex.axis = .4)
  return(structure_plot)
}