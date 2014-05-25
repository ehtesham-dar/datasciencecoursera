Title
========================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

Each of them wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


1.  Merges the training and the test sets to create one data set.  
    * read the __subject_train.txt__ and __subject_test.txt__ file and combine them  
    * read __x_train.txt__ and __x_test.txt__ files and combine them and save it into __x__  
    * read the labes from __y_train.txt__ and __y_test.txt__ and store it into __y__.  
   
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
    * select the columns/variable names having mean and standard deviation from x and save these column/variables name into a vector __t__
    * take the subset of dataset __x__ having variables/column having mean and standard deviation
    * read the __features.txt__ file then clean the variables names by removing '-', '()' and numeric values and then convert the variables         name into lower cases and store the data into dataset name __features__
   
3. Uses descriptive activity names to name the activities in the dataset 
    * Give the name to the dataset __y__ only column as __labels__
    * Give the name to the dataset __subject__ as __subject__
    * Assign the variables names to __x__ dataset using dataset __features__

4.    Appropriately labels the data set with descriptive activity names. 
    * a subset dataset will be created with the name __dataset__. The new data frame will consists of column from __y__,__subject__ and __activity__ and as names are already give to the columns of dataset __x__, so the new dataset will created with those names.

5.    Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    *  melt the dataset according to __subject__,__labels__ and __activity__
    *  then dcast the __molten__ data using formula __subject__ + __labels__ + __activity__ ~ variable' and  apply __mean__ funciton for aggregation and save the result into __tidydata__ data.frame
    *  save the tidydata into file name __tidydata.txt__

Output
------
Output will be tidy data. This tidy has 89 variables. The following is the description/code book of these variables

Description:
------------
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:


For each record it is provided:
======================================
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time)

*  __subject__   
    *  Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

*  __labels__
    *  Links the class labels with their activity name.

* __activity__
    *  Each person performed six activities named WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals __tAccXYZ__ and __tGyroXYZ__. These time domain signals (prefix __'t'__ to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (__tBodyAccXYZ__ and __tGravityAccXYZ__) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.   

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (__tBodyAccJerkXYZ__ and __tBodyGyroJerkXYZ__). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (__tBodyAccMag__, __tGravityAccMag__, __BodyAccJerkMag__, __tBodyGyroMag__, __tBodyGyroJerkMag__). 

The set of variables that were estimated from these signals are:   
* _mean(): Mean value_  
* _std(): Standard deviation_

follwoing is the list of variables estimated for mean and standard deviation  

_mean(): Mean value_ 

* __tbodyaccmeanx__   
* __tbodyaccmeany__   
* __tbodyaccmeanz__  
* __tgravityaccmeanx__   
* __tgravityaccmeany__  
* __tgravityaccmeanz__  
* __tbodyaccjerkmeanx__  
* __tbodyaccjerkmeany__  
* __tbodyaccjerkmeanz__  
* __tbodygyromeanx__  
* __tbodygyromeany__  
* __tbodygyromeanz__  
* __tbodygyrojerkmeanx__   
* __tbodygyrojerkmeany__  
* __tbodygyrojerkmeanz__  
* __tbodyaccmagmean__  
* __tgravityaccmagmean__   
* __tbodyaccjerkmagmean__   
* __tbodygyromagmean__  
* __tbodygyrojerkmagmean__  

_std(): Standard deviation_    

* __tbodyaccstdx__ 
* __tbodyaccstdy__ 
* __tbodyaccstdz__ 
* __tgravityaccstdx__ 
* __tgravityaccstdy__ 
* __tgravityaccstdz__ 
* __tbodyaccjerkstdx__ 
* __tbodyaccjerkstdy__ 
* __tbodyaccjerkstdz__ 
* __tbodygyrostdx__ 
* __tbodygyrostdy__ 
* __tbodygyrostdz__ 
* __tbodygyrojerkstdx__ 
* __tbodygyrojerkstdy__ 
* __tbodygyrojerkstdz__ 
* __tbodyaccmagstd__ 
* __tgravityaccmagstd__ 
* __tbodyaccjerkmagstd__ 
* __tbodygyromagstd__ 
* __tbodygyrojerkmagstd__ 


A Fast Fourier Transform (FFT) was applied to some of these signals producing __fBodyAcc-XYZ__, __fBodyAccJerk-XYZ__, __fBodyGyro-XYZ__, __fBodyAccJerkMag__, __fBodyGyroMag__, __fBodyGyroJerkMag__. (Note the __'f'__ to indicate frequency domain signals). 

_mean(): Mean value_
* __fbodyaccmeanx__ 
* __fbodyaccmeany__ 
* __fbodyaccmeanz__ 
* __fbodyaccmeanfreqx__ 
* __fbodyaccmeanfreqy__ 
* __fbodyaccmeanfreqz__ 
* __fbodyaccjerkmeanx__ 
* __fbodyaccjerkmeany__ 
* __fbodyaccjerkmeanz__ 
* __fbodyaccjerkmeanfreqx__ 
* __fbodyaccjerkmeanfreqy__ 
* __fbodyaccjerkmeanfreqz__ 
* __fbodygyromeanx__ 
* __fbodygyromeany__ 
* __fbodygyromeanz__ 
* __fbodygyromeanfreqx__ 
* __fbodygyromeanfreqy__ 
* __fbodygyromeanfreqz__ 
* __fbodyaccmagmean__ 
* __fbodyaccmagmeanfreq__ 
* __fbodybodyaccjerkmagmean__ 
* __fbodybodyaccjerkmagmeanfreq__ 
* __fbodybodygyromagmean__ 
* __fbodybodygyromagmeanfreq__ 
* __fbodybodygyrojerkmagmean__ 
* __fbodybodygyrojerkmagmeanfreq__ 
* __angletbodyaccmeangravity__ 
* __anglexgravitymean__ 
* __angleygravitymean__ 
* __anglezgravitymean__ 
* __angletbodyaccjerkmeangravitymean__ 
* __angletbodygyromeangravitymean__ 
* __angletbodygyrojerkmeangravitymean__ 

_std(): Standard deviation_
* __fbodyaccstdx__ 
* __fbodyaccstdy__ 
* __fbodyaccstdz__ 
* __fbodyaccjerkstdx__ 
* __fbodyaccjerkstdy__ 
* __fbodyaccjerkstdz__ 
* __fbodygyrostdx__ 
* __fbodygyrostdy__ 
* __fbodygyrostdz__ 
* __fbodyaccmagstd__ 
* __fbodybodyaccjerkmagstd__ 
* __fbodybodygyromagstd__ 
* __fbodybodygyrojerkmagstd__ 


