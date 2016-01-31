CODEBOOK
##This code book contains the description of all the variables and transformation done to get Tidy Data.

##Data Source:
###The data has been taken from URL:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
###Description of experiment Source:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
###The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
###The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
###The dataset includes the following files:
####README.txt' – A short description of the experiment and sources of data
####'features_info.txt': Shows information about the variables used on the feature vector.
####'features.txt': List of all features.
####'activity_labels.txt': Links the class labels with their activity name. There are 6 activities:
#####WALKING
#####WALKING_UPSTAIRS
#####WALKING_DOWNSTAIRS
#####SITTING
#####STANDING
#####LAYING
####‘y_train.txt' and ‘y_test.txt’: Training labels and Test labels.
####'X_train.txt': Training set observations.
####‘X-test.txt’: Test set observations.
####‘subject_train.txt’ and ‘subject_test.txt’: Identifies subject whose id values ranges from 1 till 30.

##Part 1: Data Merging to create 1 data set.
###rbind ‘subject_train’ and ‘subject_test’ dataset.
###rbind ‘x_train’ and subject ‘x_test’ dataset.
###rbind ‘y_train’ and subject ‘y_test’ dataset.
###colbind the above three datasets

##Part 2: Extracting only measurements of mean and standard deviation from from combined dataset
###By using ‘grep’ command, all the observations containing either ‘mean’ or ‘std’ are extracted into a new dataset (extractData) by ignoring all other data values

##Part 3: Uses descriptive activity names to name the activities in the data set
###The activity field in ‘extractdata’ which is in numeric value are matched by corresponding Activity labels in which is taken from ‘activity_labels.txt’ file.

##Part 4:  Appropriately labelling the data set with descriptive variable names
###The names of all he variables in dataset extractdata are observed.
###It can be found that the names of variables can be modified by:
####Replacing 'Acc' by 'Accelerometer'
####Replacing'Gyro' by 'Gyroscope'
####Replacing 'BodyBody' by 'Body'
####Repalcing 'Mag' by 'Magnitude'
####Replacing '^t' by 'Time'
####Replacing '^f' by 'Frequency'
####Replacing '^tbody' by 'TimeBody'
####Replacing '-mean()' by 'Mean'	•	Replacing '-std()' by 'STD'
####Replacing '-freq()' by 'Frequency'
####Replacing 'angle' by 'Angle'
####Replacing '^t' by 'Time'
####Replacing 'gravity' by 'Gravity'
####Replacing all 'alphanumeric' characters by ''
###3.This is done by ‘gsub’ command.
###Replacing of all ‘alphanumeric’ characters is done by ‘str_replace_all’ command.
###We get the following variable names for all observations.
*[1] "TimeBodyAccelerometerMeanX"                     
*[2] "TimeBodyAccelerometerMeanY"                     
*[3] "TimeBodyAccelerometerMeanZ"                     
*[4] "TimeBodyAccelerometerSTDX"                      
*[5] "TimeBodyAccelerometerSTDY"                      
*[6] "TimeBodyAccelerometerSTDZ"                      
*[7] "TimeGravityAccelerometerMeanX"                  
*[8] "TimeGravityAccelerometerMeanY"                  
*[9] "TimeGravityAccelerometerMeanZ"                  
*[10] "TimeGravityAccelerometerSTDX"                   
*[11] "TimeGravityAccelerometerSTDY"                   
*[12] "TimeGravityAccelerometerSTDZ"                   
*[13] "TimeBodyAccelerometerJerkMeanX"                 
*[14] "TimeBodyAccelerometerJerkMeanY"                 
*[15] "TimeBodyAccelerometerJerkMeanZ"                 
*[16] "TimeBodyAccelerometerJerkSTDX"                  
*[17] "TimeBodyAccelerometerJerkSTDY"                  
*[18] "TimeBodyAccelerometerJerkSTDZ"                  
*[19] "TimeBodyGyroscopeMeanX"                         
*[20] "TimeBodyGyroscopeMeanY"                         
*[21] "TimeBodyGyroscopeMeanZ"                         
*[22] "TimeBodyGyroscopeSTDX"                          
*[23] "TimeBodyGyroscopeSTDY"                          
*[24] "TimeBodyGyroscopeSTDZ"                          
*[25] "TimeBodyGyroscopeJerkMeanX"                     
*[26] "TimeBodyGyroscopeJerkMeanY"                     
*[27] "TimeBodyGyroscopeJerkMeanZ"                     
*[28] "TimeBodyGyroscopeJerkSTDX"                      
*[29] "TimeBodyGyroscopeJerkSTDY"                      
*[30] "TimeBodyGyroscopeJerkSTDZ"                      
*[31] "TimeBodyAccelerometerMagnitudeMean"             
*[32] "TimeBodyAccelerometerMagnitudeSTD"              
*[33] "TimeGravityAccelerometerMagnitudeMean"          
*[34] "TimeGravityAccelerometerMagnitudeSTD"           
*[35] "TimeBodyAccelerometerJerkMagnitudeMean"         
*[36] "TimeBodyAccelerometerJerkMagnitudeSTD"          
*[37] "TimeBodyGyroscopeMagnitudeMean"                 
*[38] "TimeBodyGyroscopeMagnitudeSTD"                  
*[39] "TimeBodyGyroscopeJerkMagnitudeMean"             
*[40] "TimeBodyGyroscopeJerkMagnitudeSTD"              
*[41] "FrequencyBodyAccelerometerMeanX"                
*[42] "FrequencyBodyAccelerometerMeanY"                
*[43] "FrequencyBodyAccelerometerMeanZ"                
*[44] "FrequencyBodyAccelerometerSTDX"                                                        
*[45] "FrequencyBodyAccelerometerSTDY"                 
*[46] "FrequencyBodyAccelerometerSTDZ"                 
*[47] "FrequencyBodyAccelerometerMeanFreqX"            
*[48] "FrequencyBodyAccelerometerMeanFreqY"            
*[49] "FrequencyBodyAccelerometerMeanFreqZ"            
*[50] "FrequencyBodyAccelerometerJerkMeanX"            
*[51] "FrequencyBodyAccelerometerJerkMeanY"            
*[52] "FrequencyBodyAccelerometerJerkMeanZ"            
*[53] "FrequencyBodyAccelerometerJerkSTDX"             
*[54] "FrequencyBodyAccelerometerJerkSTDY"             
*[55] "FrequencyBodyAccelerometerJerkSTDZ"             
*[56] "FrequencyBodyAccelerometerJerkMeanFreqX"        
*[57] "FrequencyBodyAccelerometerJerkMeanFreqY"        
*[58] "FrequencyBodyAccelerometerJerkMeanFreqZ"        
*[59] "FrequencyBodyGyroscopeMeanX"                    
*[60] "FrequencyBodyGyroscopeMeanY"                    
*[61] "FrequencyBodyGyroscopeMeanZ"                    
*[62] "FrequencyBodyGyroscopeSTDX"                     
*[63] "FrequencyBodyGyroscopeSTDY"                     
*[64] "FrequencyBodyGyroscopeSTDZ"                     
*[65] "FrequencyBodyGyroscopeMeanFreqX"                
*[66] "FrequencyBodyGyroscopeMeanFreqY"                
*[67] "FrequencyBodyGyroscopeMeanFreqZ"                
*[68] "FrequencyBodyAccelerometerMagnitudeMean"        
*[69] "FrequencyBodyAccelerometerMagnitudeSTD"         
*[70] "FrequencyBodyAccelerometerMagnitudeMeanFreq"    
*[71] "FrequencyBodyAccelerometerJerkMagnitudeMean"    
*[72] "FrequencyBodyAccelerometerJerkMagnitudeSTD"     
*[73] "FrequencyBodyAccelerometerJerkMagnitudeMeanFreq"
*[74] "FrequencyBodyGyroscopeMagnitudeMean"            
*[75] "FrequencyBodyGyroscopeMagnitudeSTD"             
*[76] "FrequencyBodyGyroscopeMagnitudeMeanFreq"        
*[77] "FrequencyBodyGyroscopeJerkMagnitudeMean"        
*[78] "FrequencyBodyGyroscopeJerkMagnitudeSTD"         
*[79] "FrequencyBodyGyroscopeJerkMagnitudeMeanFreq"    
*[80] "AngleTimeBodyAccelerometerMeanGravity"          
*[81] "AngleTimeBodyAccelerometerJerkMeanGravityMean"  
*[82] "AngleTimeBodyGyroscopeMeanGravityMean"          
*[83] "AngleTimeBodyGyroscopeJerkMeanGravityMean"      
*[84] "AngleXGravityMean"                              
*[85] "AngleYGravityMean"
*[86] "AngleZGravityMean"                              
*[87] "Activity"                                       
*[88] "Subject"    
                              
##Part 5: creating a second, independent tidy dataset  with the average of each variable for each activity and each subject
###1.	Firstly, let us set Subject as a factor variable.
###2.	We create tidyData as a dataset with average for each activity and subject. Then, we order the entries in tidyData and write it into data file’Tidyx.txt’ that contains the processed data.

