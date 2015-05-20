# url for more information http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###
# Download and unzip data
###

library(plyr)

if(!file.exists("./data")){dir.create("./data")}

url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./data/UCIDataset.zip")
unzip("./data/UCIDataset.zip", exdir="./data/")

###
# Read Files Into Global Environment
###

## My handy dandy function which will import all txt files in a directory and save 
#them to a variable in the global environment. The filename that is used must include the full name
# showing the directory. 
# E.G. filenames1 <- list.files("./data/UCI HAR Dataset/test", pattern="*.txt", full.names=TRUE)

import_files_function <- function(ListOfFilesWithFullNames){
        ldf <- lapply(ListOfFilesWithFullNames, read.table)
        
        cleanedfilenames <- vector()
        for (i in 1:length(ListOfFilesWithFullNames)){
                splitfilename <- strsplit(as.character(ListOfFilesWithFullNames[i]), "/")[[1]]
                cleanedfilenames[i] <- splitfilename[length(splitfilename)]        
        }
        assign(paste(strsplit(ListOfFilesWithFullNames, "/")[[1]][4],"_files", sep=""), cleanedfilenames)
        for (i in 1:length(ldf)){
                assign(paste(cleanedfilenames[i]), ldf[[i]], envir = .GlobalEnv)
        }   
}

filenames1 <- list.files("./data/UCI HAR Dataset/test", pattern="*.txt", full.names=TRUE)
filenames2 <- list.files("./data/UCI HAR Dataset/train", pattern="*.txt", full.names=TRUE)

import_files_function(filenames1)
import_files_function(filenames2)

Activity_Labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")

remove("filenames1", "filenames2")



# Add a column "TestOrTrain" to each subject 
# file indicating whether the subjects are training or testing.
subject_test.txt$TestOrTrain <- "test"
subject_train.txt$TestOrTrain <- "train"

# rename the files V1 column to "Subject" 
subject_test.txt <- rename(subject_test.txt, c("V1"="Subject")) 
subject_train.txt <- rename(subject_train.txt, c("V1"="Subject")) 

#cbind the y_test and y_train variables to the subject files
subject_test.txt <- cbind(subject_test.txt, y_test.txt)
subject_train.txt <- cbind(subject_train.txt, y_train.txt)

#Rename the V1 columns to activity
subject_test.txt <- rename(subject_test.txt, c("V1"="Activity")) 
subject_train.txt <- rename(subject_train.txt, c("V1"="Activity")) 

#Rename the colums in the X_test and X_train files to match the features names
colnames(X_test.txt) <- features$V2
colnames(X_train.txt) <- features$V2


# Cbind the subject_test data.frame to the X_test
# Cbind the subject_train to the X_train 
# creates two files: Test_data and Train_data

Test_data <- cbind(subject_test.txt, X_test.txt)
Train_data <- cbind(subject_train.txt, X_train.txt)

# rbind the test and train data.frames together into one tidy data data.frame.
Tidy_Data <- rbind(Test_data, Train_data)

# replace Activity numbers with activity labels

Tidy_Data$Activity[Tidy_Data$Activity==1] <- as.character(Activity_Labels$V2[1])
Tidy_Data$Activity[Tidy_Data$Activity==2] <- as.character(Activity_Labels$V2[2])
Tidy_Data$Activity[Tidy_Data$Activity==3] <- as.character(Activity_Labels$V2[3])
Tidy_Data$Activity[Tidy_Data$Activity==4] <- as.character(Activity_Labels$V2[4])
Tidy_Data$Activity[Tidy_Data$Activity==5] <- as.character(Activity_Labels$V2[5])
Tidy_Data$Activity[Tidy_Data$Activity==6] <- as.character(Activity_Labels$V2[6])


names(Tidy_Data[grep("mean", names(Tidy_Data))])
names(Tidy_Data[grep("std", names(Tidy_Data))])

