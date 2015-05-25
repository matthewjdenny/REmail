# REmail

An R package for Email Data Processing. This package will be significantly expanded over the next 
few weeks to include a spam filter and the ability to handle massive complex email datasets automatically 
with the ability to generate data in a format that can be easily used with the 
[ContentStructure](https://github.com/matthewjdenny/ContentStructure) package
we are also currently developing which can also be downloaded from Git. 

## Installation

To install this package from git, you will need to Hadley Wickham's devtools package installed.

    install.packages("devtools")
    library("devtools")
    
Now we can install from Github using the following line:

    devtools::install_github("matthewjdenny/REmail")

I have  had success installing with R 3.2.0+ installed but if you do not have the latest 
version of R installed, it should work as long as you install the dependencies first with
the following block of code:

    install.packages( pkgs = c("R.methodsS3","rPython", dependencies = TRUE)

## Examples

Currently this package only implements a single function `Read_In_Email()` which will extract 
the To, From, Cc, Date, Subject, and Message fields from and email and handle exceptions if 
any are missing. Here is some example code:

    My_Email <- Read_In_Email("path/to/email.txt")

Please let me know if you run into any problems by emailing me at <mzd5530@psu.edu>.
