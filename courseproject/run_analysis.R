#!/usr/bin/env Rscript

## Function to check for and load dependency libraries automatically
depend <- function (s) {
	if (s %in% rownames(installed.packages()) == FALSE) {install.packages(s)}
	library(s, character.only=TRUE)
}

## Function to return activity name by number
actName <- function (num) {
	activities$V2[ activities[,"V1"] == num ]
}

## List of library dependencies
#depend("sqldf")

## Read Features List (to be used as column names for data)
features <- read.table("features.txt")

## Read ActivityList (to add descriptive names to data set)
activities <- read.table("activity_labels.txt")

## Append a new column name (for data merged in from label)
features[length(features)+1] <- "activity"

## Read data sets
testData <- read.table("test/X_test.txt")
trainData <- read.table("train/X_train.txt")

## Read in data labels
testLabel <- read.table("test/y_test.txt")
trainLabel <- read.table("train/y_train.txt")

## Assign Activity name to data sets in activity column
testData$activity <- apply(
	testData, 
	1, 
	function(row) actName(testLabel[row]) )
trainData$activity <- apply(
	trainData, 
	1, 
	function(row) actName(trainLabel[row]) )

## Assign column names to data sets
names(testData) <- features$V2
names(trainData) <- features$V2

## Combine the two datasets to one
totalData <- rbind(testData, trainData)

## Clean up source tables to save memory
rm(testData)
rm(trainData)

# Extract only the measurements on the mean and standard deviation for each measurement
# Name activities in data set
# Add labels to all variables
# Add average of each variable for each activity and subject to data set
# Export data set to clean file
