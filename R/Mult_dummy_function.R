#' Multiply together two numbers
#' 
#' @param x A number
#' @param y Another number
#' @return product The product of multiply x and y
#' @usage 
#' mult(4, 5)
#' mult(5, 3)

mult <- function(x,y){
  product <- x*y
  if(is.numeric(product) == FALSE){ 
    return("ERROR- Non-numeric")
  }
  return(product)
}