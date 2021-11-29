#Create a structure/admixture plot through LEA using snmf
#'
#'
#'
#'
#'


snmf_structure_plot <- function(project_name, K, colors){
  best <- which.min(cross.entropy(project_name, K = K))
  structure_plot <- barchart(project_name, K = K, run = best, border = NA, space = 0, col = colors, xlab = "Individuals", ylab = "Ancestry Proportions", main = "Ancestry Matrix")
  axis(1, at = 1:length(structure_plot$order), labels = structure_plot$order, las = 1, cex.axis = .4)
  return(structure_plot)
}