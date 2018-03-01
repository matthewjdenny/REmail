#' A function the returns the file paths to example emails for testing.
#'
#' @return A vector of file paths
#' @export
get_file_paths <- function(){

  f1 <- system.file("extdata", "email_1.txt", package = "REmail")[1]
  f2 <- system.file("extdata", "email_2.txt", package = "REmail")[1]
  f3 <- system.file("extdata", "email_3.txt", package = "REmail")[1]
  
  
  files <- c(f1,f2,f3)
 
  return(files)
}
