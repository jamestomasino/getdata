#!/usr/bin/env Rscript

## Read this data set into R and report the sum of the numbers in the fourth 
## column.

##   https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for 

depend <- function (s) {
	if (s %in% rownames(installed.packages()) == FALSE) {install.packages(s)}
	library(s, character.only=TRUE)
}

## Create data folder for working data
if (!file.exists("data")) {
	dir.create("data")
}

## Use the following paths for data
localURL <- "./data/wksst8110.for"
remoteURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

if (!file.exists(localURL)) {
	## Get working data and add it to working data folder
	download.file(
		url = remoteURL, 
		destfile = localURL,
		method = "curl")
	
	## Timestamp download - What purpose does this serve?
	dateDownloaded <- date()
	dateDownloaded
}

## Read working data
raw <- read.fwf(
			localURL,
			widths=c(12, 7,4, 9,4, 9,4, 9,4),
			skip=4, 
			header=FALSE)
print (sum(raw$V4) )
