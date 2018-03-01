#' A function to extract To, From, Date, Subject, and Message fields from a plain text email.
#' 
#' @param email_file The full path to the email file.
#' @return An object of class Email that contains the following members: to, from, CC, subject, date, message, message_tokenized, subject_tokenized, num_recipients, all_tokens, num_tokens
#' @examples
#' files <- get_file_paths()
#' MyEmail <- Read_In_Email(files[1])
#' @export
Read_In_Email <- function(email_file){
  email1 = new("Email",filename = email_file)
  email1 = getElement(email1)
  email1 = Clean_Email_Input(email1)
  return(email1)
}