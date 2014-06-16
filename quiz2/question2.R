#!/usr/bin/env Rscript

## Question 2
## 
## The sqldf package allows for execution of SQL commands on R data frames. 
## We will use the sqldf package to practice the queries we might send with 
## the dbSendQuery command in RMySQL. Download the American Community Survey 
## data and load it into an R object called

##     acs

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

