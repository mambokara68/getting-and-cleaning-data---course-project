#my code book


##Which features were selected ?
I choose to select all the features with mean and std written in the name except 
angle(tBodyAccMean,gravity) angle(tBodyAccJerkMean),gravityMean) angle(tBodyGyroMean,gravityMean) angle(tBodyGyroJerkMean,gravityMean) angle(X,gravityMean) angle(Y,gravityMean) angle(Z,gravityMean which are angle measurement without mean calculation. But I extracted « meanFreq » column  features which are average values.

##Different data and values obtained during execution of  the script
|name|class|size|dim|description|
|----------------|----------------|--------------|-----------------|---------------|
|X_test|data frame|	12.7Mb| 2947 obs of 561 variables|  obtained from : ("X_test.txt") different  measurements for each subject in the test group|
|X_train| data frame|	31.5Mb| 7352 obs of 561 variables | obtained from : ("X_train.txt") different  measurements for each subject in the training group|
|Y_test|data frame|	12.2kb| 2947 obs of 1 variable|  obtained from : ("y_test.txt") list of activities numbers in the test group, same rownumber as X_test|
|Y_train| data frame|	29.4kb| 7352 obs of 1 variable|  obtained from : ("y_train.txt") list of activities numbers in the training group, same rownumber as X_train|
|subj_test| data frame|	 12.2kb| 2947 obs of 1 variable|  obtained from : ("subject_test.txt") list of subject’s  numbers in the test group, same rownumber as X_test|
|subj_train| data frame|29.4kb| 7352 obs of 1 variable|  obtained from : ("subject_train.txt") list of subject’s numbers in the training group, same rownumber as X_train|
|features| data frame|42.9kb| 561 obs of 2 variables|  obtained from : ("features.txt") number and names of the different features measured, corresponds to the columns of X_ test and train|
|completedataset| data frame|44.1 Mb| 10299 obs of 561 variables|  obtained with rbind(X_test,X_train) |
|allcolumnnames| character vector|38.1 kb| 561 values| names of the differents features obtained from  features[,2]) |
|Meancolnumber| integer vector|224b| : 46 values| range( rang en francais) of the names  containing the « mean » character string|
|stdcolnumber| integer vector|176b | 33 values| range( rang en francais) of the names  containing the « std » character string |
|tobextractedcolnumbers| integer vector|360b | 46+33=79 values| sorted column numbers to be extracted from the complete data set to obtain the desired values. |
|meanstddataset| data frame|6.3Mb| 10299 obs. of 81 variables| data from the « mean » and « std » columns. |
|Meancolumnnames| character vector|6.2kb| 79 names| names of the features corresponding to the column names. |
|colonnes1_2| data frame|121.7kb| 10299 obs of 2 variables| (subject number and activities names for both test and training data. |
|tidycolname |  character vector|6.1kb| 79 values| same as meancolumnnames but tidy names proposed (t->time, f->freq,elimination of – and (), BodyBody->Body) |
|sorteddata| data frame|6.4 Mb|  10299 obs of 81 variables| same values as meanstddataset  but ordered by activity and by subject. |
|melteddata| data frame |18.6Mb| 813621 obs of 4 variables| rearrange the values in 4 raws insteed of 81, allows calculation of means via the acast function |
|tidyfile| array and after transformation a data frame|288kb| 14220 obs of 4 variables| contains the values obtained after averaging the measurements by activity and by subject|
|finaltidyfile| data frame|125.8kb| 180 obs of 81 variables| final data set with row names and column names. |
