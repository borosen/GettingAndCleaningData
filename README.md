# Getting and Cleaning Data

This is an assignment as a part of the Getting and Cleaning Data course at Johns Hopkins hosted at Coursera. [Getting and cleaning data at Coursera](https://class.coursera.org/getdata-034)

The purpose of this project is to demonstrate collecting, working with, and cleaning a data set. The raw data for this project represents data collected from the accelerator of the Samsung GAlaxy S smartphone. A description is available at the site where the data was obtained:

[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The goal of the project is to create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
    1.a Uses descriptive activity names to name the activities in the data set
    1.b Appropriately labels the data set with descriptive variable names. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

The data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

NB. The script starts by downloading the data. As the data is about 60 MB you might want to comment these lines out in successing runs.

___License___:

Use of the raw dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012