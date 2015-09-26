features<-read.table('UCI HAR Dataset/features.txt')
trainTable1<-read.table('UCI HAR Dataset/train/X_train.txt',colClasses='numeric')
names(trainTable1)<-as.vector(features$V2)
#trainTable1$setType<-'train'
trainTable2<-read.table('UCI HAR Dataset/train/Y_train.txt',colClasses='character')
names(trainTable2)<-c('activity')
trainTable3<-read.table('UCI HAR Dataset/train/subject_train.txt',colClasses='integer')
names(trainTable3)<-c('subject')
trainTable<-cbind(trainTable1,trainTable2,trainTable3);


testTable1<-read.table('UCI HAR Dataset/test/X_test.txt',colClasses='numeric')
names(testTable1)<-as.vector(features$V2)
#testTable1$setType<-'test'
testTable2<-read.table('UCI HAR Dataset/test/Y_test.txt',colClasses='character')
names(testTable2)<-c('activity')
testTable3<-read.table('UCI HAR Dataset/test/subject_test.txt',colClasses='integer')
names(testTable3)<-c('subject')
testTable<-cbind(testTable1,testTable2,testTable3);

totalData<-rbind(trainTable,testTable)
#totalData<-testTable

tidyData <- aggregate( . ~ activity + subject, data = totalData, mean)
write.table(tidyData,file='tidy.txt',row.name=FALSE)
