# gettingAndCleaningData

This repo contains the script and documentation for the final project of the Getting and Cleaning Data Coursera course.

The following instructions explain how to run the script, and what its function is:
1. Download and unzip the data located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
    * A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2. Set <code>/UCI HAR Dataset</code> as the working directory.
3. Execute the <code>run_analysis.R</code> script - the output should be a file named <code>averages_by_activity_and_subject.txt</code>.

<code>run_analysis</code> performs the following actions:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This is the file described in instruction 3. above.
