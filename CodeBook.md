## Code book for Getting and Cleaning Data - peer assessment project

### Soruce of data sets: Human Activity Recognition Using Smartphones Dataset
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

source of the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
## The original data was transformed by

Run the R script called run_analysis.R to perform the following data cleaning.
1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive activity names. 
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject. 

## for answer to Q1, run from line 1 to 65
## for answer to Q2, run from line 71 to 86
## for answer to Q3, run from line 90 to 109
## for answer to Q4, run from line 113 to 125
## for answer to Q5, run from line 129 to 138


#### List of the original data sets inside the downloaded zip file:

 	 - 'README.txt': describes about the general information and background related to the data sets within the zip file.
	
 	 - 'features_info.txt': Shows information about the variables used on the feature vector.

   	 - 'features.txt': List of all features.

   	 - 'activity_labels.txt': Links the class labels with their activity name.

   	 - 'train/X_train.txt': Training set.

   	 - 'train/y_train.txt': Training labels.

   	 - 'test/X_test.txt': Test set.

   	 - 'test/y_test.txt': Test labels.
   
    	 - 'train/subject_train.txt':   Each row identifies the subject who performed the activity for each window sample.
            Its range is from 1 to 30. (for training set)
   
  	 - 'test/subject_test.txt':  Each row identifies the subject who performed the activity for each window sample.
  	    Its range is from 1 to 30. (for test set)
      
   	  The following data sets are not been used in the current project. 

   	 - 'train/Inertial Signals/total_acc_x_train.txt'; 'train/Inertial Signals/body_acc_x_train.txt';
   	   'train/Inertial Signals/body_gyro_x_train.txt'. More information related to these three data sets can be
   	    found in 'README.txt', 'feature_info.txt' and 'feature.txt' and the original website.
    
    
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

	Additional vectors obtained by averaging the signals in a signal window sample. 
	These are used on the angle() variable:

		gravityMean
		tBodyAccMean
		tBodyAccJerkMean
		tBodyGyroMean
		tBodyGyroJerkMean

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

##### Unit:

Features are normalized and bounded within [-1,1]. In other words, they are unitless.

------------------------------------------------------------------------------------------------
#### Original data sets: selected input data variables

Based on the requirement of the course project, I only selected those input variables
related to the measurements on the mean and standard deviation for each measurement.
(see the section of "Instruction and Requirements" in README.md)

They are the following:

	tBodyAcc-mean()-X           tBodyAcc-mean()-Y           tBodyAcc-mean()-Z           tBodyAcc-std()-X           
	tBodyAcc-std()-Y            tBodyAcc-std()-Z            tGravityAcc-mean()-X        tGravityAcc-mean()-Y       
	tGravityAcc-mean()-Z        tGravityAcc-std()-X         tGravityAcc-std()-Y         tGravityAcc-std()-Z        
	tBodyAccJerk-mean()-X       tBodyAccJerk-mean()-Y       tBodyAccJerk-mean()-Z       tBodyAccJerk-std()-X       
	tBodyAccJerk-std()-Y        tBodyAccJerk-std()-Z        tBodyGyro-mean()-X          tBodyGyro-mean()-Y         
	tBodyGyro-mean()-Z          tBodyGyro-std()-X           tBodyGyro-std()-Y           tBodyGyro-std()-Z          
	tBodyGyroJerk-mean()-X      tBodyGyroJerk-mean()-Y      tBodyGyroJerk-mean()-Z      tBodyGyroJerk-std()-X      
	tBodyGyroJerk-std()-Y       tBodyGyroJerk-std()-Z       tBodyAccMag-mean()          tBodyAccMag-std()          
	tGravityAccMag-mean()       tGravityAccMag-std()        tBodyAccJerkMag-mean()      tBodyAccJerkMag-std()      
	tBodyGyroMag-mean()         tBodyGyroMag-std()          tBodyGyroJerkMag-mean()     tBodyGyroJerkMag-std()     
	fBodyAcc-mean()-X           fBodyAcc-mean()-Y           fBodyAcc-mean()-Z           fBodyAcc-std()-X           
	fBodyAcc-std()-Y            fBodyAcc-std()-Z            fBodyAccJerk-mean()-X       fBodyAccJerk-mean()-Y      
	fBodyAccJerk-mean()-Z       fBodyAccJerk-std()-X        fBodyAccJerk-std()-Y        fBodyAccJerk-std()-Z       
	fBodyGyro-mean()-X          fBodyGyro-mean()-Y          fBodyGyro-mean()-Z          fBodyGyro-std()-X          
	fBodyGyro-std()-Y           fBodyGyro-std()-Z           fBodyAccMag-mean()          fBodyAccMag-std()          
	fBodyBodyAccJerkMag-mean()  fBodyBodyAccJerkMag-std()   fBodyBodyGyroMag-mean()     fBodyBodyGyroMag-std()     
	fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std() 

The complete list of variables of each feature vector is available in 'features.txt'


### Tidy data sets

#### Tiday data set: new variable names

* New variable names were from selected input data variables (see previous section)
* The names were modified mainly to avoid any unnecessary errors in R when this tidy data set 
  is used as an input data during any data analysis in the future. The methods and reasons are 
  based on the instruction from the course video-sildes (Week 4: Editing text variables).
  
  + The following were modified:
    -- lower cases; removed bad characters "()"; replaced "-" to "."

* The activity names are also be modified such as: lower cases; removed "_"
  new activity names: laying, sitting, standing, walking, walkingdownstairs and walkingupstairs.