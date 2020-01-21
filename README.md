---
title: "README"
author: "Liam Currie"
date: "1/21/2020"
output: html_document
---

## script functions

Script takes data from 8 data sets, combines them, filters all but the standard
devaiation and mean columns, and provides a summary table of the averages for
each measure called data_ave.

load required libraries

read in test data

read in training data

read in index data

change column names for activity name lookup table

add activity and subject columns to test and train data

rename columns 1:561 values from vector_names, 562:563 get custom names

combine the train and test datasets into 'data'

create list of columns whose name includes "std" or "mean" with caps or
lowercase as well as the activity and subject cols

remove all unneccessary columns

add activity name column from activity_name data matched to activity ID. 

remove activity column

create new tidy table with average values for each variable by subject and
activity

## Tidy data description

The final table has 15,480 observations of 4 variables. The data is narrow and
sorted by variable. Each row contains one observation: One row for each of the
30 subjects performing one of the 6 activities for each of the 86 variables.

Variable: the specific variable (measure) under observation
Subject: the ID of each participant
ActivityName: the activity performed by the subject
Average: the mean value of the variable