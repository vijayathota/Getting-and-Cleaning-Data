# Getting-and-Cleaning-Data
Though the given data set has so many data files, actual files which are required for this assignment as follows.

x_train.txt , y_train.txt , x_test.txt, y_test.txt, feature.txt, Subject_test.txt, Subject_train.txt

Step 1: Load all flat files using read.tables

step 2: Assign names from feature.txt

step 3: cbind all test and train files seperatly and then rbind both test and train files

Step 4: There are many duplicate columns in data sets. Remove duplicate columns

Step 5: take only mean and std measurements

Step 6: Assign activity lables to activity codes (1:6)

Step 7: using string sub function give meaning ful values to all measurements

Step 8: Reshapre the data by grouping Activity and Subject.

Step 9. create tiny data set by finding the average measures of each activity and each subject
