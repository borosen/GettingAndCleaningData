# 0. Download raw data
#temp <- tempfile()
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
#              temp)
#unzip(temp, exdir = 'data')
#unlink(temp)
#downloaded <- date()

# 1. Merges the training and the test sets to create one data set. 
#    Includes activity and column names. (point 2 and 3 in the README.md)
# 1.a Load the test set. 
suppressMessages(library(data.table))
subject_test <- fread('data/UCI HAR Dataset/test/subject_test.txt')
names(subject_test) <- "subject" 
y_test <- fread('data/UCI HAR Dataset/test/Y_test.txt')
names(y_test) <- "activity_code"
set_test <- cbind(subject_test, y_test)
activity <- fread('data/UCI HAR Dataset/activity_labels.txt')
names(activity) <- c("activity_code", "activity")
activity$activity <- factor(activity$activity)
set_test <- merge(set_test, activity, by="activity_code")
x_test <- fread('data/UCI HAR Dataset/test/X_test.txt')
features <- gsub(",", "",
                 fread('data/UCI HAR Dataset/features.txt')$V2)
names(x_test) <- features
set_test <- cbind(set_test, x_test)

# 1.b Load the training set
subject_train <- fread('data/UCI HAR Dataset/train/subject_train.txt')
names(subject_train) <- "subject" 
y_train <- fread('data/UCI HAR Dataset/train/Y_train.txt')
names(y_train) <- "activity_code"
set_train <- cbind(subject_train, y_train)
set_train <- merge(set_train, activity, by="activity_code")
x_train <- fread('data/UCI HAR Dataset/train/X_train.txt')
names(x_train) <- features
set_train <- cbind(set_train, x_train)

# 1.c Create the full set
set_full <- rbind(set_test, set_train)

# 2 Extract the measurements on the mean and standard deviation for each measurement.
suppressMessages(library(dplyr))
set_reduced <- tbl_dt(set_full) %>%
    select(matches('^subject$|^activity$|mean\\(|std\\(')) 

# 3 Create a second, independant data set with the average of each variable
#   for each activity and each subject.
result <- set_reduced %>% 
            group_by(subject, activity) %>%
            summarise_each(funs(mean)) %>%
            arrange(subject, activity)
# update column names
names(result) = c('subject', 'activity', 
                  unlist(lapply(names(result)[3:68],
                                function(x) paste('mean of', x))))

write.table(result, row.names = F, file="result.csv", quote=F, sep = ',')

# clean up
rm(list = c('activity', 'features', 'set_full', 'set_test', 'set_train', 
            'subject_test', 'subject_train', 'x_test', 'x_train',
            'y_test', 'y_train', 'set_reduced'))
