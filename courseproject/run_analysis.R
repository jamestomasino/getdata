#!/usr/bin/env Rscript

## Function to check for and load dependency libraries automatically
depend <- function (s) {
	if (s %in% rownames(installed.packages()) == FALSE) {install.packages(s)}
	library(s, character.only=TRUE)
}

## List of library dependencies
#depend("sqldf")

## Sequence
# Load the training data set
# Load the test data set
# Merge the two data sets
# Extract only the measurements on the mean and standard deviation for each measurement
# Name activities in data set
# Add labels to all variables
# Add average of each variable for each activity and subject to data set
# Export data set to clean file
