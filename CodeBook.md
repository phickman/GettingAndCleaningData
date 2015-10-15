# CodeBook
Describes the variables, data, and transformations that are performed to clean up the data.

# The data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

You can find out more information relating to the experiment from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# The transformation
The script performs the following steps:
* Load the three text files from the train and test directories and merge into one data set
* Extract the mean and standard deviation variables for subject's activities
* Replace the activity ID with more readable name
* Clean up the variable names to be more readable
* Aggregate and export the mean for each Subject's Activity

# The variables
There are 68 variables in the exported dataset.
* Subject is a unique ID
* Activity describes what the subject was performing (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* The remaining are the mean and standard deviation for measurements relating to time, frequency, accelerometer and gyroscope readings
