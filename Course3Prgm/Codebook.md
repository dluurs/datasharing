# title: run_analysis.R
## author: Doug Luurs

### Variables:

Name | Description 
---- | ----
fileURL | DataSet Source URL "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataFileZIP | DataSet Filename  "getdata-projectfiles-UCI-HAR-Dataset.zip"
pathName | Working Directory  "C:/DATA/"
dataSetName | Full path to Compressed DataSet  
dataSetLocation | DataSet Pathname (Uncompressed)  
tidyDataOutA | Tidy DataSet Name  
tidyDataOutB | Tidy DataSet Name w/Averages  
x_train | Source Data  "./UCI HAR Dataset/train/X_train.txt"
X_test | Source Data  "./UCI HAR Dataset/test/X_test.txt"
y_train | Source Data  "./UCI HAR Dataset/train/y_train.txt"
y_test | Source Data  "./UCI HAR Dataset/test/y_test.txt"
subject_train | Source Data  "./UCI HAR Dataset/train/subject_train.txt"
subject_test | Source Data  "./UCI HAR Dataset/test/subject_test.txt"
features | Source Data "./UCI HAR Dataset/features.txt"
activities | Source Data "./UCI HAR Dataset/activity_labels.txt"
xData | Merged DataSets - Samples
yData | Merged DataSets - Activities
sData | Merged DataSets - Subjects
pData | Temp DataSet - Used to created secondary output
index_features | Features Index - Header for output tables
tidyDataSet | First output Table
tidyDataAVGSet | Second output Table 


### Working Directory
C:/Data/
Be sure to have this directory on your system

### Script Run

Load script into "R" and run.

Program will check for the dataset, download and

uncompress as needed.


### Run-time Output
DataSet already downloaded

DataSet already Uncompressed

Reading DataSets

Merging/Combining DataSets

Updating Column Names

Merging Output DataSets

Creating Tidy DataSets

Writing Tidy DataSets

