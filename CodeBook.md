#  CODEBOOK for the course project Getting and Cleaning Data
##  Data Origin
The data was obtain from
Bache, K. & Lichman, M. (2013). UCI Machine Learning Repository
[http://archive.ics.uci.edu/ml].
Irvine, CA: University of California, School of Information and Computer Science
##  Data Description

The information obtain is in a Directory named UCI HAR Dataset. 
That contains:

    Two subdirectories Test and Train and the following text files:
    activity_labels.txt    6 records
         id                    numerical
         Activity              Character
    features.txt           561 records
         id                    numerical
         name of measurements  Character
         A description of the variables can be found in the file feature_info.txt
    README.txt
         A description of the information obtain by the 
         project: Human Activity Recognition Using Smartphones
         
    Subdirectory Train contains
          subject_train.txt   7352 records
          id of the volunteer numerical
          
          X_train.txt         7352 records
          561 different measurements numerical
          
          y_train.txt         7352 records
          id of the type of activity numerical
          
    Subdirectory Test contains
          subject_test.txt   2947 records
          id of the volunteer numerical
          
          X_test.txt         2947 records
          561 different measurements numerical
          
          y_test.txt         2947 records
          id of the type of activity numerical      
      Both subdirectories contain another subdirectory named Inertial Signals.
      The data in this subdirectory was not included in this project.
         
##  Process to clean the data
    1.- Form a data frame with the information in the test subdirectory using:
        1.1.- Data in file features.txt for the variable names of the data in X_test.txt
        1.2.- Data in file y_test.txt for the activity_id
        1.3.- Data in file subject_test.txt for the subject_id
    2.- Form a data frame with the information in the train subdirectory using:
        2.1.- Data in file features.txt for the variable names of the data in X_train.txt
        2.2.- Data in file y_train.txt for the activity_id
        2.3.- Data in file subject_train.txt for the subject_id
    3.- Combine the data frames from steps 1 and 2 into a single dataframe.
        Write the dataframe in directory UCI HAR Dataset with the name TestTrain.txt
    4.- Obtain the columns that contain measurements for mean and standard deviation.
        All the columns that show a mean are included.
    5.- Modify the name of the columns to obtain more readibility
    6.- Change the Activity_id from number to a more descriptive label.
    7.- Obtain a second dataframe with the average of the variables for each subject and activity
        6.1 Melt the dataframe using as identifier Subject and Activity
        6.2 Cast the dataframe using Subject and Activity and obtaining the mean for each variable
        6.3 Write the dataframe in directory UCI HAR Dataset with the name tidy.txt
