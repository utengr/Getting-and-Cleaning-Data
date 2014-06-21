# read in all the seperate tables that contain data
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, stringsAsFactors = FALSE)
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, stringsAsFactors = FALSE)
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE)
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, stringsAsFactors = FALSE)
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, stringsAsFactors = FALSE)
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE)
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, stringsAsFactors = FALSE)

# take the second column of the features data.frame and pull out the row index for
# all names that contain either mean() or std()
keep_col <- grep("mean\\(\\)|std\\(\\)", features[,2])

# combine test and training versions of each data.frame into 3 main data.frames
# x is the data.table containing the measurements
# subject is a vector identifying the person for each row of data in x
# y is the vector identifying the activity performed for each row of data in x 
x <- rbind(xTrain,xTest)
subject <- rbind(subjectTrain, subjectTest)
y <- rbind(yTrain, yTest)

# rename the features of the data by removing (), -, and expanding t into time
# and f into freq
features[,2] <- gsub("tB","timeB", features[,2])
features[,2] <- gsub("tG","timeG", features[,2])
features[,2] <- gsub("fB", "freqB", features[,2])
features[,2] <- gsub("BodyBody", "Body", features[,2]) # remove extra 'Body' in variable name
features[,2] <- gsub("-", ".", features[,2])
features[,2] <- gsub("\\(\\)","", features[,2])

# update the x dataframe column names to the renamed features
colnames(x) <- features[,2]

# subset the x data.frame into only the columns that are mean() or std() data
subdf <- x[,keep_col]

# create an empty vector to contain the named activity for each row in the subdf data.frame 
featureActivity <- as.character(vector())

# loop over the values in the y vector, and put the equivalent named activity in the
# newly created featureActivity vector
for(i in 1:nrow(y)) {featureActivity[i] <- activities[y[i,],2]}

# combine the subject and featureActivity vectors columnwise to the subsetted subdf data.frame 
tidydf <- cbind(subject, featureActivity, subdf)

# use the aggregate function to take the mean of each column for every activity of each subject 
sortedtidydf <- aggregate(tidydf, list(Subject = tidydf$V1, Activity = tidydf$featureActivity), mean)

# remove the redundant columns from the final data.frame
sortedtidydf <- sortedtidydf[,-c(3,4)]

# write the data.frame to a .csv file called tidyDataSet
write.csv(sortedtidydf,"tidyDataSet.csv")
