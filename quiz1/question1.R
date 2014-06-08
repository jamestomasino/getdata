#!/usr/bin/env Rscript

## Question 1
## The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
##
## and load the data into R. The code book, describing the variable names is here: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
##
## How many housing units in this survey were worth more than $1,000,000?

## Set working directory
setwd("/Users/tomasino/Sites/personal/getdata/quiz1")

## Create data folder for working data
if (!file.exists("data")) {
	dir.create("data")
}

if (!file.exists("./data/idahohousing.csv")) {
	## Get working data and add it to working data folder
	fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
	download.file(
		url = fileURL, 
		destfile = "./data/idahohousing.csv", 
		method = "curl")
	list.files ("./data")
	
	## Timestamp download
	dateDownloaded <- date()
	dateDownloaded
}

## Read working data
housing <- read.csv("./data/idahohousing.csv")

## Get houses that are "housing units"
vals <- housing$VAL[housing$TYPE == 1]

## Remove the NA values
vals <- vals[!is.na(vals)]

## Get housing units that are over 1,000,000 in value
over1mil <- vals[vals >= 24]

## Count the results
numOver1Mil <- length(over1mil)

## Output
print(numOver1Mil)
