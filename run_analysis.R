#####################################################################
## Q1.  Merges the training and the test sets to create one data set.

# Set Working DIR and Get the dateset from online

#1, Set the working directory
rm(list=ls()) #clear the environment variables
setwd("D:/Developer Room/GettingAndCleaningDataAssignment")

#create a data folder for the download and data set
if(!file.exists("./data")){dir.create("./data")}

#2, Downloading the zipped data set to the data folder
downloadUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(downloadUrl,destfile="./data/UCI_HAR_Dataset.zip", method="curl")

#3 Unzip the downloaded file in the data folder making sure it unzips into the data folder
unzip(zipfile="./data/UCI_HAR_Dataset.zip",exdir="./data")


# loading training data into R memory and have a quick look at the data

#4, use read.table to read the text data files and assign names (considering the data file names itself) to them
# reading the training data files
x_training <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_training <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_training <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#5, take a brief overview of the traning files loaded into R memory
head(x_training)  #show top 6 observations data for x_training
dim(x_training)   #check dimension of the data
names(x_training) #it can be seen that the variables are named as v1 to v561, They are not interpretative
summary(x_training)

head(y_training)  #show top  6 observations for y_training
dim(y_training)   #check dimension of the data
names(y_training) #note, it is observed that column name in the y_training data has only a V1 column which is not easily interpretative
summary(y_training) #This are the activity description labeling

head(subject_training)  #show top  6 observations for subject_training
names(subject_training) #note, it is observed that the column name V1 in the subject_training data is not easily interpretative
dim(subject_training)   #check dimension of the data
summary(subject_training)

# loading testing data into R memory 

#6, reading the testing data files
x_testing <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_testing <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_testing <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")


# reading other files (ire feature and activity label text data)

#7 read the features text file and the activity text file
features <- read.table('./data/UCI HAR Dataset/features.txt') #these are the activity data column descriptions
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
head(activity_labels) #

# merge the training data with the test data
#since both the training and the testing data set all have same column names and number of columns, they can be merged
#8 merge the data sets
activityData_merged  <- rbind(x_training, x_testing) #This are the activity data itself
activityLabel_merged  <- rbind(y_training, y_testing)  #This are the activity description labeling
subject_merged <- rbind(subject_training, subject_testing) 




##############################################################################################
## Q2.  Extracts only the measurements on the mean and standard deviation for each measurement. 

summary(activityLabel_merged)

#9 to extract measurements for the mean and standard deviation
# need to select only mean and standard deviation, but they are not interpretative from the 'activityData_merged' data set
# however, the description of column names can be found in the 'features' data set
# thus, look-up "mean" or "std" in any observations in the second column of the 'features' data set,
# Use grepl to create a true or false vector named as 'measurement_index' for sub-setting the data

measurement_index <- (grepl("mean|std" , features$V2))
length(measurement_index)
sum(measurement_index) #how many columns contained text that had mean or std values

#10, sUbset the dataset for mean and std columns only
subsetMean_Std_Data <- activityData_merged[, measurement_index==TRUE] 


################################################################################
## Q3.  Uses descriptive activity names to name the activities in the data set 

#rename activity id in activity merged data set
library(dplyr)

#renamve v1 to activity_id in activityLabel_merged
activityLabel_merged <- rename(activityLabel_merged,activity_id=V1)

#renamve v1 to subject_id in subject_merged
subject_merged <- rename(subject_merged,subject_id=V1)

#rename activity labels
activity_labels <- rename(activity_labels,activity_id=V1, activity_description=V2)

#merge activity labels to activtyLabelMerged
activity_all <- merge(activityLabel_merged,activity_labels, by='activity_id', all = TRUE)

#to use the data descriptions in the features to change the column names in the 'subsetMean_Std_Data' data
#will use the the rowindex from 'measurement_index' to filter the observations in features and the second column of features
colnames(subsetMean_Std_Data) <- features[measurement_index, 2] 


################################################################################
## Q4.  Appropriately labels the data set with descriptive variable names. 


#11, Now, there is the need to tidy up the COlumn Names
#first, tidy up the data description text to be all in lower case, 
colnames(subsetMean_Std_Data) <- tolower(colnames(subsetMean_Std_Data))

#and remove any characters deemed not tidy for column names such as * or - or \ etc
colnames(subsetMean_Std_Data) <- gsub("\\(|\\)", "", colnames(subsetMean_Std_Data)) 
colnames(subsetMean_Std_Data) <- gsub("-", "_", colnames(subsetMean_Std_Data))

#merge with subject to produce activityId,subjectId, and the mean to std measurements
cleanDataSet  <- cbind(activity_all, subject_merged, subsetMean_Std_Data)


#########################################################################################
## Q5.  From the data set in step 4, creates a second, independent tidy data set with the 
##      average of each variable for each activity and each subject.


#tidy data set 
library(reshape2)
pivotedData <- melt(cleanDataSet, id=c("activity_id","activity_description", "subject_id"), measure.vars = c(4:82))

tidyDataSet <- dcast(tidyDataSet, activity_id + subject_id ~variable, mean)
