#' A function to extract To, From, Date, Subject, and Message fields from a plain text email.
#' 
#' @param email_file The full path to the email file.
#' @return An object of class Email that contains the relevant information
#' @examples
#' Read_In_Email("/Users/matthewjdenny/Dropbox/PINLab/Raw_Emails/2")
Read_In_Email <- function(email_file){
  email1 = new("Email",filename=email_file)
  email1 = getElement(email1)
  return(email1)
}