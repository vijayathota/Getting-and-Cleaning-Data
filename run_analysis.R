setwd("C:/Users/185384/Documents/Personal/Self Learning/R/UCI HAR Dataset")
# Read test, train, Sbject and feature files
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/Y_test.txt")
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/Y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
subject_test <- read.table("./test/subject_test.txt")
features <- read.table("./features.txt")
# Assingh names to data frames
names(x_test) <- features$V2
names(x_train) <- features$V2
names(y_test) <- "Activity"
names(y_train) <- "Activity"
names(subject_test) <- "Subject"
names(subject_train) <- "Subject"
#Merge(Append) train and test data sets.
combined_data_set <- rbind(cbind(x_test,y_test,subject_test),cbind(x_train,y_train,subject_train))
# X_***** data files are having duplicate columns
combined_data_set <- combined_data_set[,!duplicated(names(combined_data_set))]
# take only mean and std measures
mean_std_data <- select(combined_data_set, grep("mean|std|Activity|Subject", names(combined_data_set), ignore.case = TRUE))
# Assign descriptive activity names to activity codes (1:6)
mean_std_data$Activity <- mapvalues(mean_std_data$Activity, c(1,2,3,4,5,6),c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING" , "LAYING"))

#Appropriately labels the data set with descriptive variable names
names(mean_std_data) <- gsub("\\()-|\\_()|\\()|\\(|\\)","",names(mean_std_data))
value_columns <- setdiff(names(mean_std_data), c("Activity", "Subject"))
melt_mean_std <- melt(mean_std_data , id=c("Activity", "Subject"), measure.vars = value_columns)

#group the data based on Activity and Subject codes.
summary_dataset <- dcast(melt_mean_std,Activity+Subject ~ variable,mean)
#Write final data set into csv files
write.csv(summary_dataset, file = "Summary Data Set.txt", row.names = FALSE)








