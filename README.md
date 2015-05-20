**Run Analysis**
================

Data Summary
------------

This is a study involving 30 volunteers who used Samsung smartphones to record
physical activities.

###  

The dataset includes the following files:

1.  "body\_acc\_x\_test.txt"

2.  "body\_acc\_x\_train.txt"

3.  "body\_acc\_y\_test.txt"

4.  "body\_acc\_y\_train.txt"

5.  "body\_acc\_z\_test.txt"

6.  "body\_acc\_z\_train.txt"

7.  "body\_gyro\_x\_test.txt"

8.  "body\_gyro\_x\_train.txt"

9.  "body\_gyro\_y\_test.txt"

10. "body\_gyro\_y\_train.txt"

11. "body\_gyro\_z\_test.txt"

12. "body\_gyro\_z\_train.txt"

13. "total\_acc\_x\_test.txt"

14. "total\_acc\_x\_train.txt"

15. "total\_acc\_y\_test.txt"

16. "total\_acc\_y\_train.txt"

17. "total\_acc\_z\_test.txt"

18. "total\_acc\_z\_train.txt"

19. "X\_test.txt"

20. "X\_train.txt"

21. "y\_test.txt"

22. "y\_train.txt"

23. "subject\_test.txt"

24. "subject\_train.txt"

25. “features.txt"

26. “Activity\_Labels.txt"

 

File Descriptions:
------------------

 

For this project we are ignoring the raw data (files 1 - 18). We only care about
the files numbered 19 - 26.

There are two sets of files, train and test files. The train files have 7352
observations (rows) and the test files have 2947 observations (rows).

 

**Subject Files:**

-   subject\_test.txt

-   subject\_train.txt

 

Both files contain one column. There are 30 volunteers in this study, numbered 1
through 30. Each row in both files identifies the volunteer who performed the
activity associated with that row.

-   There are 21 train volunteers with numbers: 1, 3, 5, 6, 7, 8, 11, 14, 15,
    16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, & 30.

-   There are 9 test volunteers with numbers: 2, 4, 9, 10, 12, 13, 18, 20, & 24.

 

**X Files:**

-   "X\_test.txt"

-   "X\_train.txt"

There are 561 variables in each file. Each variable (column) corresponds to a
number in the features.txt file.

Again the train set has 7352 observations(rows) and the test set has 2947
observations(rows).

 

**Features.txt**

This contains a list of all the calculations that are generated from the raw
data.

These variables are processed data giving information such as standard
deviation, mean, maximum, minimum, etc… for values like total body acceleration,
total body gyroscopic jerk, etc… See features\_info.txt for more information
about specific measurements.

 

**Y Files:**

-   "y\_test.txt"

-   "y\_train.txt"

 

**Activity Labels:**

The subject\_test and subject\_train files indicates the activities that each
person was engaged in. Numbers in the V1 column correspond to the activity. The
activity\_labels.txt file shows which activity corresponds with which number.
See here:

    1 WALKING

    2 WALKING\_UPSTAIRS

    3 WALKING\_DOWNSTAIRS

    4 SITTING

    5 STANDING

    6 LAYING

 

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

 



 

 
