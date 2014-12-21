Descriptions of the files and data used in this program are available in
the codebook.md in this Repository.

The program run_analysis.R reads in all the files necessary to  the task
at hand:

X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt.

cnames is a vector of the activity names.  The character vector is applied to
the vectors "testlabels" and "trainlabels" to convert them to descriptive names.

The test and training datasets (subject, labels and scores) are combined with the 
training set being added after the test set, to make a single dataset for each making 
three data set - one for subjects, one for labels and one for activity scores.

The three datasets are then combined into a single dataset called 
"activityrecognition".  This contains the data on 561 variables, plus a factor for 
differentiating between test subjects and training subjects, a factor for identifying
activity type and a factor to identify the subjects (ie the individuals tested).

A new data table, "activitysummary" is created by extracting columns from the "activityrecognition" data
table.  Thsi new data table only contains information designated as mean or std from the 
original data table.

This data table has column names added using a colnames statement to add names taken from the "features.txt" dataset.

The data table is then written to a file called "activitymeans.txt".

A statement that calculated the means of all the data columns of "activitysummary.txt" grouped by subject and 
activity type writes these means to a data frame called "activitymeans.txt".



