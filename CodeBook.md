First the run_analysis.R file description
___________________________________________


The script proceeds in the following order

1- the script reads the 2 data files (test and train) into the dataframes test\_data and train\_data resp.

2- labels for both datasets are read into the dataframes test\_label and train\_label

3- Subjects  for both sets are read into the dataframes test\_subject and train\_subject

4- "data" data frame are created containing ALL the data, labels, and subjects using the "rbind and cbind" commands

5- feature vector file is read into dataframe "features, this dataframe is used to label the columns in "data", 2 extra columns are created names "Activity" and "subject" so that all columns in "data" do have meaningful names 

6- a subset of the features in "data" is selected that are related to "mean" and "std" using the function grep

7- sort the indices of those matching features into a vector "sorted_index" and get the traspose of the "features" dataframe to convert to a vector of feature names called "nm"

8- a new dataframe is created to include the required features only called "new_features"

9- "new_features" dataframe is used to create a "sub_data" dataframe that has those selected features, activity, and subjects with the columns named accordinly

The first column is the "Activity", second "Subject" and the remaining columns with mean and std features 

10- In this step I group each activity for each subject in a new dataframe labeld "clean_data" and calcualte the mean for the feature columns in each group, the resulting clean data is put in "tidy_data" dataframe resulting in 180 observations (30 subjects in 6 activities) and assign activity names according to the activity code given

11- Finally, prepare the data to write to the output file using "table.write" command


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



The result.txt file contains 180 observations (rows) for each activity for each subject and the average for the features containing "mean" or "Std" in their names.

Each record of the result.txt file contains the following data in order:
=======================================================================

1- "Activity": representing the activity label obtained using the given activity codes
2- "Subject": the subject who did the activity
3- A set of 86 average values for the selected mean and std varaibles as requested those varaibles are labled by the given varaible (feature) name and the value recoreded is the average for the selected values, their names are as follows:

"tBodyAcc.mean...X"	"tBodyAcc.mean...Y"	"tBodyAcc.mean...Z"	"tBodyAcc.std...X"	"tBodyAcc.std...Y"	"tBodyAcc.std...Z"	"tGravityAcc.mean...X"	"tGravityAcc.mean...Y"	"tGravityAcc.mean...Z"	"tGravityAcc.std...X"	"tGravityAcc.std...Y"	"tGravityAcc.std...Z"	"tBodyAccJerk.mean...X"	"tBodyAccJerk.mean...Y"	"tBodyAccJerk.mean...Z"	"tBodyAccJerk.std...X"	"tBodyAccJerk.std...Y"	"tBodyAccJerk.std...Z"	"tBodyGyro.mean...X"	"tBodyGyro.mean...Y"	"tBodyGyro.mean...Z"	"tBodyGyro.std...X"	"tBodyGyro.std...Y"	"tBodyGyro.std...Z"	"tBodyGyroJerk.mean...X"	"tBodyGyroJerk.mean...Y"	"tBodyGyroJerk.mean...Z"	"tBodyGyroJerk.std...X"	"tBodyGyroJerk.std...Y"	"tBodyGyroJerk.std...Z"	"tBodyAccMag.mean.."	"tBodyAccMag.std.."	"tGravityAccMag.mean.."	"tGravityAccMag.std.."	"tBodyAccJerkMag.mean.."	"tBodyAccJerkMag.std.."	"tBodyGyroMag.mean.."	"tBodyGyroMag.std.."	"tBodyGyroJerkMag.mean.."	"tBodyGyroJerkMag.std.."	"fBodyAcc.mean...X"	"fBodyAcc.mean...Y"	"fBodyAcc.mean...Z"	"fBodyAcc.std...X"	"fBodyAcc.std...Y"	"fBodyAcc.std...Z"	"fBodyAcc.meanFreq...X"	"fBodyAcc.meanFreq...Y"	"fBodyAcc.meanFreq...Z"	"fBodyAccJerk.mean...X"	"fBodyAccJerk.mean...Y"	"fBodyAccJerk.mean...Z"	"fBodyAccJerk.std...X"	"fBodyAccJerk.std...Y"	"fBodyAccJerk.std...Z"	"fBodyAccJerk.meanFreq...X"	"fBodyAccJerk.meanFreq...Y"	"fBodyAccJerk.meanFreq...Z"	"fBodyGyro.mean...X"	"fBodyGyro.mean...Y"	"fBodyGyro.mean...Z"	"fBodyGyro.std...X"	"fBodyGyro.std...Y"	"fBodyGyro.std...Z"	"fBodyGyro.meanFreq...X"	"fBodyGyro.meanFreq...Y"	"fBodyGyro.meanFreq...Z"	"fBodyAccMag.mean.."	"fBodyAccMag.std.."	"fBodyAccMag.meanFreq.."	"fBodyBodyAccJerkMag.mean.."	"fBodyBodyAccJerkMag.std.."	"fBodyBodyAccJerkMag.meanFreq.."	"fBodyBodyGyroMag.mean.."	"fBodyBodyGyroMag.std.."	"fBodyBodyGyroMag.meanFreq.."	"fBodyBodyGyroJerkMag.mean.."	"fBodyBodyGyroJerkMag.std.."	"fBodyBodyGyroJerkMag.meanFreq.."	"angle.tBodyAccMean.gravity."	"angle.tBodyAccJerkMean..gravityMean."	"angle.tBodyGyroMean.gravityMean."	"angle.tBodyGyroJerkMean.gravityMean."	"angle.X.gravityMean."	"angle.Y.gravityMean."	"angle.Z.gravityMean."

