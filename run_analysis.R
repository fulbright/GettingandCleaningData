features <- read.table("./UCI HAR Dataset/features.txt")

subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")

subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")

colnames(subtrain) <- "subject"
colnames(ytrain) <- "activity"
colnames(xtrain) <- features$V2

colnames(subtest) <- "subject"
colnames(ytest) <- "activity"
colnames(xtest) <- features$V2

train <- data.frame(subtrain, ytrain, xtrain)
test <- data.frame(subtest, ytest, xtest)

combo <- rbind(train, test)

meandata <- combo[, grep("mean", names(combo))]
stddata <- combo[, grep("std", names(combo))]

combo2 <- data.frame(meandata, stddata)

combo3 <- data.frame(subject = combo$subject, activity = combo$activity, combo2)

combo3$activity <- as.character(combo3$activity)

gsub <- gsub("1", "walking", combo3$activity)
gsub <- gsub("2", "walking_upstairs", gsub)
gsub <- gsub("3", "walking_downstairs", gsub)
gsub <- gsub("4", "sitting", gsub)
gsub <- gsub("5", "standing", gsub)
gsub <- gsub("6", "laying", gsub)

combo4 <- data.frame(subject = combo$subject, activity = gsub, combo2)

names(combo4) <- tolower(gsub("[^[:alnum:]]", "", names(combo4)))

library(reshape2)
melt <- melt(combo4, id.vars = c("subject", "activity"))
dcast <- dcast(melt, subject + activity ~ variable, fun.aggregate = mean)

write.csv(dcast, file = "./tidydataset.csv")