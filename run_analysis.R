## Getting and Cleaning Data - Course Project

# 1. Merges the training and the test sets to create one data set
# Load data
features <- read.table("features.txt", header = FALSE)
X <- read.table("X_train.txt", header = FALSE, sep = "", dec = ".")
Xt <- read.table("X_test.txt", header = FALSE, sep = "", dec = ".")
Y <- read.table("y_train.txt")
Yt <- read.table("y_test.txt")
Xid <- read.table("subject_train.txt", header = FALSE)
Xtid <-read.table("subject_test.txt", header = FALSE)

# Merge the data as same categories
dataset <- rbind(X, Xt)
subject <- rbind(Xid, Xtid)
activity <- as.data.frame(rbind(Y, Yt))

# Naming the data as each variables
names(dataset) <- features[,2]
names(subject) <- "Subject"
names(activity) <- "Activity"

# Merge all information as one data.frame
dataset <- cbind(dataset, subject, activity)


# 2. Extracts only the measurements on the mean and standard deviation
# for each measurement. 
extractColNum <- c(grep("mean()", features[,2], fixed = TRUE), grep("std()", features[,2], fixed = TRUE))
tidyset <- cbind(dataset[,extractColNum], subject, activity)


# 3. Uses descriptive activity names to name the activities in the data set
actLabelTbl <- read.table("activity_labels.txt", header = FALSE)
tidyset$Activity <- factor(tidyset$Activity, actLabelTbl[,1], actLabelTbl[,2])

# 4. Appropriately labels the data set with descriptive variable names.
library(reshape2)
tidyset2 <- melt(tidyset, id = c("Subject", "Activity"), na.rm=TRUE)

# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
tidyset3 <- dcast(tidyset2, Subject + Activity ~ variable, mean)
write.table(tidyset3, file = "tidyset.txt", row.name = FALSE)
# loadOutput <- read.table("tidyset.txt", header = TRUE)
