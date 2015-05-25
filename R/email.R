#library(methods)
# defining a class Email which can be used to parse emails.
Email<-setClass(
  "Email",
  slots=list(other_elements="vector",subject="character",to="character",from="character",message="character",subject_tokenized = "character", message_tokenized = "character",date="character",CC ="character",filename="character",all_tokens = "character",num_tokens = "numeric", num_recipients = "numeric"),
  # Need to modify this validity function to ensure that the object is created only when filename is specified in the arguments
  validity=function(object){
  	if (!file.exists(object@filename)){
  		return(paste("This file doesn't exist ",object@filename))
  	}
  }
)


# Reserve method name getElement
setGeneric(name="getElement",
	def=function(object,element){
		standardGeneric("getElement")
	}
)
# Define method getElement
setMethod(f="getElement",
	signature="Email",
	definition=function(object){
		filename = object@filename
    cat("Processing Email:", filename,"\n")
		path <- paste(system.file(package="REmail"), "parse.py", sep="/")
    
		command <- paste("python", path, filename, "to", sep = " ")
		try(suppressWarnings(response <- system(command, intern=T)), silent = T)
		if(!is.null(attr(response,"status"))){
      if(attr(response,"status") == 1){
        response <- ""
        cat("To Field Empty \n")
      }
		}  
		object@to = response
    
		command <- paste("python", path, filename, "from", sep = " ")
		try(suppressWarnings(response <- system(command, intern=T)), silent = T)
		if(!is.null(attr(response,"status"))){
		  if(attr(response,"status") == 1){
		    response <- ""
		    cat("From Field Empty \n")
		  }
		}
		object@from = response
    
		command <- paste("python", path, filename, "date", sep = " ")
		try(suppressWarnings(response <- system(command, intern=T)), silent = T)
		if(!is.null(attr(response,"status"))){
		  if(attr(response,"status") == 1){
		    response <- ""
		    cat("Date Field Empty \n")
		  }
		}
		object@date = response
    
		command <- paste("python", path, filename, "message", sep = " ")
		try(suppressWarnings(response <- system(command, intern=T)), silent = T)
		if(!is.null(attr(response,"status"))){
		  if(attr(response,"status") == 1){
		    response <- ""
		    cat("Message Field Empty \n")
		  }
		}
		object@message = response
    
		command <- paste("python", path, filename, "subject", sep = " ")
		try(suppressWarnings(response <- system(command, intern=T)), silent = T)
		if(!is.null(attr(response,"status"))){
		  if(attr(response,"status") == 1){
		    response <- ""
		    cat("Subject Field Empty \n")
		  }
		}
		object@subject = response
    
    command <- paste("python", path, filename, "cc", sep = " ")
    try(suppressWarnings(response <- system(command, intern=T)), silent = T)
		if(!is.null(attr(response,"status"))){
		  if(attr(response,"status") == 1){
		    response <- ""
		    cat("CC Field Empty \n")
		  }
		}
    object@CC = response
    
		return(object)
	}
)
