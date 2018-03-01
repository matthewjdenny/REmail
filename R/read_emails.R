#' A function to extract To, From, Date, Subject, and Message fields from a  
#' collection of emails saved as plain text.
#' 
#' @param email_files A character vector containing the full paths to the email 
#' files to be processed.
#' @return An data.frame with the following columns: to, from, CC, subject, 
#' date, message, message_tokenized, subject_tokenized, num_recipients, 
#' all_tokens, num_tokens
#' @examples
#' files <- get_file_paths()
#' emails <- read_emails(files)
#' @export
read_emails <- function(email_files){
  
  if (class(email_files) != "character") {
    stop("email_files must be a character vector containing file paths to email txt files..." )
  }
  
  num_emails <- length(email_files)
  
  # create dataframe to store emails 
  emails <- data.frame(subject = rep("", num_emails),
                       to = rep("", num_emails),
                       from = rep("", num_emails),
                       message = rep("", num_emails),
                       date = rep("", num_emails),
                       CC = rep("", num_emails),
                       filename = rep("", num_emails),
                       num_tokens = rep(0, num_emails), 
                       num_recipients = rep(0, num_emails),
                       stringsAsFactors = FALSE)
  
  # loop over emails:
  for (i in 1:num_emails) {
    if (i %% 100 == 0) {
      cat("\n\nProcessing email",i,"of",num_emails,"\n\n\n")
    }
    
    email <- Read_In_Email(email_files[i])
    
    
    
    emails$subject[i] <- email@subject
    emails$to[i] <- paste0(email@to, collapse = "; ")
    emails$from[i] <- email@from
    emails$message[i] <- email@message
    emails$date[i] <- email@date
    emails$CC[i] <- paste0(email@CC, collapse = "; ")
    emails$filename[i] <- email@filename
    emails$num_tokens[i] <- email@num_tokens
    emails$num_recipients[i] <- email@num_recipients
    emails$subject[i] <- email@subject
  }
  
  return(emails)
}