#**TidyDataProject**
##(Summary Data of Body Movement Study using a Galaxy Phone) 
##Based on sensor signals of accelerometer and gyroscope)

##Script Name: 
###  run_analysis.R
###      This is the main and only script that produces the tidySummary output
###  Outline
####    Merges 2 data sets (train and test) and produces a tidy summary data set
####    Resultant tidy data set may not look that clean in text editors like notepad.
####    Best Way to view this data set is using the following commands in R/R-Studio
#####       tidyDF <- read.table("tidySummary.txt", header = TRUE); 
#####       View(tidyDF)

## Code Book is available in this repository with name CodeBook.md

**Following are the steps involved in the process**

- assume that this run_analysis.R script is in the same directory as the
- working directory: "~/GitHub/r-gacd/UCI HAR Dataset"

- load required packages (dplyr); assume that they were already installed

- read activity label, feature, train and test data sets from files in the current working directory 

- combine test/train data sets

- merge activity labels into Y_combined

- apply feature names to the X_combined data

- create a new data frame of only features that have mean or std in them (find the list using grep)
- since no specific detail was provided, include any column that has mean or std in it including FreqMean() also    

- now merge the data frame with the select columns (combined with the mean and std) with that of Y and subject

- rename column names to more expansive/meaningful

- Create a new tidy summary data set of means of all the measures by activity and subject

- since we don't need activityid (replaced by activityname), let us drop the activityid in the result/tidy set

- Generate tidySummary output file in the current working directory (tidySummary.txt)

  - Use default separator and header creation. 
  - Also, let it be created in the current working directory

