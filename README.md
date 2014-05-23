Getting and Cleaning Data Course Project
========================================

Before you run the script, you need to download the following zip file and unzip it into the working directory.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Step 1: Merges the training and the test sets to create one data set.
* Read in the "features.txt", "subject_test.txt", "y_test.txt", "x_test.txt", "subject_train.txt", "y_train.txt", and "x_train.txt" data using read.table().
* Rename all the "train" and "test" data set variables using the variables from "features.txt" and add in "subject" and "activity" variable names.
* Column bind all three "train" data sets together.
* Column bind all three "test" data sets together.
* Combine the two new data sets of "train" and "test" using rbind() to make a tidy data set.

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
* Use grep() to pull out all columns that have the string "mean" and "std" anywhere in the header name.
* Recreate your data set with only the "mean"" and "std" data, along with the "subject" and "activity" data.

### Step 3: Uses descriptive activity names to name the activities in the data set.
* Change the numeric values of the "activity" column to character strings.
* Use gsub() to swap out the numbers with the activities listed in "activity_labels.txt".
* Put the data set back together.

### Step 4: Appropriately labels the data set with descriptive activity names.
* Use gsub() and tolower() to clean up the labels of each column header.

### Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Use melt() to get the long view of the data.
* Use dcast() to get the mean of each variable for each subject and each activity.
* Used write.csv() to get the final tidy data set.