# Getting and Cleaning Data Course Project
#  The goal is to prepare tidy data that can be used for later analysis.

# This file must be in your working directory with the "UCI HAR Dataset" folder as a sub directory

# 1. Merge the training and the test sets to create one data set.
# get the training and test data
trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt")

testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt")

# bind the training and test data together
allSubjects <- rbind(trainSubjects, testSubjects)
allSets <- rbind(trainSet, testSet)
allLabels <- rbind(trainLabels, testLabels)

# add useful column names
# a) before merging all the data together, rename subject and label column names (same as others - V1)
# * subject identifies the subject who performed the activity (1 to 30)
# * label identifies the activity performed
colnames(allSubjects) <- "Subject"
colnames(allLabels) <- "Activity"
# b) allsets contains 561 columns that correlates with features.txt
allFeatures <- read.table("../UCI HAR Dataset/features.txt")
# assign the column names to the features listed in features.txt (descriptive names now)
colnames(allSets) <- allFeatures$V2

# now merge all the data together, this is a column merge as the rows should all correlate
allData <- cbind(allSubjects, allLabels, allSets)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# need to identify the columns with "std()" and "mean()" in the name (from features.txt - skipping meanFreq())
# should be able to use: select(allFeatures,contains("std")), but it doesn't like the column names that are very similar
#  http://stackoverflow.com/questions/25923392/select-columns-based-on-string-match-dplyrselect
subData <- allData[,grepl("Subject|Activity|mean\\(\\)|std\\(\\)", colnames(allData))]


# 3. Uses descriptive activity names to name the activities in the data set
allActivities <- read.table("../UCI HAR Dataset/activity_labels.txt")
# copy the associated Activity Name from allActivities to the data set (second column is Activity)
subData$Activity <- allActivities[subData$Activity, 2]


# 4. Appropriately labels the data set with descriptive variable names.
# activity names are stored in activity_labels.txt
# replace current value in subData$Activity with corresponding activity in activty_labels.txt
# I have chosen to explicitly set the variable names, I could have used grep
colnames(subData) <- list(
  "Subject",
  "Activity",
  "timeBodyAccelerometer_Mean_X",
  "timeBodyAccelerometer_Mean_Y",
  "timeBodyAccelerometer_Mean_Z",
  "timeBodyAccelerometer_Std_X",
  "timeBodyAccelerometer_Std_Y",
  "timeBodyAccelerometer_Std_Z",
  "timeGravityAccelerometer_Mean_X",
  "timeGravityAccelerometer_Mean_Y",
  "timeGravityAccelerometer_Mean_Z",
  "timeGravityAccelerometer_Std_X",
  "timeGravityAccelerometer_Std_Y",
  "timeGravityAccelerometer_Std_Z",
  "timeBodyAccelerometerJerk_Mean_X",
  "timeBodyAccelerometerJerk_Mean_Y",
  "timeBodyAccelerometerJerk_Mean_Z",
  "timeBodyAccelerometerJerk_Std_X",
  "timeBodyAccelerometerJerk_Std_Y",
  "timeBodyAccelerometerJerk_Std_Z",
  "timeBodyGyroscope_Mean_X",
  "timeBodyGyroscope_Mean_Y",
  "timeBodyGyroscope_Mean_Z",
  "timeBodyGyroscope_Std_X",
  "timeBodyGyroscope_Std_Y",
  "timeBodyGyroscope_Std_Z",
  "timeBodyGyroscopeJerk_Mean_X",
  "timeBodyGyroscopeJerk_Mean_Y",
  "timeBodyGyroscopeJerk_Mean_Z",
  "timeBodyGyroscopeJerk_Std_X",
  "timeBodyGyroscopeJerk_Std_Y",
  "timeBodyGyroscopeJerk_Std_Z",
  "timeBodyAccelerometerMagnitude_Mean",
  "timeBodyAccelerometerMagnitude_Std",
  "timeGravityAccelerometerMagnitude_Mean",
  "timeGravityAccelerometerMagnitude_Std",
  "timeBodyAccelerometerJerkMagnitude_Mean",
  "timeBodyAccelerometerJerkMagnitude_Std",
  "timeBodyGyroscopeMagnitude_Mean",
  "timeBodyGyroscopeMagnitude_Std",
  "timeBodyGyroscopeJerkMagnitude_Mean",
  "timeBodyGyroscopeJerkMagnitude_Std",
  "frequencyBodyAccelerometer_Mean_X",
  "frequencyBodyAccelerometer_Mean_Y",
  "frequencyBodyAccelerometer_Mean_Z",
  "frequencyBodyAccelerometer_Std_X",
  "frequencyBodyAccelerometer_Std_Y",
  "frequencyBodyAccelerometer_Std_Z",
  "frequencyBodyAccelerometerJerk_Mean_X",
  "frequencyBodyAccelerometerJerk_Mean_Y",
  "frequencyBodyAccelerometerJerk_Mean_Z",
  "frequencyBodyAccelerometerJerk_Std_X",
  "frequencyBodyAccelerometerJerk_Std_Y",
  "frequencyBodyAccelerometerJerk_Std_Z",
  "frequencyBodyGyroscope_Mean_X",
  "frequencyBodyGyroscope_Mean_Y",
  "frequencyBodyGyroscope_Mean_Z",
  "frequencyBodyGyroscope_Std_X",
  "frequencyBodyGyroscope_Std_Y",
  "frequencyBodyGyroscope_Std_Z",
  "frequencyBodyAccelerometerMagnitude_Mean",
  "frequencyBodyAccelerometerMagnitude_Std",
  "frequencyBodyAccelerometerJerkMagnitude_Mean",
  "frequencyBodyAccelerometerJerkMagnitude_Std",
  "frequencyBodyGyroscopeMagnitude_Mean",
  "frequencyBodyGyroscopeMagnitude_Std",
  "frequencyBodyGyroscopeJerkMagnitude_Mean",
  "frequencyBodyGyroscopeJerkMagnitude_Std"
)


# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.
tidyData <- aggregate(. ~ Subject+Activity,data = subData, FUN=mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]

# create a file to upload to Coursera
write.table(tidyData, file = "tidyData.txt",row.names=FALSE)
