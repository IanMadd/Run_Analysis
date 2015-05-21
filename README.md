**Run Analysis**
================

 

This project uses data from a study of 30 subjects using activity trackers in
Samsung smartphones. The smartphones recorded acceleration and angular velocity
while the subjects performed one of six activities (WALKING, WALKING\_UPSTAIRS,
WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING).

 

The 30 subjects are split into two groups, test and train. The run\_analysis.R
file takes the data from these two groups and combines them into one file and
labels the variables based on the measured features.

 

Sudo Code
---------

### Creating a Tidy Data Set

For this project I’m creating a tidy data set that merges the test and train
data into one data.frame and labels the columns so they are understandable.

 

1.  First I import each file into R as a separate data.frame

2.  Next I add a TestOrTrain column to the subject files indicating whether the
    subjects were testing or training.

3.  cbind the y\_test and y\_train files to the subject\_test and subject\_train
    files

4.  rename the new columns. The original subject\_test & subject\_train columns
    are renamed “Subject”. The added y\_test and y\_train columns are renamed
    “Activity”.

5.  Rename the X\_test and X\_train column names with the names pulled from the
    features.txt file.

6.  cbind the X\_test and X\_train to the subject\_test and subject\_train
    data.frames.

7.  rbind the subject\_test and subject\_train data.frames into one large
    data.frame called Tidy\_Data

8.  replace the activity numbers in the Activity column with their respective
    values in the Activity\_Values file.

 

### Creating a New Data Set

Using aggregate() and the I’ll create a new data set (“Tidy\_data\_aggregate”)
with one row for each activity for each each subject, showing the mean of each
variable. There is a total of 180 rows with 561 measured variables.

 

 
