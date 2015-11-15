# 0. Download raw data
#temp <- tempfile()
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
#              temp, mode="wb")
#unzip(temp, exdir = 'data')
#unlink(temp)
#downloaded <- date()



#1. Merge the training and the test sets to create one data set, data.

library(dplyr)
subject_test <- read.table('data/UCI HAR Dataset/test/subject_test.txt')
y_test <- read.table('data/UCI HAR Dataset/test/Y_test.txt')
x_test <- read.table('data/UCI HAR Dataset/test/X_test.txt')
data_test <- cbind(subject_test, y_test, x_test)

subject_train <- read.table('data/UCI HAR Dataset/train/subject_train.txt')
y_train <- read.table('data/UCI HAR Dataset/train/Y_train.txt')
x_train <- read.table('data/UCI HAR Dataset/train/X_train.txt')
data_train <- cbind(subject_train, y_train, x_train)

data <- rbind(data_test, data_train)

features <- read.table('data/UCI HAR Dataset/features.txt')
names(data) <- c('subject', 'activity_code', as.character(features[,2]))



#2. Extract only the measurements on the mean and standard deviation for each 
#   measurement. I.e. variables with names including mean() or std().
data <- data[, grep('subject|activity_code|mean\\(\\)|std\\(\\)', names(data))]



#3. Use descriptive activity names to name the activities in the data set
#   Drop the activity_code variable
activity <- read.table('data/UCI HAR Dataset/activity_labels.txt')
names(activity) <- c('activity_code', 'activity')
data <- merge(activity, data)[,-1]



#4. Appropriately label the data set with descriptive variable names.
#  1. mean, std, and Acc -> Mean, StandardDeviation, and Acceleration
#  2. t and f starting the original name -> Time and Fourier
#  3. remove -
#  4. X, Y, and Z -> Xaxis, Yaxis, and Zaxis
variablenames <- names(data)
variablenames <- gsub("-mean\\(\\)", "Mean", variablenames)
variablenames <- gsub("-std\\(\\)", "StandardDeviation", variablenames)
variablenames <- gsub("Acc", "Acceleration", variablenames)
variablenames <- gsub("^t", "Time", variablenames)
variablenames <- gsub("^f", "Fourier", variablenames)
variablenames <- gsub("-", "", variablenames)
variablenames <- gsub("(X|Y|Z)$", "\\1axis", variablenames) 
names(data) <- variablenames



#5. From the data set in step 4, create a second, independent tidy data set with 
#   the average of each variable for each activity and each subject.
#   Name the new variables correctly
result <- data %>% 
    group_by(subject, activity) %>%
    summarize_each(funs(mean)) %>%
    arrange(subject, activity)
names(result)[3:68] <- paste0('meanOf', names(result)[3:68])



# Export data set with write.table
write.table(result, row.names = F, file="analysis.csv", quote=F, sep = ',')



# clean up
rm(activity, data, data_test, data_train, features, subject_test, subject_train, 
   x_test, x_train, y_test, y_train, variablenames)
