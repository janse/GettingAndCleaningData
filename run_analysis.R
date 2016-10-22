# Load necessary packages
library(dplyr)
library(data.table)
library(reshape2)

# Preserve working directory and prepare workspace
owd <- getwd()
nwd <- "UCI HAR Dataset"

if (file.exists(nwd)) {
  setwd(nwd)
} else {
  url <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, "UCI_HAR_Dataset.zip")
  system("unzip UCI_HAR_Dataset.zip")
  setwd(nwd)
}

# Read and combine Test files
subject <- fread("test/subject_test.txt")
names(subject) <- "subject"
y <- fread("test/y_test.txt")
names(y) <- "activity"
x <- fread("test/X_test.txt")
test <- cbind(x, y, subject)

# Read and combine Training files
subject <- fread("train/subject_train.txt")
names(subject) <- "subject"
y <- fread("train/y_train.txt")
names(y) <- "activity"
x <- fread("train/X_train.txt")
train <- cbind(x, y, subject)

# Combine Test and Training data
data <- rbind(test, train)

# Translate activity numbers into activity names
activity_labels <- fread("activity_labels.txt")
data <- inner_join(data, activity_labels, by = c("activity" = "V1"))

# Keep only subject, activity, mean, and standard deviation
features <- fread("features.txt")
features <- features[grep("mean|std", features$V2), ]
features$V2 <- gsub("\\()", "", features$V2)
features$V2 <- gsub("-", "_", features$V2)
cols <- c(563, 564, features$V1)
colNames <- c("subject", "activity", features$V2)
data <- select(data, cols)
names(data) <- colNames

# Create tidy data set showing average of each measurement for each subject and each activity
tidy <- melt(data, id = 1:2)
tidy <- dcast(tidy, activity + subject + variable ~ ., mean)
names(tidy) <- c("activity","subject","measurement","mean")

# Save tidy data set as a txt file
write.table(tidy, file = "tidy.txt", append = FALSE)

# Restore working directory
setwd(owd)