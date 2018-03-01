# REmail

An R package for email data ingestion. 

## Installation

To install this package from git, you will need to Hadley Wickham's devtools package installed.

    install.packages("devtools")
    library("devtools")
    
Now we can install from Github using the following line:

    devtools::install_github("matthewjdenny/REmail")

I have  had success installing with R 3.2.0+ installed but if you do not have the latest 
version of R installed, it should work as long as you install the dependencies first with
the following block of code:

    install.packages( pkgs = c("R.methodsS3","rPython","stringr"), dependencies = TRUE)

## Examples

This package only implements a function `Read_In_Email()` which will extract 
the To, From, Cc, Date, Subject, and Message fields from an email using Pythons email libraries and handle exceptions if 
any are missing. This function will return an object of class `Email` that has the following attributes:

* `@from` The email address of the sender (if provided) otherwise will simple store the value included in that field (such as "John Smith"
* `@to` A vector of email address (or strings, handled the same way as the `@from` field) of recipients included in the "To:" field of the email.
* `@CC` A vector of email address (or strings, handled the same way as the `@from` field) of recipients included in the "CC:" field of the email. If the field was left empty in the email, this simply stores "".
* `@subject` A string containing the plain text of the subject line.
* `@subject_tokenized` A string vector containing the lowercased plain text of the subject line with all punctuation removed except for "?" and "!".
* `@message` A string containing the plain text of the message body with newlines and blank lines removed.
* `@message_tokenized` A string vector containing the lowercased plain text of the message body with all punctuation removed except for "?" and "!".
* `@date` The date the message was sent in is raw format (will require further parsing) or "" if no date field was included.
* `@filename` The location of the email file on the user's computer.
* `@all_tokens` A vector concatenating together the cleaned tokens in `@subject_tokenized` and `@message_tokenized` to ease further text processing.
* `@num_tokens` The count of (cleaned) tokens in the subject and message.
* `@num_recipients` The total number of email addresses in the "To:" and "CC:" fields in the email.

Here is some example code:

    files <- get_file_paths()
    My_Email <- Read_In_Email(files[1)
    
If you instead want to process a collecton of emails to a data.frame, then use the following function:

    files <- get_file_paths()
    emails <- read_emails(files)

Please let me know if you run into any problems by emailing me at <mdenny@psu.edu>.
