#!/usr/bin/env Rscript

## How many characters are in the 10th, 20th, 30th and 100th lines of HTML 
## from this page:
## 
##     http://biostat.jhsph.edu/~jleek/contact.html
## 
## (Hint: the nchar() function in R may be helpful)

## Use the following paths for data
remoteURL <- "http://biostat.jhsph.edu/~jleek/contact.html"

## Make HTML connection and get contents
con <- url(remoteURL)
htmlCode <- readLines(con)
close (con)

## Get lengths of each line
lengths <- nchar(htmlCode)

## Vector of specific lengths
charLens <- c( lengths[10], lengths[20], lengths[30], lengths[100] )

## output
print (charLens)
