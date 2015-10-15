# Getting and Cleaning Data Course Project
This file explains how all of the scripts work and how they are connected.  

## What is included?
README.md - This file, explains how all of the scripts work and how they are connected.
CodeBook.md - Describes the variables, the data, and any transformations or work that was performed to clean up the data.
run_analysis.R - The script that loads, manipulates and exports the data.

## The data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

You can find out more information relating to the experiment from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Download the data
Download the data using the link below and unzip into the same folder as the R script.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Processing the data
Place the run_analysis.R file and downloaded data (UCI HAR Dataset) in your R working directory.

Then enter the following command
```{r}
source("run_analysis.R")
```
