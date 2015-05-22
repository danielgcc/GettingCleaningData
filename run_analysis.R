variablenames <- read.table("./features.txt")

subtest <- read.table("./test/subject_test.txt")
xtest <- read.table("./test/X_test.txt")
ytest <- read.table("./test/y_test.txt")
subtrain <- read.table("./train/subject_train.txt")
xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/y_train.txt")

datatest <- data.frame()
datatest <- rbind(datatest,subtest)
colnames(datatest) <- "Subject"
datatest["Name"] <- NA
datatest$Name <- "test"
datatest <- cbind(datatest,ytest,xtest)
colnames(datatest) <-c("Subject","Name","Activity",as.character(variablenames[,2]))
datatestf <- datatest[,c(1:3,4:9,44:49,84:89,124:129,164:169,204:205,217:218,230:231,243:244,256:257,269:274,348:353,427:432,506:507,519:520,532:533,545:546)]


datatrain <- data.frame()
datatrain <- rbind(datatrain,subtrain)
colnames(datatrain) <- "Subject"
datatrain["Name"] <- NA
datatrain$Name <- "train"
datatrain <- cbind(datatrain,ytrain,xtrain)
colnames(datatrain) <-c("Subject","Name","Activity",as.character(variablenames[,2]))
datatrainf <- datatrain[,c(1:3,4:9,44:49,84:89,124:129,164:169,204:205,217:218,230:231,243:244,256:257,269:274,348:353,427:432,506:507,519:520,532:533,545:546)]

wholedata <- data.frame()
wholedata <- rbind(wholedata,datatestf)
dim <-dim(datatrainf)
for (i in 1:dim[1]){
  wholedata <- rbind(wholedata,datatrainf[i,])
}

dim2 <- dim(wholedata)
for (j in 1:dim2[1]){
  if (wholedata[j,3]==1) wholedata[j,3] = "WALKING" 
  if (wholedata[j,3]==2) wholedata[j,3] = "WALKING_UPSTAIRS"
  if (wholedata[j,3]==3) wholedata[j,3] <- "WALKING_DOWNSTAIRS"
  if (wholedata[j,3]==4) wholedata[j,3] <- "SITTING"
  if (wholedata[j,3]==5) wholedata[j,3] <- "STANDING"
  if (wholedata[j,3]==6) wholedata[j,3] <- "LAYING"
}

tinydata <- wholedata[,c(1:3,4:6,10:12,16:18,22:24,28:30,34,36,38,40,42,44:46,50:52,56:58,62,64,66,58)]
