#library(data.table)
#library(dplyr)

setwd("c:/Users/phickma/Desktop/GitHub/UCI HAR Dataset")

# 1. Merge the training and the test sets to create one data set.

# get the training data
trainSubjects <- read.table("train/subject_train.txt")
trainSet <- read.table("train/X_train.txt")
trainLabels <- read.table("train/y_train.txt")

# get the test data
testSubjects <- read.table("test/subject_test.txt")
testSet <- read.table("test/X_test.txt")
testLabels <- read.table("test/y_test.txt")

# bind the training and test data together
allsubjects <- rbind(trainSubjects, testSubjects)
allsets <- rbind(trainSet, testSet)
alllabels <- rbind(trainLabels, testLabels)

# add useful column names...

# a) before merging all the data together, rename subject and label column names (same as others - V1)
# * subject identifies the subject who performed the activity (1 to 30)
# * label identifies the activity performed
colnames(allsubjects) <- "Subject"
colnames(alllabels) <- "Activity"

# b) allsets contains 561 columns that correlates with features.txt
allfeatures <- read.table("features.txt")
# assign the column names to the features listed in features.txt (descriptive names now)
colnames(allSets) <- allfeatures$V2

# now merge all the data together, this is a column merge as it should all correlate
alldata <- cbind(allsubjects, alllabels, allsets)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.