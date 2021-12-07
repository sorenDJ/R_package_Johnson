#'For fun and need some stress relief from data analysis
#'
#'@param cool_beans a string, needs to be in quotes
#'@usage
#'Cool_beans("Cool beans")
#'@export

Cool_beans <- function(cool_beans){
  if(cool_beans %in% c("cool beans", "Cool beans", "Cool Beans")){
    browseURL("https://www.youtube.com/watch?v=TOUrLn1FFCA")}
    else{
      return("Not cool beans")
  }
}