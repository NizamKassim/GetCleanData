# Data Science Specialization (Getting and Cleaning Data Course Project)

# Course Project: Create one R script called run_analysis.R that does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# --------------------------------------------------------------------------------------------------------------------------------------------------
# 0. Script preparation - load required packages for data manipulation and getting data
# --------------------------------------------------------------------------------------------------------------------------------------------------

## (a) Load required packages for data manipulation (dplyr,data.table,tidyr)
library(dplyr)
library(tidyr)
library(data.table)

## (b) Getting data from http://archive.ics.uci.edu/ml/datasets website
filesPath1 <- "/Users/nizam/Desktop/Working Space/Coursera Working Space/UCI HAR Dataset"
setwd(filesPath1)
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# --------------------------------------------------------------------------------------------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set.
# --------------------------------------------------------------------------------------------------------------------------------------------------

## (a) Read subject files, activity files and data files in the datasets and create data tables.
filesPath2 <-  "/Users/nizam/Desktop/Working Space/Coursera Working Space/UCI HAR Dataset/data"

dataSubjectTrain <- tbl_df(read.table(file.path(filesPath2, "train", "subject_train.txt")))
dataSubjectTest  <- tbl_df(read.table(file.path(filesPath2, "test" , "subject_test.txt" )))
alldataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
setnames(alldataSubject, "V1", "subject")

dataActivityTrain <- tbl_df(read.table(file.path(filesPath2, "train", "Y_train.txt")))
dataActivityTest  <- tbl_df(read.table(file.path(filesPath2, "test" , "Y_test.txt" )))
alldataActivity<- rbind(dataActivityTrain, dataActivityTest)
setnames(alldataActivity, "V1", "activityNum")

dataTrain <- tbl_df(read.table(file.path(filesPath2, "train", "X_train.txt" )))
dataTest  <- tbl_df(read.table(file.path(filesPath2, "test" , "X_test.txt" )))
dataTable <- rbind(dataTrain, dataTest)

## (b) Names column variables in the dataTable
dataFeatures <- tbl_df(read.table(file.path(filesPath2, "features.txt")))
setnames(dataFeatures, names(dataFeatures), c("featureNum", "featureName"))
colnames(dataTable) <- dataFeatures$featureName

## (c) Links activity labels with their activity names
activityLabels<- tbl_df(read.table(file.path(filesPath2, "activity_labels.txt")))
setnames(activityLabels, names(activityLabels), c("activityNum","activityName"))

## (d) Create one datatable (combine all tables) - alldataSubject, alldataActivity, dataTable 
alldataSubjAct<- cbind(alldataSubject, alldataActivity)
dataTable <- cbind(alldataSubjAct, dataTable)

# --------------------------------------------------------------------------------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# --------------------------------------------------------------------------------------------------------------------------------------------------

## (a) Reading "features.txt" and extracting only the mean and standard deviation
dataFeaturesMeanStd <- grep("mean\\(\\)|std\\(\\)",dataFeatures$featureName,value=TRUE) 

## (b) Taking only measurements for the mean and standard deviation and add "subject","activityNum"
dataFeaturesMeanStd <- union(c("subject","activityNum"), dataFeaturesMeanStd)
dataTable<- subset(dataTable,select=dataFeaturesMeanStd) 

# --------------------------------------------------------------------------------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set
# --------------------------------------------------------------------------------------------------------------------------------------------------

## (a) enter name of activity into dataTable
dataTable <- merge(activityLabels, dataTable , by="activityNum", all.x=TRUE)
dataTable$activityName <- as.character(dataTable$activityName)

## (b) create dataTable with variable means sorted by subject and Activity
dataTable$activityName <- as.character(dataTable$activityName)
dataAggr<- aggregate(. ~ subject - activityName, data = dataTable, mean) 
dataTable<- tbl_df(arrange(dataAggr,subject,activityName))

# --------------------------------------------------------------------------------------------------------------------------------------------------
#4. Appropriately labels the data set with descriptive variable names.
# --------------------------------------------------------------------------------------------------------------------------------------------------

## (a) Names before
head(str(dataTable),2)
names(dataTable)<-gsub("std()", "SD", names(dataTable))
names(dataTable)<-gsub("mean()", "MEAN", names(dataTable))
names(dataTable)<-gsub("^t", "time", names(dataTable))
names(dataTable)<-gsub("^f", "frequency", names(dataTable))
names(dataTable)<-gsub("Acc", "Accelerometer", names(dataTable))
names(dataTable)<-gsub("Gyro", "Gyroscope", names(dataTable))
names(dataTable)<-gsub("Mag", "Magnitude", names(dataTable))
names(dataTable)<-gsub("BodyBody", "Body", names(dataTable))

## (b)  Names after
head(str(dataTable),6)

# --------------------------------------------------------------------------------------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data set the average of each variable for each activity and each subject.
# --------------------------------------------------------------------------------------------------------------------------------------------------

## (a) write to text file on disk
write.table(dataTable, "TidyData.txt", row.name=FALSE)

