library(dplyr)
if(!file.exists("C:/DataClean/Project")) {
        dir.create("C:/DataClean/Project")
}
setwd("C:/DataClean/Project")
test <- read.table("c:/DataClean/Project/UCI HAR Dataset/test/X_test.txt")
train <- read.table("c:/DataClean/Project/UCI HAR Dataset/train/X_train.txt")

subjecttest <- read.table("c:/DataClean/Project/UCI HAR Dataset/test/subject_test.txt")
subjecttrain <- read.table("c:/DataClean/Project/UCI HAR Dataset/train/subject_train.txt")
testlabels <- read.table("c:/DataClean/Project/UCI HAR Dataset/test/y_test.txt")
trainlabels <- read.table("c:/DataClean/Project/UCI HAR Dataset/train/y_train.txt")
cnames <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

labelschar <- c(rep("a", times=2947))

for (i in 1:2947) {
  if (testlabels[i,1] == 1) {labelschar[i] <- cnames[1]}
  if (testlabels[i,1] == 2) {labelschar[i] <- cnames[2]}
  if (testlabels[i,1] == 3) {labelschar[i] <- cnames[3]}
  if (testlabels[i,1] == 4) {labelschar[i] <- cnames[4]}
  if (testlabels[i,1] == 5) {labelschar[i] <- cnames[5]}
  if (testlabels[i,1] == 6) {labelschar[i] <- cnames[6]}
}  
testlabelled <- cbind(labelschar,test)

labelschar <- c(rep("a",times=7352))
for (i in 1:7352) {
  if (trainlabels[i,1] == 1) {labelschar[i] <- cnames[1]}
  if (trainlabels[i,1] == 2) {labelschar[i] <- cnames[2]}
  if (trainlabels[i,1] == 3) {labelschar[i] <- cnames[3]}
  if (trainlabels[i,1] == 4) {labelschar[i] <- cnames[4]}
  if (trainlabels[i,1] == 5) {labelschar[i] <- cnames[5]}
  if (trainlabels[i,1] == 6) {labelschar[i] <- cnames[6]}
}  

subjects <- rbind(subjecttest,subjecttrain)
colnames(subjects) <- "subject"
trainlabelled <- cbind(labelschar,train)

activityrecognition <- rbind(testlabelled,trainlabelled)
datatype <- c(rep("test",times=2947),rep("train",times=7352))
activityrecognition <- cbind(datatype,subjects,activityrecognition)

activitysummary <- select(activityrecognition,1:9,44:49,84:89,124:129,164:169,204,205,217,218,230,231,
                    243,244,256,257,269:274,348:353,427:432,506,507,519,520,
                    532,533,545,546)

colnames(activitysummary) <- c("datatype","subject","activity","tbodyaccmeanX", "tbodyaccmeanY", "tbodyaccmeanZ", "tbodyaccstdX", "tbodyaccstdY", 
                               "tbodyaccstdZ","tgravityaccmeanX","tgravityaccmeanY","tgravityaccmeanZ","tgravityaccstdX","tgravityaccstdY",
                               "tgravityaccstdZ","tbodyaccjerkmeanX","tbodyaccjerkmeanY","tbodyaccjerkmeanZ","tbodyaccjerkstdX",
                               "tbodyaccjerkstdY","tbodyaccjerkstdZ","tbodygyromeanX","tbodygyromeanY","tbodygyromeanZ","tbodygyrostdX",
                               "tbodygyrostdY","tbodygyrostdZ","tbodygyrojerkmeanX","tbodygyrojerkmeanY","tbodygyrojerkmeanZ",
                               "tbodygyrojerkstdX","tbodygyrojerkstdY","tbodygyrojerkstdZ","tbodyaccmagmean","tbodyaccmagstd",
                               "tgravityaccmagmean","tgravityaccmagstd","tbodyaccjerkmagmean","tbodyaccjerkmagstd","tbodygyromagmean",
                               "tbodygyromagstd","tbodygyrojerkmagmean","tbodygyrojerkmagstd","fbodyaccmeanX","fbodyaccmeanY","fbodyaccmeanZ",
                               "fbodyaccstdX","fbodyaccstdY","fbodyaccstdZ","fbodyaccjerkmeanX","fbodyaccjerkmeanY","fbodyaccjerkmeanZ",
                               "fbodyaccjerkstdX","fbodyaccjerkstdY","fbodyaccjerkstdZ","fbodygyromeanX","fbodygyromeanY","fbodygyromeanZ",
                               "fbodygyrostdX","fbodygyrostdY","fbodygyrostdZ","fbodyaccmagmean","fbodyaccmagstd","fbodybodyaccjerkmagmean",
                               "fbodybodyaccjerkmagstd","fbodybodygyromagmean","fbodybodygyromagstd","fbodybodygyrojerkmagmean","fbodybodygyrojerkmagstd")

write.table(activitysummary, "activitysummary.txt",row.name=FALSE)

activitymeans <- summarise_each(group_by(activitysummary,subject,activity),funs="mean")

write.table(activitymeans,"activitymeans.txt",row.name=FALSE)
