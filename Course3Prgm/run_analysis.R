# Step 1: Program Init
#
# Dataset Source URL
fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

# Local Downloaded Dataset filename
dataFileZIP <- "getdata-projectfiles-UCI-HAR-Dataset.zip"

# Set Working Directory
pathName <- "C:/Data/"
setwd(pathName)

# Set Full Dataset Pathname
dataSetName <- paste(pathName, dataFileZIP, sep = "")

# Set Uncompressed Dataset Pathname
dataSetLocation <- paste(pathName, "/UCI HAR Dataset", sep = "")

# Set Output File names

tidyDataOutA <- "UCI-HAR-dataset-TIDY.txt"
tidyDataOutB <- "UCI-HAR-dataset-TIDY-AVERAGE.txt"

# Step 2: Acquire Data
#

# Download the dataset (. ZIP), which does not exist
if (file.exists(dataSetName) == FALSE) {
  print ("Downloading Source DataSet")
  download.file(fileURL, destfile = dataSetName)
} else {
  print("DataSet already downloaded")
}

# Uncompress data file
if (file.exists(dataSetLocation) == FALSE) {
  print("DataSet Uncompressing")
  unzip(dataSetName)
} else {
  print("DataSet already Uncompressed")
}

# Step 3: Read Source DataSets
#

print("Reading DataSets")

x_train       <- read.table("./UCI HAR Dataset/train/X_train.txt",       header = FALSE)
X_test        <- read.table("./UCI HAR Dataset/test/X_test.txt",         header = FALSE)
y_train       <- read.table("./UCI HAR Dataset/train/y_train.txt",       header = FALSE)
y_test        <- read.table("./UCI HAR Dataset/test/y_test.txt",         header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt",   header = FALSE)

# Step 4: Merge/Combine DataSets
#

print("Merging/Combining DataSets")

xData <- rbind(x_train, X_test)             # Samples
yData <- rbind(y_train, y_test)             # Activities
sData <- rbind(subject_train, subject_test) # Subjects

# Step 5: Update Column Names
#

print("Updating Column Names")

# Read Column Names
features <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- c('feat_id', 'feat_name')
index_features <- grep("-mean\\(\\)|-std\\(\\)", features$feat_name) 
xData <- xData[, index_features, 2] 

names(xData) <- gsub("\\(|\\)", "", (features[index_features, 2]))
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activities) <- c('act_id', 'act_name')

yData[, 1] = activities[yData[, 1], 2] 

names(yData) <- "Activity"
names(sData) <- "Subject"

# Step 6: Merging Output DataSets
#

print("Merging Output DataSets")

tidyDataSet <- cbind(sData, yData, xData)

print("Creating Tidy DataSets")

pData <- tidyDataSet[, 3:dim(tidyDataSet)[2]] 
tidyDataAVGSet <- aggregate(pData, list(tidyDataSet$Subject, tidyDataSet$Activity), mean)

names(tidyDataAVGSet)[1] <- "Subject"
names(tidyDataAVGSet)[2] <- "Activity"

# Step 7: Write Tidy DataSets
#
print("Writing Tidy DataSets")

write.table(tidyDataSet,    tidyDataOutA, row.names=FALSE)
write.table(tidyDataAVGSet, tidyDataOutB, row.names=FALSE)

# End
