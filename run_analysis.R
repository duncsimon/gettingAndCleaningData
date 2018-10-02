library(dplyr)
library(data.table)

# Load feature (column) names
features <- read.table("./features.txt")

# Load the test data, set column names, and merge
xTest <- read.table("./test/X_test.txt")
colnames(xTest) <- features[,2]
yTest <- read.table("./test/Y_test.txt")
colnames(yTest) <- "activityID"
subjectTest <- read.table("./test/subject_test.txt")
colnames(subjectTest) <- "subjectID"
testMerged <- cbind(xTest, yTest, subjectTest)

# Load the training data, set column names, and merge    
xTrain <- read.table("./train/X_train.txt")
colnames(xTrain) <- features[,2]
yTrain <- read.table("./train/Y_train.txt")
colnames(yTrain) <- "activityID"
subjectTrain <- read.table("./train/subject_train.txt")
colnames(subjectTrain) <- "subjectID"
trainMerged <- cbind(xTrain, yTrain, subjectTrain)

# Load activity labels and set column names
activityLabels <- read.table("./activity_labels.txt")
colnames(activityLabels) <- c("activityID", "activityType")

# Merge the test and training data
mergedData <- rbind(testMerged, trainMerged)
columnNames <- colnames(mergedData)

# Get only the selected measurement columns
selectedCols <- columnNames[grep("activityID|subjectID|mean\\()|std\\()", columnNames)]
mergedData <- mergedData[, selectedCols]

# Use descriptive activity names to name the activities in the data set
# Remove the activityID column
mergedData <- left_join(mergedData, activityLabels, by="activityID")
mergedData$activityID <- NULL

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Write the table as csv
tidyData <- aggregate(mergedData[, names(mergedData) != c("activityType","subjectID")], 
                          by = list(activityType = mergedData$activityType, 
                                    subjectID = mergedData$subjectID), 
                          mean)
write.table(tidyData, "./averages_by_activity_and_subject.txt", row.names=FALSE)

