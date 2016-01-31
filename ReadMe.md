# README-GETTING AND CLEANING DATA:

## AIM of the program (Source:Coursera Assignment Page)
* 1.   Merges the training and the test sets to create one data set.
* 2.   Extracts only the measurements on the mean and standard deviation for each measurement.
* 3.   Uses descriptive activity names to name the activities in the data set
* 4.   Appropriately labels the data set with descriptive variable names.
* 5.   From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Method to perform it
*  1.    After downloading, read the UCI HAR Dataset.
*  2.    Rowbind the subject dataset, features dataset and acivity dataset seperately.
*  3.    All the columns are given names for Features, Activity and Subject.
*  4.    The rowbind datasets are combined by columnbind.
*  5.    Only the variables containing either a 'Mean' value or 'STD' value are selected.
*  6.   The activity labels are assigned based on activity label value ranging from 1 to 6.
*  7.   Proper bariable names are assigned by using gsub command
*  8.   Tidydataset i.e tidyx.txt is generated by applying aggregate command on new dataset on basis of Subject and Activity to find mean of each observation.

 
 