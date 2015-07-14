# class3project
##Getting And Cleaning Data Project - run_analysis.R File

###The first part of the file loads all the testing and training files from their respective folders. In each training and testing file, you find X, Y, and Subject files. In addition, the file loads the activity labels and variable names into their own data frames.
3 variables are created for both the test and training sets as follows:
X_
Y_
Subject_ 
varnames and activity_labels are created for variables and activities.

###The second part of the file labels the test and training sets
Column names from "varnames" are applied to the test and training X sets.
Activity names are applied to the test and training Y sets
Subject names are applied to the subject sets

###The third part of the file merges and concatenates the training and testing sets
test_merge merges all the x,y,subject test sets
train_merge merges all the x,y,subject train sets
rbind concatenates the test and train sets into the "merged" dataset

###The fourth part of the file extracts the mean and std dev variable columns from the merged dataset
merged2 removes duplicate columns
merged3 selects just the mean and std dev columns

###The fifth part of the file uses descriptive activity names to name the activities in the data set
merged3 is modified where activity numbers are modified by activity labels

###The sixth part of the datasets  creates a second, independent tidy data set with the average of each variable for each ###activity and each subject.

the merged4 dataset stacks all the measurement columns from merged 4 into a tidy dataset
average calculates the averages of the groups specified (subject, activity, measurement)
