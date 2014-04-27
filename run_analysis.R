library(reshape2)
setwd("./UCI HAR Dataset")
### Read the column names
ColNam <- read.table("features.txt",stringsAsFactors=FALSE)
CNam <- ColNam$V2
## Prepare to read the data from X_test.txt
setwd("./test")
dataX <- read.table("X_test.txt",col.names=CNam)
## Prepare to read the activity id from y_test.txt
acti_id <-read.table("y_test.txt",col.names=c("Activity_id"),stringsAsFactors=FALSE)
## concatenate acti_id and dataX
t_aux<-cbind(acti_id,dataX)
## Prepare to read the subject id from subject_test.txt
sub_id <-read.table("subject_test.txt",col.names=c("Subject_id"),stringsAsFactors=FALSE)
## concatenate subject_id and activity_id + dataX 
test<-cbind(sub_id,t_aux)
## Process the train data
setwd("..")
setwd("./train")
dataX_trn <- read.table("X_train.txt",col.names=CNam)
## Prepare to read the activity id from y_test.txt
acti_id_trn <-read.table("y_train.txt",col.names=c("Activity_id"),stringsAsFactors=FALSE)
## concatenate acti_id and dataX_trn
t_aux_trn<-cbind(acti_id_trn,dataX_trn)
## Prepare to read the subject id from subject_train.txt
sub_id_trn <-read.table("subject_train.txt",col.names=c("Subject_id"),stringsAsFactors=FALSE)
## concatenate subject_id and activity_id + dataX 
train<-cbind(sub_id_trn,t_aux_trn)
## Combine the data of test and train
TestTrain <- rbind(test,train)
## write the combine train and test dataset in directory UCI HAR Dataset
setwd("..")
write.table(TestTrain,"TestTrain.txt")
## Obtain just the mean and standard deviation
colsel<-c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,242:243,255:256,268:273,296:298,347:352,375:378,426:432,505:506,531:532,544:545,557:563)
trim <- TestTrain[,colsel]
##labels <-read.table("activity_labels.txt")
## Change activity numbers to labels
trim$Activity_id[trim$Activity_id ==1]<-"WALKING"
trim$Activity_id[trim$Activity_id ==2]<-"WALKING_UPSTAIRS"
trim$Activity_id[trim$Activity_id ==3]<-"WALKING_DOWNSTAIRS"
trim$Activity_id[trim$Activity_id ==4]<-"SITTING"
trim$Activity_id[trim$Activity_id ==5]<-"STANDING"
trim$Activity_id[trim$Activity_id ==6]<-"LAYING"
#obtain the large skinny dataset with the markers
trimMelt <- melt(trim,id=c("Subject_id","Activity_id"))
final<-dcast(trimMelt,Subject_id+Activity_id~variable,mean)
## write the final data in directory UCI HAR Dataset
write.table(final,"tidy.txt")
