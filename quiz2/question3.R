#!/usr/bin/env Rscript

## Using the same data frame you created in the previous problem, what is the 
## equivalent function to unique(acs$AGEP)

depend <- function (s) {
	if (s %in% rownames(installed.packages()) == FALSE) {install.packages(s)}
	library(s, character.only=TRUE)
}

depend("sqldf")

## Create data folder for working data
if (!file.exists("data")) {
	dir.create("data")
}

## Use the following paths for data
localURL <- "./data/acs.csv"
remoteURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

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
acs <- read.csv(localURL)

u <- unique(acs$AGEP)

u2 <- sqldf("select distinct AGEP from acs")
