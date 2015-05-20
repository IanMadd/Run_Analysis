# url for more information http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

library (data.table); library(plyr)

if(!file.exists("./data")){dir.create("./data")}

url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./data/UCIDataset.zip")
unzip("./data/UCIDataset.zip", exdir="./data/")

###
# import test files
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
filenames3 <- list.files("./data/UCI HAR Dataset/test/Inertial Signals", pattern="*.txt", full.names=TRUE)
filenames4 <- list.files("./data/UCI HAR Dataset/train/Inertial Signals", pattern="*.txt", full.names=TRUE)

import_files_function(filenames1)
import_files_function(filenames2)
import_files_function(filenames3)
import_files_function(filenames4)

remove("filenames1", "filenames2", "filenames3", "filenames4")


remove(all_files)
all_files <- ls()
View(get(all_files[1]))
