#!/usr/bin/env Rscript

## Function to check for and load dependency libraries automatically
depend <- function (s) {
	if (s %in% rownames(installed.packages()) == FALSE) {install.packages(s)}
	library(s, character.only=TRUE)
}

## List of library dependencies
#depend("sqldf")

## Function to return activity name by number
actName <- function (num) {
	activities$V2[ activities[,"V1"] == num ]
}

## Read Features List (to be used as column names for data)
featuresList <- read.table("features.txt", stringsAsFactors=FALSE)

## Append a new column name (for data merged in from label)
featuresList <- rbind(featuresList, c( nrow(featuresList)+1, "activity" ) )

## Use only names from features list
features <- featuresList$V2

## Read ActivityList (to add descriptive names to data set)
activities <- read.table("activity_labels.txt")

## Read data sets
testData <- read.table("test/X_test.txt")
trainData <- read.table("train/X_train.txt")

## Read in data labels
testLabel <- read.table("test/y_test.txt")
testFullLabel <- apply(testLabel, 1, actName)
trainLabel <- read.table("train/y_train.txt")
trainFullLabel <- apply(trainLabel, 1, actName)

## Combine activity data with main data set
testData[,"activity"] <- testFullLabel
trainData[,"activity"] <- trainFullLabel

## Assign column names to data sets
names(testData) <- features
names(trainData) <- features

## Combine the two datasets to one
totalData <- rbind(testData, trainData)

## Clean up source tables to save memory
rm(testData)
rm(trainData)

# Extract only the measurements on the mean and standard deviation for each measurement
keepColumns <- grepl ( "(std|mean[^F]|activity)", features, perl=TRUE )
totalData <- totalData[,keepColumns,drop=FALSE]


# Add labels to all variables


# Add average of each variable for each activity and subject to data set


# Export data set to clean file


