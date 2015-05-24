Read_In_Email <- function(email_file){
  email1 = new("Email",filename=email_file)
  email1 = getElement(email1,"to")
  email1@subject
}