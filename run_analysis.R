library(reshape2)
setwd("I:/Current/Group Internal Audit/Actuarial Team/Charl/Training/0_Coursera/Data Science Specialization/3_Getting and Cleaning Data/Week 4")
file <- "Project.zip"

# Download and unzip the data
if(!file.exists(file)){
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, destfile = file, method = "curl")
}
if(!file.exists("UCI HAR Dataset")){
  unzip(file)
}

# Load activity labels and features
labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
View(features)

# Extract only the data on mean and standard deviation
f2use <- grep(".*mean.|.*std.",features$V2)
features_names <- features[f2use,2]
features_names

# Load the datasets
# Training data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")[f2use]
subj_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
train <- cbind(subj_train,y_train,X_train)
# Testing data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")[f2use]
subj_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
test <- cbind(subj_test,y_test,X_test)

# Merge datasets and add labels
all <- rbind(train, test)
colnames(all) <- c("Subject", "Activity", as.character(features_names))

# Turn activities and subjects into factors
all$Subject <- as.factor(all$Subject)
all$Activity <- factor(all$Activity, levels = labels[,1], labels = labels[,2])

library(dplyr)
all2gether <- melt(all, id=c("Subject", "Activity"))
allmean <- dcast(all2gether, Subject + Activity ~ variable, mean)

write.table(allmean,"tidy.txt",row.names = F, quote = F)

