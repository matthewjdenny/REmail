library(methods)
# defining a class Email which can be used to parse emails.
Email<-setClass(
  "Email",
  slots=list(different_elements="vector",subject="character",filename="character"),
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
	definition=function(object,element){
		filename = object@filename
		string_execute=paste("python parse.py ",filename,element,sep=" ")
		output_obtained=system(string_execute,intern=TRUE)
		object@subject = output_obtained
		object
	}
	
)
