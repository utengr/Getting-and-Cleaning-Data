## Getting and Cleaning Data: Course Project

In order to use this script, the files from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
must be downloaded and unzipped into your working directory.  The script will pull the files from the UCI HAE Dataset folder
automatically as long as it is in your woking directory.

## Read in all the seperate tables that contain data
The following code reads in all the data files from the training and testing folders.
The names of the resulting data.frames were kept the same as the csv files to avoid 
confusion.

```
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, stringsAsFactors = FALSE)
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, stringsAsFactors = FALSE)
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE)
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, stringsAsFactors = FALSE)
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, stringsAsFactors = FALSE)
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE)
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, stringsAsFactors = FALSE)
```


##  Locate the relevant columns
Create a vector, keep_col, that contains the column numbers of features with mean() or std() in their name.
This index will be used to subset the original data set into only the 66 columns of data that we want. The script
does not pull out attribute names with Mean in them since those values were calculated values, not recorded
values.

```
keep_col <- grep("mean\\(\\)|std\\(\\)", features[,2])
```

## Merging the data sets
Combine test and training versions of each data.frame into 3 main data.frames using rbind to preserve the
order of the rows.  The resulting data.frames are:
* x : the data.frame containing the measurements
* subject :  a vector identifying the person for each row of data in x
* y :  the vector identifying the activity performed for each row of data in x 

```
x <- rbind(xTrain,xTest)
subject <- rbind(subjectTrain, subjectTest)
y <- rbind(yTrain, yTest)
```

# Simplify and expand the Attribute Names
The original researchers used abbreviations and other symbols in the attribute names.  They also
created attributes in the time and frequency domains using Fast Fourier Transforms.
Using gsub, replace 'tB' and 'tG' with with time and 'fB' with freq.  Also replace the '-' with
'.' and remove () from the attribute names.  Finally, shorten the attributes with 'BodyBody' to only 'Body'.

```
features[,2] <- gsub("tB","timeB", features[,2])
features[,2] <- gsub("tG","timeG", features[,2])
features[,2] <- gsub("fB", "freqB", features[,2])
features[,2] <- gsub("BodyBody", "Body", features[,2]) # remove extra 'Body' in variable name
features[,2] <- gsub("-", ".", features[,2])
features[,2] <- gsub("\\(\\)","", features[,2])
```

# Name the columns in the x data.frame
Add the renamed attributes to the data (x data.frame) using the colnames() function
```
colnames(x) <- features[,2]
```

# Use only Mean and Standard Deviation Values
Subset the x data.frame into only the columns that have mean() or std() using the keep_col
vector we created earlier to house the row column locations containing mean() and std().
```
subdf <- x[,keep_col]
```

# Convert the activity values to descriptive qualitative values
Create an empty vector, featureActivity, to be used to contain the named activity for
each row in the subdf data.frame
```
featureActivity <- as.character(vector())
```

Loop over the values in the y (activity) vector, and put the equivalent named activity in the
newly created featureActivity vector. (Could have used a vectorized function, but I
have a fondness for techniques that resemble vlookup in MS Excel.  Plus it is a short
one liner as far as for...loops go.) Since the value in the y vector is the corresponding
row in the activities vector, just take the value as the row and put the value in the second
column of activities in the featureActivity vector, which is the character name of the activity.
```
for(i in 1:nrow(y)) {featureActivity[i] <- activities[y[i,],2]}
```

# Create the main data.frame 
Combine the subject and featureActivity vectors columnwise with the subsetted subdf data.frame
using cbind and call it tidydf
```
tidydf <- cbind(subject, featureActivity, subdf)
```

# Simplify the data.frame
Use the aggregate() function to take the mean of each column for every activity of each subject
```
sortedtidydf <- aggregate(tidydf, list(Subject = tidydf$V1, Activity = tidydf$featureActivity), mean)
```

# Clean up the data.frame
Remove the redundant columns from the final data.frame
```
sortedtidydf <- sortedtidydf[,-c(3,4)]
```

# Write the data.frame to a .csv file called tidyDataSet
```
write.csv(sortedtidydf,"tidyDataSet.csv")
```
