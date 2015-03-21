# 'Getting and cleaning Data' - Course project - Code Book
### Raw data
The original dataset contains information about 30 volunteers performing 6 different activities with a smartphone. Specifically, the raw data has information related to the smartphone's movements.

The files processed through the analysis are the following:

* **`activities.txt`** has names and IDs of 6 activities.
* **`features.txt`** includes the names of 561 features.
* **`X_train.txt`** contains 7,352 observations corresponding the 561 features from 21 out of the 30 volunteers.
* **`subject_train.txt`** contains IDs of the volunteers for each observation within `X_train.txt`.
* **`Y_train.txt`** denotes the activity ID of each observation within `X_train.txt`.
* **`X_test.txt`** contains 2,947 observations corresponding the 561 features from 9 out of the 30 volunteers.
* **`Y_test.txt`** denotes the activity ID of each observation within `X_test.txt`.
* **`subject_test.txt`** contains IDs of the volunteers for each observation within `X_test.txt`.

### Main variables
* **`merge_data.x`** and **`merge_data.y`** include both training and test datasets.
* **`merge_data.subject`** includes IDs of volunteers for each observation in training and test datasets.
* **`features`** lists all the features.
* **`mean_and_std_columns`** identifies the columns' names containing either 'mean' or 'std'.
* **`all_info`** combines `merge_data.x`, `merge_data.y`, and `merge_data.subject`, as well as descriptive names of activities.

### Transformations
1. Training and test sets are merged into `merge_data.x`, `merge_data.y`, and `merge_data.subject`.
2. Measurements related to the mean and standard deviations ar filtered by processing the file `features.txt`.
3. Replace activities IDs by descriptive activity names from `activity.txt`.
4. The final dataset `all_info`is obtained by combining  `merge_data.x`, `merge_data.y`, and `merge_data.subject`.
5.  `all_info` is summarized and exported to  the file `averages_data.txt`, computing the average of each variable for each activity and each subject.
