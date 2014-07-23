#my code book

rappeler les données analysées (copier fichier features)
Décrire les différentes lignes et colonnes du tableau activities, features. Expliquer la signification des noms de colonne

Citer les différents vecteurs et data frame présent dans l'environnement et au cours du script.

X_test 
X_train  "X_train.txt")
Y_test("y_test.txt")
Y_train("y_train.txt")
subj_test("subject_test.txt")
subj_train("subject_train.txt")
features("features.txt")


completedataset (X_test,X_train)
allcolumnnames

meancolnumber
stdcolnumber
tobeextractedcolnumber
meanstddataset
meancolumnnames


colonnes1_2

colonnes1_2[,2]<-as.numeric(colonnes1_2[,2])
colonnes1_2[,2][colonnes1_2[,2]==1]<-"walking"
colonnes1_2[,2][colonnes1_2[,2]==2]<-"walking upstairs"
colonnes1_2[,2][colonnes1_2[,2]==3]<-"walking downstairs"
colonnes1_2[,2][colonnes1_2[,2]==4]<-"sitting"
colonnes1_2[,2][colonnes1_2[,2]==5]<-"standing"
colonnes1_2[,2][colonnes1_2[,2]==6]<-"lying"


 
tidycolname



meanstddataset


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
