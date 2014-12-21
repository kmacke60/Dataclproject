## The data - downloaded the Dataset.zip file and extracted contents.
### Used X_test and X_train, subject_test.txt, subject_train.txt, y_test.txt, y_train.txt.

X_test has 561 variables and 2947 rows.
X_train has 561 variables and 7352 rows.
subject_test and y_test each have 1 variable and 2947 rows.
subject_train and y_train have 1 variable and 7352 rows.

The variable names are described in the features file included in this directory "features.txt".

In the X_test and X_triain files, there are 7 variables, in each direction (X, Y, Z) and a further 9 variable measuring magnitudes, on which 17 summary 
statistics have been collected either in the individual direction or on the (x,y,z) triplet.

subject_test and subject_train are the identifiers for the individuals that took part in the trial.  y_test and y_train give
the activity identifiers for the test and training datasets.

I copied all these files to a common directory.  Then I read them into data ojects in R using read.table.  A column was added to
each of the X_test and X_train datasets identifing them as "test" or "train".

The activity identifiers are coded as "1", "2", ..., "6" and these were translated into identifiers as follows:
1 = "WALKING"
2 = "WALKING_UPSTAIRS"
3 = "WALKING_DOWNSTAIRS"
4 = "SITTING"
5 = "STANDING"
6 = "LAYING" 


The dataframes were combined into a single dataframe "ActivityRecognition"  which is a data.frame with 10299 obs. of 564 variables:
a factor to identify whether the row originated in the test set or the training set, in identifier for the indivuals, and activitiy
identifier and the 561 measurements from the Samsung Smartphones.

The variables of interest were then copied into a further dataframe ie the columns for the mean and standard deviations for:

1  tBodyAcc
2  tGravityAcc
3  tBodyAccJerk
4  tBodyGyro
5  tBodyGyroJerk
6  fBodyAcc
7  fBodyAccJerk
8  fBodyGyro
9  tBodyAccMag
10 tGravityAccMag
11 tBodyAccJerkMag
12 tBodyGyroMag
13 tBodyGyroJerkMag
14 fBodyAccMag
15 fBodyBodyAccJerkMag
16 fBodyBodyGyroMag
17 fBodyBodyGyroJerkMag

For the first 8 variables, there are three columns, one for each direction, for both the mean and the standard deviation.  
This gives a total of 8*6 + 9*2 columns ie 66 columns.

The R code for this is in "preprocessing.R"

The "tidy" dataset was saved to "ActivitySummary.txt".

From this file, a summary file has been created using the R code in "run_analysis.R".  This file, "ActivityMeans.txt" contains
the means of each column from the file "ActivitySummary.txt" for each of the 30 subjects and each of the 6 activities.  The file includes
a header row of variable names and a column identifying the 30 subjects (1-30) and the 6 activities described above. 

