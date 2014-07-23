
#1-1.  Merges the training and the test sets to create one data set.
 
#Read and load all the necessary files. 
#Caution : files must be in the working directory, test and train files ARE NOT in test and train directory
X_test<-read.table("X_test.txt")
X_train<-read.table("X_train.txt")
Y_test<-read.table("y_test.txt")
Y_train<-read.table("y_train.txt")
subj_test<-read.table("subject_test.txt")
subj_train<-read.table("subject_train.txt")
features<-read.table("features.txt")

#obtain the complete data set combining test and train results (rbind)
completedataset<-rbind(X_test,X_train)


#2-Extracts only the measurements on the mean and standard deviation for each measurement.

allcolumnnames<-as.character(features[,2]) #extracting the features names in the second column of features. Class of features[,2] is "factor" must be "character" in order to extract mean and std features

meancolnumber<-grep("mean",allcolumnnames)#find the column numbers of the columns to be extracted for the "mean" values
stdcolnumber<-grep("std()",allcolumnnames)#find the column numbers of the column to be extracted for the "std" values
tobeextractedcolnumber<-sort(c(meancolnumber,stdcolnumber))#column numbers to be extracted put together and sorted
meanstddataset<-completedataset[,c(tobeextractedcolnumber)]#extraction of the "mean" and "std" columns to obtain the first data set we need (before mean calculation and cleaning)
meancolumnnames<-allcolumnnames[c(tobeextractedcolnumber)]#extraction of the "mean" and "std" columns names to be used after cleaning as column names of the data set (see line 45)

#3-Uses descriptive activity names to name the activities in the data set

#Prepare the first two columns of the dataset for the test and train (rbind) subjects and activities (cbind)
colonnes1_2<-rbind(cbind(subj_test,Y_test),cbind(subj_train,Y_train))

#according to the activity_labels, transform numbers in "descriptive activity names"
colonnes1_2[,2]<-as.numeric(colonnes1_2[,2])
colonnes1_2[,2][colonnes1_2[,2]==1]<-"walking"
colonnes1_2[,2][colonnes1_2[,2]==2]<-"walking upstairs"
colonnes1_2[,2][colonnes1_2[,2]==3]<-"walking downstairs"
colonnes1_2[,2][colonnes1_2[,2]==4]<-"sitting"
colonnes1_2[,2][colonnes1_2[,2]==5]<-"standing"
colonnes1_2[,2][colonnes1_2[,2]==6]<-"lying"

#4-Appropriately labels the data set with descriptive variable names.
#create a new column names vector with appropriate variable names
 
tidycolname<-gsub("tBody","timeBody",meancolumnnames)#from line 26
tidycolname<-gsub("fBody","freqBody",tidycolname)
tidycolname<-gsub("tGravity","timeGravity",tidycolname)
tidycolname<-gsub("BodyBody","Body",tidycolname)
tidycolname<-gsub("[[:punct:]]","",tidycolname)


#5-  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

meanstddataset<-cbind(colonnes1_2,meanstddataset )#Add the two first column to the dataset
colnames(meanstddataset)<-c("subject","activity",meancolumnnames)#Create the complete data set, adding column names


# calculation of the mean of each variable for each activity and each subject
library(reshape2)
library(arrayhelpers)

sorteddata<-meanstddataset[order(meanstddataset$activity,meanstddataset$subject),]#sorts the data set first by activity and after by subject

melteddata<-melt(sorteddata,id=c("activity","subject"),measure.vars=meancolumnnames)#melt the data to permit calculation of means via the acast function
tidyfile<-acast(melteddata,subject~activity~variable,mean)#obtention of an array : 30(subjects)x6(activity)x79(mean measurement)  
tidyfile<-array2df(tidyfile,label.x="mean")#transformation of the array in a dataframe to be rearranged (14220 obs. of 4 variables : mean,subject,activity,feature)
tidyfile<-data.frame(tidyfile[,3],tidyfile[,2],tidyfile[,4],tidyfile[,1])#modifications of the columns order of the data frame :activity,subject,feature,mean


finaltidyfile<-data.frame(tidyfile[1:180,1],tidyfile[1:180,2])#rearrange the file (all the data are in one column (the 4th), obtention of 79 columns(one for each feature))
for (i in seq(0,nrow(tidyfile)-1,by=180)){
  n<-i+1
  m<-i+180
  finaltidyfile<-cbind(finaltidyfile,tidyfile[n:m,4])
}

colnames(finaltidyfile)<-c("activity","subject",tidycolname) #the last "touch" : adds column names to the data set


