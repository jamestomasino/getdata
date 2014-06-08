#!/usr/bin/env Rscript

## Question 3
## Download the Excel spreadsheet on Natural Gas Aquisition Program here: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 
##
## Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
##    dat
## What is the value of:
##    sum(dat$Zip*dat$Ext,na.rm=T)
## (original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)

if("xlsx" %in% rownames(installed.packages()) == FALSE) {install.packages("xlsx")}
library(xlsx)

## Set working directory
setwd("/Users/tomasino/Sites/personal/getdata/quiz1")

## Create data folder for working data
if (!file.exists("data")) {
	dir.create("data")
}

if (!file.exists("./data/gas.xlsx")) {
	## Get working data and add it to working data folder
	fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
	download.file(
		url = fileURL, 
		destfile = "./data/gas.xlsx", 
		method = "curl")
	list.files ("./data")
	
	## Timestamp download
	dateDownloaded <- date()
	dateDownloaded
}

## Read in data
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx(
	"./data/gas.xlsx", 
	sheetIndex=1, 
	header=TRUE, 
	colIndex=colIndex, 
	rowIndex=rowIndex)

## Perform mystery operation from quiz
result <- sum(dat$Zip*dat$Ext,na.rm=T)

## print result
print(result)
