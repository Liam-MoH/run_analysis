## Script takes data from 8 data sets, combines them, filters all but the 
## standard devaiation and mean columns, and provides a summary 
## table of the averages for each measure. 

#load required libraries
library(dplyr)
library(tidyr)

#read in test data
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#read in training data
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#read in index data
vector_names <- read.table("./UCI HAR Dataset/features.txt")
activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt")

#change column names for activity name lookup table
colnames(activity_names) <- c("activity", "activityName")

#add activity and subject columns to test and train data
#rename columns 1:561 values from vector_names, 562:563 get custom names
test <- cbind(test, test_activity, test_subject) 
col_names <- c(as.vector(vector_names[,2]), "activity", "subject")
colnames(test) <- col_names

train <- cbind(train, train_activity, train_subject) 
col_names <- c(as.vector(vector_names[,2]), "activity", "subject")
colnames(train) <- col_names

#combine the train and test datasets into 'data' 
data <- rbind(test, train)

#create list of columns whose name includes "std" or "mean" 
#with caps or lowercase as well as the activity and subject cols
std_mean_names <- grep("[mM]ean|MEAN|STD|[Ss]td|activity|subject",colnames(data))

#remove all unneccessary columns
data <- data[,std_mean_names]

#add activity name column from activity_name data matched to activity ID. 
#remove activity column
data <- select(left_join(data, activity_names), -activity)

#create new tidy table with average values for each variable by subject and 
#activity
data_ave <- data %>% 
     gather("variable", "value", 1:86) %>% 
     group_by(variable) %>% 
     group_by(subject, add = TRUE) %>% 
     group_by(activityName, add = TRUE) %>% 
     summarize(average = mean(value))
     


