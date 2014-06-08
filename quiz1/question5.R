#!/usr/bin/env Rscript

if("data.table" %in% rownames(installed.packages()) == FALSE) {install.packages("data.table")}
library(data.table)

## Question 5
## The American Community Survey distributes downloadable data about 
## United States communities. Download the 2006 microdata survey about 
## housing for the state of Idaho using download.file() from here: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
##
## using the fread() command load the data into an R object
##    DT 
## Which of the following is the fastest way to calculate the average value 
## of the variable "pwgtp15" broken down by sex using the data.table package?

## Set working directory
setwd("/Users/tomasino/Sites/personal/getdata/quiz1")

## Create data folder for working data
if (!file.exists("data")) {
	dir.create("data")
}

## Get data if it doesn't already exist
localFileURL = "./data/housing.csv"
if (!file.exists(localFileURL)) {
	## Get working data and add it to working data folder
	remoteFileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
	download.file(
		url = remoteFileURL,
		destfile = localFileURL,
		method = "curl")
	list.files ("./data")
	
	## Timestamp download
	dateDownloaded <- date()
	dateDownloaded
}

## Read in data
DT <- fread(localFileURL)
