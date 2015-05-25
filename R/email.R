#library(methods)
# defining a class Email which can be used to parse emails.
Email<-setClass(
  "Email",
  slots=list(different_elements="vector",subject="character",to="character",from="character",message="character",date="character",CC ="character",filename="character"),
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
		path <- paste(system.file(package="REmail"), "parse.py", sep="/")
		command <- paste("python", path, filename, "to", sep = " ")
		response <- system(command, intern=T)
		object@to = response
		command <- paste("python", path, filename, "from", sep = " ")
		response <- system(command, intern=T)
		object@from = response
		command <- paste("python", path, filename, "date", sep = " ")
		response <- system(command, intern=T)
		object@date = response
		command <- paste("python", path, filename, "message", sep = " ")
		response <- system(command, intern=T)
		object@message = response
		command <- paste("python", path, filename, "subject", sep = " ")
		response <- system(command, intern=T)
		object@subject = response
    command <- paste("python", path, filename, "cc", sep = " ")
    response <- NULL
    try(response <- system(command, intern=T), silent = T)
    object@subject = response
		object
	}
	
)
