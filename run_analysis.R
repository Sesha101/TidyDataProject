##run_analysis.R
    ##  Author: Sesha
    ##  Date: 22nd May, 2015
    ## Outline
    ##  merges 2 data sets (train and test) and produces a tidy summary data set

# assume that this run_analysis.R script is in the same directory as the
# working directory: "~/GitHub/r-gacd/UCI HAR Dataset"

# load required packages; assume that they were already installed
    library(dplyr);
# read label/feature data 
    activity_labels <- read.table("./activity_labels.txt");
    features <- read.table("./features.txt");

# read training data set 
    subject_train <- read.table("./train/subject_train.txt");
    X_train <- read.table("./train/X_train.txt");
    Y_train <- read.table("./train/Y_train.txt");

# read test data set 
    subject_test <- read.table("./test/subject_test.txt");
    X_test <- read.table("./test/X_test.txt");
    Y_test <- read.table("./test/Y_test.txt");

# combine test/train data sets
    subject_combined <- rbind(subject_train,subject_test);
    X_combined <- rbind(X_train,X_test);
    Y_combined <- rbind(Y_train,Y_test);

# merge activity labels into Y_combined
    Y_combined <- merge(Y_combined,activity_labels,by="V1")    

# apply feature names to the X_combined data
    colnames(X_combined)<-features$V2;

# create a new data frameof only features that have mean or std in them
# since no specific detail was provided, include any column that has mean or std in it including FreqMean() also    
    X_meanstd<-X_combined[,grep ("mean|std",features$V2)];

# now merge the meanstd with that of Y and subject
    X_meanstd<-cbind(subject_combined,Y_combined,X_meanstd)

# rename column names to more expansive/meaniful
    newColNames <- c("subjectid" , "activityid" , "activityname" ,
                     "bodyAcceleratorTimeMean-X-Axis" , "bodyAcceleratorTimeMean-Y-Axis" ,  "bodyAcceleratorTimeMean-Z-Axis" ,       
                     "bodyAcceleratorTimeStd-X-Axis"  , "bodyAcceleratorTimeStd-Y-Axis"  ,  "bodyAcceleratorTimeStd-Z-Axis"  ,              
                     "gravityAcceleratorTimeMean-X-Axis" , "gravityAcceleratorTimeMean-Y-Axis" ,"gravityAcceleratorTimeMean-Z-Axis",          
                     "gravityAcceleratorTimeStd-X-Axis" , "gravityAcceleratorTimeStd-Y-Axis" ,"gravityAcceleratorTimeStd-Z-Axis",          
                     "bodyAcceleratorJerkTimeMean-X-Axis"  , "bodyAcceleratorJerkTimeMean-Y-Axis"  ,  "bodyAcceleratorJerkTimeMean-Z-Axis"  ,              
                     "bodyAcceleratorJerkTimeStd-X-Axis"  , "bodyAcceleratorJerkTimeStd-Y-Axis"  ,  "bodyAcceleratorJerkTimeStd-Z-Axis"  ,              
                     "bodyGyroscopeTimeMean-X-Axis"  , "bodyGyroscopeTimeMean-Y-Axis"  ,  "bodyGyroscopeTimeMean-Z-Axis"  ,              
                     "bodyGyroscopeTimeStd-X-Axis"  , "bodyGyroscopeTimeStd-Y-Axis"  ,  "bodyGyroscopeTimeStd-Z-Axis"  ,              
                     "bodyGyroscopeJerkTimeMean-X-Axis"  , "bodyGyroscopeJerkTimeMean-Y-Axis"  ,  "bodyGyroscopeJerkTimeMean-Z-Axis"  ,              
                     "bodyGyroscopeJerkTimeStd-X-Axis"  , "bodyGyroscopeJerkTimeStd-Y-Axis"  ,  "bodyGyroscopeJerkTimeStd-Z-Axis"  ,              
                     "bodyAcceleratorMagnitudeTimeMean" , "bodyAcceleratorMagnitudeTimeStd" ,           
                     "gravityAcceleratorMagnitudeTimeMean" , "gravityAcceleratorMagnitudeTimeStd" ,           
                     "bodyAcceleratorJerkMagnitudeTimeMean" , "bodyAcceleratorJerkMagnitudeTimeStd" ,           
                     "bodyGyroscopeMagnitudeTimeMean" , "bodyGyroscopeMagnitudeTimeStd" ,           
                     "bodyGyroscopeJerkMagnitudeTimeMean" , "bodyGyroscopeJerkMagnitudeTimeStd" ,           
                     "bodyAcceleratorFourierMean-X-Axis" , "bodyAcceleratorFourierMean-Y-Axis" ,  "bodyAcceleratorFourierMean-Z-Axis" ,       
                     "bodyAcceleratorFourierStd-X-Axis" , "bodyAcceleratorFourierStd-Y-Axis" ,  "bodyAcceleratorFourierStd-Z-Axis" ,       
                     "bodyAcceleratorFourierMeanFreq-X-Axis" , "bodyAcceleratorFourierMeanFreq-Y-Axis" ,  "bodyAcceleratorFourierMeanFreq-Z-Axis" ,       
                     "bodyAcceleratorJerkFourierMean-X-Axis" , "bodyAcceleratorJerkFourierMean-Y-Axis" ,  "bodyAcceleratorJerkFourierMean-Z-Axis" ,       
                     "bodyAcceleratorJerkFourierStd-X-Axis" , "bodyAcceleratorJerkFourierStd-Y-Axis" ,  "bodyAcceleratorJerkFourierStd-Z-Axis" ,       
                     "bodyAcceleratorJerkFourierMeanFreq-X-Axis" , "bodyAcceleratorJerkFourierMeanFreq-Y-Axis" ,  "bodyAcceleratorJerkFourierMeanFreq-Z-Axis" ,       
                     "bodyGyroscopeFourierMean-X-Axis" , "bodyGyroscopeFourierMean-Y-Axis" ,  "bodyGyroscopeFourierMean-Z-Axis" ,       
                     "bodyGyroscopeFourierStd-X-Axis" , "bodyGyroscopeFourierStd-Y-Axis" ,  "bodyGyroscopeFourierStd-Z-Axis" ,       
                     "bodyGyroscopeFourierMeanFreq-X-Axis" , "bodyGyroscopeFourierMeanFreq-Y-Axis" ,  "bodyGyroscopeFourierMeanFreq-Z-Axis" ,       
                     "bodyAcceleratorMagnitudeFourierMean" , "bodyAcceleratorMagnitudeFourierStd" ,           
                     "bodyAcceleratorMagnitudeFourierMeanFreq"  ,           
                     "bodyAcceleratorJerkMagnitudeFourierMean"  ,     "bodyAcceleratorJerkMagnitudeFourierStd"  ,                  
                     "bodyAcceleratorJerkMagnitudeFourierMeanFreq"  ,           
                     "bodyBodyGyroscopeMagnitudeFourierMean"  ,     "bodyBodyGyroscopeMagnitudeFourierStd"  ,                  
                     "bodyBodyGyroscopeMagnitudeFourierMeanFreq"  ,           
                     "bodyBodyGyroscopeJerkMagnitudeFourierMean"  ,     "bodyBodyGyroscopeJerkMagnitudeFourierStd"  ,                  
                     "bodyBodyGyroscopeJerkMagnitudeFourierMeanFreq" );
    colnames(X_meanstd) <- newColNames;

# Create a new tidy summary data set of means of all the measures by activity and subject
    tidySum<-summarise_each(group_by(X_meanstd,activityname,subjectid),funs(mean));

# since we don't need activityid (replaced by activityname), let us drop the activityid in the result/tidy set
    tidySum$activityid <- NULL;

# Generate tidySummary output file in the current working directory
# Use default separator and header creation. 
# Also, let it be created in the current working directory
    write.table(tidySum,file="tidySummary.txt",row.names=FALSE);
# end of script    