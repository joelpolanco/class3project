library(plyr)
library(dplyr)
library(tidyr)

##Load data from files into dataframes
setwd("C:/Users/jgpolanc/Desktop/Coursera/UCI_HAR")
varnames = read.table("features.txt")
activity_labels = read.table("activity_labels.txt")

setwd("C:/Users/jgpolanc/Desktop/Coursera/UCI_HAR/test")
x_test = read.table("X_test.txt")                               ## read x text file 
y_test = read.table("Y_test.txt")                               ## read y text file
subject_test = read.table("subject_test.txt")                   ## read subject text file

setwd("C:/Users/jgpolanc/Desktop/Coursera/UCI_HAR/train")
x_train = read.table("X_train.txt")                             ## read x text file 
y_train = read.table("Y_train.txt")                             ## read y text file 
subject_train = read.table("subject_train.txt")                 ## read subject text file

##Appropriately labels the data set with descriptive variable names.
##Rename all the variable, subject and activity columns

colnames(x_test) <- varnames[,2]
colnames(x_train) <- varnames[,2]
names(y_test)[names(y_test)=="V1"] <- "activity"                ##change the name of V1_Y to activity
names(y_train)[names(y_train)=="V1"] <- "activity"              ##change the name of V1_Y to activity
names(subject_test)[names(subject_test)=="V1"] <- "subject"     ##change the name of V1_S to subject
names(subject_train)[names(subject_train)=="V1"] <- "subject"   ##change the name of V1_S to subject

## Merges the training and the test sets to create one data set.
test_merge <- cbind(x_test,y_test,subject_test)                 ## one single test dataset
train_merge <- cbind(x_train,y_train,subject_train)             ## one single train dataset
merged<-rbind(test_merge,train_merge)                           ## merge train/test datasets

## Extracts only the measurements on the mean and standard deviation for each measurement.

merged2 <- merged[, !duplicated(colnames(merged))]               ## Remove duplicate columns
merged3 <- select(merged2,subject,activity, contains("mean"),contains("std"))


## Uses descriptive activity names to name the activities in the data set

merged3$activity <- as.character(activity_labels[match(merged3$activity,  
                                activity_labels$V1), 'V2'])

## From the data set in step 4, creates a second, independent tidy data set with the average of each
##variable for each activity and each subject.

merged4<- merged3 %>%
        gather(measurement, value, 3:88)

average <- ddply(merged4, .(subject,activity,measurement), summarise, mean = mean(value))

## Please upload your data set as a txt file created with write.table() using row.name=FALSE

write.table(average,"average.txt",row.name=FALSE)
