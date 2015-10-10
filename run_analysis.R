#library(data.table)
#library(dplyr)

##setwd("c:/Users/phickma/Desktop/GitHub/UCI HAR Dataset")

# 1. Merge the training and the test sets to create one data set.

# get the training data
trainSubjects <- read.table("../UCI HAR Dataset/train/subject_train.txt")
trainSet <- read.table("../UCI HAR Dataset/train/X_train.txt")
trainLabels <- read.table("../UCI HAR Dataset/train/y_train.txt")

# get the test data
testSubjects <- read.table("../UCI HAR Dataset/test/subject_test.txt")
testSet <- read.table("../UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("../UCI HAR Dataset/test/y_test.txt")

# bind the training and test data together
allSubjects <- rbind(trainSubjects, testSubjects)
allSets <- rbind(trainSet, testSet)
allLabels <- rbind(trainLabels, testLabels)

# add useful column names...

# a) before merging all the data together, rename subject and label column names (same as others - V1)
# * subject identifies the subject who performed the activity (1 to 30)
# * label identifies the activity performed
colnames(allSubjects) <- "Subject"
colnames(allLabels) <- "Activity"

# b) allsets contains 561 columns that correlates with features.txt
allFeatures <- read.table("../UCI HAR Dataset/features.txt")
# assign the column names to the features listed in features.txt (descriptive names now)
colnames(allSets) <- allFeatures$V2

# now merge all the data together, this is a column merge as it should all correlate
allData <- cbind(allSubjects, allLabels, allSets)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# need to identify the columns with "std" and "mean" in the name (from features.txt or colnames)
# should be able to use: select(allFeatures,contains("std")), but it doesn't like the column names that are very similar
#  http://stackoverflow.com/questions/25923392/select-columns-based-on-string-match-dplyrselect
step2Data <- allData[,grepl("Subject|Activity|mean\\(\\)|std\\(\\)", colnames(allData))]


# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
