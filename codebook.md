## Getting and Cleaning Data: Course Project

## Background
The original data resides on the UCI Machine Learning Repository under
Human Activity Recognition Using Smartphone Data Set at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
The data is multi-variate, time series and has 10229 instances with
561 attributes.  The original data was donated to the site on 12-10-2012.

Note that all of the data is unit-less.  The Subject and Activity data are
qualitative values (e.g. Subject 1, Subject 25, Walking, Sitting, etc..) while
the values themselves have been normalized by the formula (Value - Mean) / Standard
Deviation.

There were no missing values in the oroginal data set, so all values were used in
creating the final data set.

## Data Modifications
The data set was broken up into test and training files of 70% and 30%
respectively.  Additionally, the attribute names, subject identification,
and activity were in separate files.

The final data set results from the merging of the test and training data, the
pruning of attributes to only those that were Mean or Standard Deviation measurements
(indicated by mean() and std() in the original attributes.)

Additionally, the subject identification and activity data was added to the data-set as
the first two columns.  Next, the attribute names were expanded to be more descriptive
than the original attribute names.

Finally, the data was collated into groups based on the subject and activity.  The mean
for each group was then taken to collapse the data from 10229 instances to six (6)
activities for each of the thirty (30) subjects for a total of 180 instances (or rows.)

Note that the attributes gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean,
and tBodyGyroJrkMean were not used in the final data set since they averages of the
signals in a signal window sample.  Only recorded data, not calculated data, were
used to create the final data set.

## Attribute Naming Convention
The data consists of measurements of a smartphone accelerometer and gyroscope.
The researchers divided the data between the signals for the subject (body) and
gravity. The signals were then divided up into their respective X,Y, and Z
components.

Subsequently, the raw data was used to calculate linear acceleration
and angular velocity, and was labelled 'Jerk' in the original attributes.  For each
attribute the magnitude of the signals was calculated and labelled with Mag.

Finally, a Fast Fourier Transform was applied to some of the signals and labelled with an
f.  The original signals were labelled with a t.  This data set expanded the t to time
and the f to freq for easier distinction.

Also the original features contained '-' and '()', which were replaced with '.' and removed
respectively.

It was also noted that the FFT transforms of the Mag attributes has 'BodyBody'
in them.  This was shortened to just have 'Body'.

## Attribute Names and Descriptions

* Subject  				: Unique identifier of each subject (1-30)
* Activity					: The activity being performed while recording the data
* timeBodyAcc.mean.X			: Mean of Body from Accelerometer in the X direction in the time domain
* timeBodyAcc.mean.Y			: Mean of Body from Accelerometer in the Y direction in the time domain
* timeBodyAcc.mean.Z			: Mean of Body from Accelerometer in the Z direction in the time domain
* timeBodyAcc.std.X			: Standard Deviation of Body from Accelerometer in the X direction in the time domain
* timeBodyAcc.std.Y			: Standard Deviation of Body from Accelerometer in the Y direction in the time domain
* timeBodyAcc.std.Z			: Standard Deviation of Body from Accelerometer in the Z direction in the time domain
* timeGravityAcc.mean.X		: Mean of Gravity from Accelerometer in the X direction in the time domain
* timeGravityAcc.mean.Y		: Mean of Gravity from Accelerometer in the Y direction in the time domain
* timeGravityAcc.mean.Z		: Mean of Gravity from Accelerometer in the Z direction in the time domain
* timeGravityAcc.std.X		: Standard Deviation of Gravity from Accelerometer in the X direction in the time domain
* timeGravityAcc.std.Y		: Standard Deviation of Gravity from Accelerometer in the X direction in the time domain
* timeGravityAcc.std.Z		: Standard Deviation of Gravity from Accelerometer in the X direction in the time domain
* timeBodyAccJerk.mean.X		: Mean of Body Linear Acceleration from Accelerometer in the X direction in the time domain
* timeBodyAccJerk.mean.Y		: Mean of Body Linear Acceleration from Accelerometer in the Y direction in the time domain
* timeBodyAccJerk.mean.Z		: Mean of Body Linear Acceleration from Accelerometer in the Z direction in the time domain
* timeBodyAccJerk.std.X		: Standard Deviation of Body Linear Acceleration from Accelerometer in the X direction in the time domain
* timeBodyAccJerk.std.Y		: Standard Deviation of Body Linear Acceleration from Accelerometer in the Y direction in the time domain
* timeBodyAccJerk.std.Z		: Standard Deviation of Body Linear Acceleration from Accelerometer in the Z direction in the time domain
* timeBodyGyro.mean.X		: Mean of Body from Gyroscope in the X direction in the time domain
* timeBodyGyro.mean.Y		: Mean of Body from Gyroscope in the Y direction in the time domain
* timeBodyGyro.mean.Z		: Mean of Body from Gyroscope in the Z direction in the time domain
* timeBodyGyro.std.X			: Standard Deviation of Body from Gyroscope in the X direction in the time domain
* timeBodyGyro.std.Y			: Standard Deviation of Body from Gyroscope in the Y direction in the time domain
* timeBodyGyro.std.Z			: Standard Deviation of Body from Gyroscope in the Z direction in the time domain
* timeBodyGyroJerk.mean.X	: Mean of Body Angular Velocity from Gyroscope in the X direction in the time domain
* timeBodyGyroJerk.mean.Y	: Mean of Body Angular Velocity from Gyroscope in the Y direction in the time domain
* timeBodyGyroJerk.mean.Z	: Mean of Body Angular Velocity from Gyroscope in the Z direction in the time domain
* timeBodyGyroJerk.std.X		: Standard Deviation of Body Angular Velocity from Gyroscope in the X direction in the time domain
* timeBodyGyroJerk.std.Y		: Standard Deviation of Body Angular Velocity from Gyroscope in the Y direction in the time domain
* timeBodyGyroJerk.std.Z		: Standard Deviation of Body Angular Velocity from Gyroscope in the Z direction in the time domain
* timeBodyAccMag.mean        : Mean of Magnitude of Body from Accelerometer in the time domain
* timeBodyAccMag.std			: Standard Deviation of Magnitude of Body from Accelerometer in the time domain
* timeGravityAccMag.mean		: Mean of Magnitude of Gravity from Accelerometer in the time domain
* timeGravityAccMag.std		: Standard Deviation of Magnitude of Gravity from Accelerometer in the time domain
* timeBodyAccJerkMag.mean	: Mean of Magnitude of Body Linear Acceleration from Accelerometer in the time domain
* timeBodyAccJerkMag.std		: Standard Deviation of Magnitude of Body Linear Acceleration from Accelerometer in the time domain
* timeBodyGyroMag.mean       : Mean of Magnitude of Body from Gyroscope in the time domain
* timeBodyGyroMag.std		: Standard Deviation of Magnitude of Body from Gyroscope in the time domain
* timeBodyGyroJerkMag.mean	: Mean of Magnitude of Body Angular Velocity from Gyroscope in the time domain
* timeBodyGyroJerkMag.std	: Standard Deviation of Magnitude of Body Angular Velocity from Gyroscope in the time domain
* freqBodyAcc.mean.X			: Mean of Body from Accelerometer in the X direction in the frequency domain
* freqBodyAcc.mean.Y			: Mean of Body from Accelerometer in the Y direction in the frequency domain
* freqBodyAcc.mean.Z			: Mean of Body from Accelerometer in the Z direction in the frequency domain
* freqBodyAcc.std.X			: Standard Deviation of Body from Accelerometer in the X direction in the frequency domain
* freqBodyAcc.std.Y			: Standard Deviation of Body from Accelerometer in the Y direction in the frequency domain
* freqBodyAcc.std.Z			: Standard Deviation of Body from Accelerometer in the Z direction in the frequency domain
* freqBodyAccJerk.mean.X		: Mean of Body Linear Acceleration from Accelerometer in the X direction in the frequency domain
* freqBodyAccJerk.mean.Y		: Mean of Body Linear Acceleration from Accelerometer in the Y direction in the frequency domain
* freqBodyAccJerk.mean.Z		: Mean of Body Linear Acceleration from Accelerometer in the Z direction in the frequency domain
* freqBodyAccJerk.std.X		: Standard Deviation of Body Linear Acceleration from Accelerometer in the X direction in the frequency domain
* freqBodyAccJerk.std.Y		: Standard Deviation of Body Linear Acceleration from Accelerometer in the Y direction in the frequency domain
* freqBodyAccJerk.std.Z		: Standard Deviation of Body Linear Acceleration from Accelerometer in the Z direction in the frequency domain
* freqBodyGyro.mean.X		: Mean of Body from Gyroscope in the X direction in the frequency domain
* freqBodyGyro.mean.Y		: Mean of Body from Gyroscope in the Y direction in the frequency domain
* freqBodyGyro.mean.Z		: Mean of Body from Gyroscope in the Z direction in the frequency domain
* freqBodyGyro.std.X			: Standard Deviation of Body from Gyroscope in the X direction in the frequency domain
* freqBodyGyro.std.Y			: Standard Deviation of Body from Gyroscope in the Y direction in the frequency domain
* freqBodyGyro.std.Z			: Standard Deviation of Body from Gyroscope in the Z direction in the frequency domain
* freqBodyAccMag.mean        : Mean of Magnitude of Body from Accelerometer in the frequency domain
* freqBodyAccMag.std			: Standard Deviation of Magnitude of Body from Accelerometer in the frequency domain
* freqBodyAccJerkMag.mean	: Mean of Magnitude of Body Linear Acceleration from Accelerometer in the frequency domain
* freqBodyAccJerkMag.std		: Standard Deviation of Magnitude of Body Linear Acceleration from Accelerometer in the frequency domain
* freqBodyGyroMag.mean       : Mean of Magnitude of Body from Gyroscope in the frequency domain
* freqBodyGyroMag.std 		: Standard Deviation of Magnitude of Body from Gyroscope in the frequency domain
* freqBodyGyroJerkMag.mean	: Mean of Magnitude of Body Angular Velocity from Gyroscope in the frequency domain
* freqBodyGyroJerkMag.std	: Standard Deviation of Magnitude of Body Angular Velocity from Gyroscope in the time domain

