library(plyr)

####################################################################################################
# Step 1 - Merge the training and the test sets to create one data set
####################################################################################################

# Read all the files

training_data.x_train <- read.table("train/X_train.txt")
training_data.y_train <- read.table("train/y_train.txt")
training_data.subject_train <- read.table("train/subject_train.txt")

test_data.x_test <- read.table("test/X_test.txt")
test_data.y_test <- read.table("test/y_test.txt")
test_data.subject_test <- read.table("test/subject_test.txt")

# Merge train and test data

merge_data.x <- rbind(training_data.x_train, test_data.x_test)
merge_data.y <- rbind(training_data.y_train, test_data.y_test)
merge_data.subject <- rbind(training_data.subject_train, test_data.subject_test)

####################################################################################################
# Step 2 - Extract only the measurements on the mean and standard deviation for each measurement
####################################################################################################

# Read features info

features <- read.table("features.txt")

# Identify columns containing mean or std

mean_and_std_columns <- grep("-(mean|std)\\(\\)", features[, 2])

# Subset column names

merge_data.x <- merge_data.x[, mean_and_std_columns]

# Change column names

names(merge_data.x) <- features[mean_and_std_columns, 2]

####################################################################################################
# Step 3 - Use descriptive activity names to name the activities in the data set
####################################################################################################

# Read activities info

activities <- read.table("activity_labels.txt")

# Replace variable values by activities labels

merge_data.y[, 1] <- activities[merge_data.y[, 1], 2]

# Change column name

names(merge_data.y) <- "activity"

####################################################################################################
# Step 4 - Appropriately label the data set with descriptive variable names
####################################################################################################

# Change columns names in subject

names(merge_data.subject) <- "subject"

# Join all data into a single one

all_info <- cbind(merge_data.x, merge_data.y, merge_data.subject)

####################################################################################################
# Step 5 -  Create a second, independent tidy data set with the average of each variable for each
#           activity and each subject
####################################################################################################

# Average values

average_info <- ddply(all_info, .(subject, activity), function(x) colMeans(x[, 1:66]))


# Write table

write.table(average_info, "averages_data.txt", row.name=FALSE)