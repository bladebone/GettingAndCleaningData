### Getting And Cleaning Data - Course Project 

## Synopsis
The purpose of this code is to prepare tidy data using given data files. The code named 'run_analysis.R' creates tidy set by given procedure.

## Requirements
library : reshape2
data files: X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_train.txt, subject_test.txt, features.txt, activity_lables.txt

## Output
tidyset.txt

## Information for tidy set
I extract the variabels which have suffix such like mean() or std() from the entire human avtivity recognition database. Note that, there are 66 variabels which have suffix such like mean() or std(). And then calculate the average of each variable for each activity and each subject. As a result, tidy set was created as 180 observations by 68 variables. Because there are 30 subject and 6 activity, there are 180 (= 30 * 6) observations. First column means the subject number and second column means activity name. From 3rd columns to the last column, remainder columns mean the average of each variabel for each activity and each subject.

## Read tidy set in R
data <- read.table("tidyset.txt", header = TRUE)
