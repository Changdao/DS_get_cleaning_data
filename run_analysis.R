##read the features description file for the "names" of the data.frame
features<-read.table('UCI HAR Dataset/features.txt')
## read and process trainset dataset.
trainTable1<-read.table('UCI HAR Dataset/train/X_train.txt',colClasses='numeric')
## assign names to the train data
names(trainTable1)<-as.vector(features$V2)
trainTable2<-read.table('UCI HAR Dataset/train/Y_train.txt',colClasses='character')
names(trainTable2)<-c('activity')
trainTable3<-read.table('UCI HAR Dataset/train/subject_train.txt',colClasses='integer')
names(trainTable3)<-c('subject')
## merge the trainset
trainTable<-cbind(trainTable1,trainTable2,trainTable3);

## read and process the test set.
testTable1<-read.table('UCI HAR Dataset/test/X_test.txt',colClasses='numeric')
names(testTable1)<-as.vector(features$V2)
testTable2<-read.table('UCI HAR Dataset/test/Y_test.txt',colClasses='character')
names(testTable2)<-c('activity')
testTable3<-read.table('UCI HAR Dataset/test/subject_test.txt',colClasses='integer')
names(testTable3)<-c('subject')
##merge the test set.
testTable<-cbind(testTable1,testTable2,testTable3);
## mert the train set with the test set.
totalData<-rbind(trainTable,testTable)

## aggregate the totoal data to generate the tidy data.
tidyData <- aggregate( . ~ activity + subject, data = totalData, mean)
write.table(tidyData,file='tidy.txt',row.name=FALSE)
