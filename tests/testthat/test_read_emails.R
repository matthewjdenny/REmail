library(REmail)
context("read_emails")

test_that("reading in emails to data.frame works.", {
  files <- get_file_paths()
  emails <- read_emails(files)
})
