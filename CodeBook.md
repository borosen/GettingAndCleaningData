Codebook
--------

Initial data is collected per description here: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The sets 'train/X_train.txt', 'train/Y_train.txt', 'train/subject_train.txt', 'test/X_test.txt', 'test/Y_test.txt', 'test/subject_test.txt', and 'activity_labels.txt' has been merged into one temporary data set.

From the temporary set, the mean of the the variables regarding mean and standard deviations has in turn been extracted into the final data set.
The mean is grouped by subject and activity.

See run_analysis.R for details.


__Variable descriptions__ (Original data is listed after this one)


```
subject
    Subject to the data sampling.
    Type : int
        1 - 30

activity
    Activity carried out during the data sampling.
    Type: Factor w /6 levels
        LAYING 
        SITTING           
        STANDING
        WALKING
        WALKING_UPSTAIRS
        WALKING_DOWNSTAIRS


mean of tBodyAcc-mean()-X
    Type: num
    Mean value of tBodyAcc-mean()-X over subject and activity
    
The rest of the variables are of the same type as 'mean of tBodyAcc-mean()-X' above
mean of tBodyAcc-mean()-Y
mean of tBodyAcc-mean()-Z
mean of tBodyAcc-std()-X
mean of tBodyAcc-std()-Y
mean of tBodyAcc-std()-Z
mean of tGravityAcc-mean()-X
mean of tGravityAcc-mean()-Y
mean of tGravityAcc-mean()-Z
mean of tGravityAcc-std()-X
mean of tGravityAcc-std()-Y
mean of tGravityAcc-std()-Z
mean of tBodyAccJerk-mean()-X
mean of tBodyAccJerk-mean()-Y
mean of tBodyAccJerk-mean()-Z
mean of tBodyAccJerk-std()-X
mean of tBodyAccJerk-std()-Y
mean of tBodyAccJerk-std()-Z
mean of tBodyGyro-mean()-X
mean of tBodyGyro-mean()-Y
mean of tBodyGyro-mean()-Z
mean of tBodyGyro-std()-X
mean of tBodyGyro-std()-Y
mean of tBodyGyro-std()-Z
mean of tBodyGyroJerk-mean()-X
mean of tBodyGyroJerk-mean()-Y
mean of tBodyGyroJerk-mean()-Z
mean of tBodyGyroJerk-std()-X
mean of tBodyGyroJerk-std()-Y
mean of tBodyGyroJerk-std()-Z
mean of tBodyAccMag-mean()
mean of tBodyAccMag-std()
mean of tGravityAccMag-mean()
mean of tGravityAccMag-std()
mean of tBodyAccJerkMag-mean()
mean of tBodyAccJerkMag-std()
mean of tBodyGyroMag-mean()
mean of tBodyGyroMag-std()
mean of tBodyGyroJerkMag-mean()
mean of tBodyGyroJerkMag-std()
mean of fBodyAcc-mean()-X
mean of fBodyAcc-mean()-Y
mean of fBodyAcc-mean()-Z
mean of fBodyAcc-std()-X
mean of fBodyAcc-std()-Y
mean of fBodyAcc-std()-Z
mean of fBodyAccJerk-mean()-X
mean of fBodyAccJerk-mean()-Y
mean of fBodyAccJerk-mean()-Z
mean of fBodyAccJerk-std()-X
mean of fBodyAccJerk-std()-Y
mean of fBodyAccJerk-std()-Z
mean of fBodyGyro-mean()-X
mean of fBodyGyro-mean()-Y
mean of fBodyGyro-mean()-Z
mean of fBodyGyro-std()-X
mean of fBodyGyro-std()-Y
mean of fBodyGyro-std()-Z
mean of fBodyAccMag-mean()
mean of fBodyAccMag-std()
mean of fBodyBodyAccJerkMag-mean()
mean of fBodyBodyAccJerkMag-std()
mean of fBodyBodyGyroMag-mean()
mean of fBodyBodyGyroMag-std()
mean of fBodyBodyGyroJerkMag-mean()
mean of fBodyBodyGyroJerkMag-std()
```

__Raw data description__


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.  
iqr(): Interquartile range 
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal  
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

The complete list of variables of each feature vector is available in 'features.txt'  
