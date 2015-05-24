#**DATA DICTIONARY**
##(Summary Data of Body Movement Study using a Galaxy Phone) 
##Based on sensor signals of accelerometer and gyroscope)
***PROCESS**
This data was produced in a sequence of steps.  The original data was split into 
2 sets (train and test). Each of the sets has 3 files subject, X and Y.  These files
recorded multiple measurements and some of these measurements were mean and standard 
deviations.  In addition, two separate files provided mapping between activity id and 
label and feature names

Process involved multiple steps starting with loading and combining both train and 
test sets together (using rbind).  Then applying labels and merging the activity names.  
Also, since we are interested only mean and standard deviation columns, a separate 
data frame was created with the identifying information and mean and standard deviation 
measurements.

Finally a tidy Summary data frame was created with the means of the mean and 
standard deviations for each activity and subject. 
 

