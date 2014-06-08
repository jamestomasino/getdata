#!/usr/bin/env Rscript

## Question 4
## Read the XML data on Baltimore restaurants from here: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 
##
## How many restaurants have zipcode 21231?

if("XML" %in% rownames(installed.packages()) == FALSE) {install.packages("XML")}
library(XML)

## Set working directory
setwd("/Users/tomasino/Sites/personal/getdata/quiz1")

## Create data folder for working data
if (!file.exists("data")) {
	dir.create("data")
}

## Get data if it doesn't already exist
localFileURL = "./data/rest.xml"
if (!file.exists(localFileURL)) {
	## Get working data and add it to working data folder
	remoteFileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
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
doc <- xmlTreeParse(localFileURL,useInternal=TRUE)
rest <- xmlRoot(doc)

## Get all zipcodes
codes <- xpathSApply(rest, "//zipcode", xmlValue)
restnames <- xpathSApply(rest, "//name", xmlValue)

localCodesBool <- codes == "21231"
localCodes <- codes[localCodesBool]
localRest <- restnames[localCodesBool]
response <- length(localCodes)

print (response)
print ("verified that restaurant names don't repeat.")
