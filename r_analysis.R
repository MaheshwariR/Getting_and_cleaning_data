library(data.table)
library(dplyr)
library(stringr)
## Reading the meta data
featNames <- read.table("./features.txt")
actLab <- read.table("./activity_labels.txt", header = FALSE)
subTr <- read.table("./train/subject_train.txt", header = FALSE)
actTr <- read.table("./train/y_train.txt", header = FALSE)
featTr <- read.table("./train/X_train.txt", header = FALSE)
subTest <- read.table("./test/subject_test.txt", header = FALSE)
actTest <- read.table("./test/y_test.txt", header = FALSE)
featTest <- read.table("./test/X_test.txt", header = FALSE)
## Part 1- Merging the datasets to create one dataset
sub <- rbind(subTr, subTest)
act <- rbind(actTr, actTest)
feat <- rbind(featTr, featTest)
colnames(feat) <- t(featNames[2])
colnames(act) <- "Activity"
colnames(sub) <- "Subject"
compData <- cbind(feat,act,sub) 
## Part 2- Extracting only mean and standard deviation from the merged data
## By ignoring all other cases
MeanSTD <- grep(".*Mean.*|.*Std.*", names(compData), ignore.case=TRUE)
requiredColumns <- c(MeanSTD, 562, 563)
dim(compData)
extractData <- compData[,requiredColumns]
dim(extractData)
##Part 3 - Part 3 - Using descriptive activity names 
##                  To name the activities in the data set
extractData$Activity <- as.character(extractData$Activity)
for (i in 1:6){
  extractData$Activity[extractData$Activity == i] <- as.character(actLab[i,2])
}
extractData$Activity <- as.factor(extractData$Activity)
## Part 4 - Appropriately labelling the data set with descriptive variable names
## Replacing 'Acc' by 'Accelerometer'
## Replacing'Gyro' by 'Gyroscope'
## Replacing 'BodyBody' by 'Body'
##Repalcing 'Mag' by 'Magnitude'
##Replacing '^t' by 'Time'
##Replacing '^f' by 'Frequency'
##Replacing '^tbody' by 'TimeBody'
##Replacing '-mean()' by 'Mean'
##Replacing '-std()' by 'STD'
##Replacing '-freq()' by 'Frequency'
##Replacing 'angle' by 'Angle'
##Replacing '^t' by 'Time'
##Replacing 'gravity' by 'Gravity'
## Repalcing all 'alphanumeric' characters by ''

names(extractData)
names(extractData)<-gsub("Acc", "Accelerometer", names(extractData))
names(extractData)<-gsub("Gyro", "Gyroscope", names(extractData))
names(extractData)<-gsub("BodyBody", "Body", names(extractData))
names(extractData)<-gsub("Mag", "Magnitude", names(extractData))
names(extractData)<-gsub("^t", "Time", names(extractData))
names(extractData)<-gsub("^f", "Frequency", names(extractData))
names(extractData)<-gsub("tBody", "TimeBody", names(extractData))
names(extractData)<-gsub("-mean()", "Mean", names(extractData), ignore.case = TRUE)
names(extractData)<-gsub("-std()", "STD", names(extractData), ignore.case = TRUE)
names(extractData)<-gsub("-freq()", "Frequency", names(extractData), ignore.case = TRUE)
names(extractData)<-gsub("angle", "Angle", names(extractData))
names(extractData)<-gsub("gravity", "Gravity", names(extractData))
names(extractData)<-str_replace_all(names(extractData), "[^[:alnum:]]", "")
names(extractData)
extractData<-extractData[order(extractData$Subject,extractData$Activity),]

## Part 5 -  creating a second, independent tidy dataset
##        with the average of each variable for each activity and each subject
extractData$Subject<-as.factor(extractData$Subject)
extractData <- data.table(extractData)
tidyData <- aggregate(. ~Subject + Activity, extractData, mean)
write.table(tidyData, file = "Tidyx.txt", row.names = FALSE)