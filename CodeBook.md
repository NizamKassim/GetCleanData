---
# Data Science Specialization
## Getting and Cleaning Data
### Course Project
---
# Data Science Specialization
## Getting and Cleaning Data

### Dataset Overview


Human Activity Recognition Using Smartphones Dataset
Version 1.0


Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Universit�  degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Polit�cnica de Catalunya (BarcelonaTech). Vilanova i la Geltr� (08800), Spain
activityrecognition '@' smartlab.ws 


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


### Dataset Files

File Names            | Description
----------------------|-----------------------------------------------------------------
'README.txt'          | Read me file
'features_info.txt'   | Shows information about the variables used on the feature vector.
'features.txt'        | List of all features.
'activity_labels.txt' | Links the class labels with their activity name.
'train/X_train.txt'   | Training set.
'train/y_train.txt'   | Training labels.
'test/X_test.txt'     | Test set.
'test/y_test.txt'     | Test labels.


### Train/Test Data Files and Descriptions

File Name                                         | Description
--------------------------------------------------|------------------------------------------------------------------------------------------------------------
'train/subject_train.txt'                         | Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
'train/Inertial Signals/total_acc_x_train.txt'    | The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
'train/Inertial Signals/body_acc_x_train.txt'     |The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
'train/Inertial Signals/body_gyro_x_train.txt'    | The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


### Variable Lists and Descriptions

Variable name    | Description
-----------------|---------------------------------------------------------------------------------------------
subject          | ID the subject who performed the activity for each window sample. Its range is from 1 to 30.
activity	       | Activity name
featDomain	     | Feature: Time domain signal or frequency domain signal (Time or Freq)
featInstrument	 |Feature: Measuring instrument (Accelerometer or Gyroscope)
featAcceleration |	Feature: Acceleration signal (Body or Gravity)
featVariable	   | Feature: Variable (Mean or SD)
featJerk	       | Feature: Jerk signal
featMagnitude	   | Feature: Magnitude of the signals calculated using the Euclidean norm
featAxis	       | Feature: 3-axial signals in the X, Y and Z directions (X, Y, or Z)
featCount	       | Feature: Count of data points used to compute average
featAverage	     | Feature: Average of each variable for each activity and each subject

### Appropriately Labels The Dataset with Descriptive Variable Names.
1. leading t or f is based on time or frequency measurements.
2. Body = related to body movement.
3. Gravity = acceleration of gravity
4. Acc = accelerometer measurement
5. Gyro = gyroscopic measurements
6. Jerk = sudden movement acceleration
7. Mag = magnitude of movement
8. mean and SD are calculated for each subject for each activity for each mean and SD measurements. The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

### Summary
1. The tidy data set a set of variables for each activity and each subject. 
  - 10299 instances are split into 180 groups (30 subjects and 6 activities) 
  - 66 mean and standard deviation features are averaged for each group. 
2. The resulting data table has 180 rows and 69 columns – 33 Mean variables + 33 Standard deviation variables + 1 Subject( 1 of of the 30 test subjects) + ActivityName + ActivityNum . 
3. The tidy data set’s first row is the header containing the names for each column.
