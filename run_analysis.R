# Set Working DIR and Get the dateset from online
##################################################

#1, Set the working directory
setwd("D:/Developer Room/GettingAndCleaningDataAssignment")

#create a data folder for the download and data set
if(!file.exists("./data")){dir.create("./data")}

#2, Downloading the zipped data set to the data folder
downloadUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(downloadUrl,destfile="./data/UCI_HAR_Dataset.zip", method="curl")

#3 Unzip the downloaded file in the data folder making sure it unzips into the data folder
unzip(zipfile="./data/UCI_HAR_Dataset.zip",exdir="./data")


# Now to Merges the training data with the test data
#######################################################
