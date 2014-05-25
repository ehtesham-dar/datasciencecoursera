#----------------------------------------------------------------------------------------------------
# -- Step 1 - Merges the training and the test sets to create one data set.--------------------------
#----------------------------------------------------------------------------------------------------
#read the subject_train.txt and subject_test.txt file and combine them 
library(reshape2)
subject<-rbind(read.table("train/subject_train.txt"),read.table("test/subject_test.txt"))

#read x_train.txt and x_test.txt files and combine them and save it into x
x<-rbind(read.table("train/X_train.txt"),read.table("test/X_test.txt"))

#read the labes from y_train.txt and y_test.txt and store it into y  and  name  this  single
#column data.frame as "labels", create another column name activity and then copy activities
#name to its corresponding labels
y<-rbind(read.table("train/y_train.txt"),read.table("test/y_test.txt"))

#-----------------------------------------------------------------------------------------------------
# -- Step 2 -- Extracts only the measurements on the mean and standard deviation for each measurement. 
#-----------------------------------------------------------------------------------------------------
# -- select the columns/variable names having mean and standard deviation from x and save 
# -- these column/variables name into a vector t
t<-c(1:6,41:46,81:86,121:126,161:166, 201,202,214,215,227,228,240,241,253,254,266:271,
  294:296,345:350,373:375,424:429,452:454,503,504,513,516,517,526,529,530,539,542,543,552,555:561)

# -- take the subset of x having variables/column having mean and standard deviation

#read the features.txt file then clean the variables names by removing '-', '()' and numeric 
#values and then convert the variables name into lower cases.
features<-tolower(gsub("[- () - , 0-9]","",  (read.table("features.txt")[,2]) ))
# -- name the single column data.frame "subject"
names(x)<-features
dataset<-x[,t]

#-------------------------------------------------------------------------------------------
# -- Step 3 -- Uses descriptive activity names to name the activities in the data set ------
#-------------------------------------------------------------------------------------------
names(subject)<-"subject"
names(y)<-"labels"
# -- assign the variables names to x data set
names(x)<-features
#-------------------------------------------------------------------------------------------
# -- Step 4 -- Appropriately labels the data set with descriptive activity names.  ---------
#-------------------------------------------------------------------------------------------
y<-cbind(y,activity=NA)
y$activity[y$labels==1]<-"WALKING"
y$activity[y$labels==2]<-"WALKING_UPSTAIRS"
y$activity[y$labels==3]<-"WALKING_DOWNSTAIRS"
y$activity[y$labels==4]<-"SITTING"
y$activity[y$labels==5]<-"STANDING"
y$activity[y$labels==6]<-"LAYING"

dataset<-cbind(subject,y,dataset[,1:ncol(dataset)])

#-------------------------------------------------------------------------------------------
# Step 5 Creates a second, independent tidy data set with the average of each variable 
#-------------------------------------------------------------------------------------------
#melt the dataset according to subject,labels and activity and define variables to melt
#then dcast the molten data using formula 'subject + labels + activity ~ variable' and 
#apply mean funciton for aggregation and save the result into tidydata
#for each activity and each subject. 
molten=melt(dataset,id=c("subject","labels","activity"),measure.vars=c(4:ncol(dataset)))
tidydata<-dcast(molten, subject + labels + activity ~ variable,fun.aggregate=mean)

#save the tidydata into file name 'tidydata.txt'
write.table(tidydata, file="tidydata.txt")
#-------------------------------------------------------------------------------------------
