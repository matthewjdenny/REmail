\name{getElement}
\alias{getElement}
\title{
A helper function to get an element out of an email data object.
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
getElement(object, element)
}
\arguments{
  \item{object}{
%%     ~~Describe \code{object} here~~
}
  \item{element}{
%%     ~~Describe \code{element} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\author{
%%  ~~who you are~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
structure(function (object, element) 
{
    standardGeneric("getElement")
  }, generic = structure("getElement", package = "REmail"), package = "REmail", group = list(), valueClass = character(0), signature = c("object", 
"element"), default = `\001NULL\001`, skeleton = (function (object, 
    element) 
stop("invalid call in method dispatch to 'getElement' (no default method)", 
    domain = NA))(object, element), class = structure("nonstandardGenericFunction", package = "methods"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
