#For steps mentioned in the Assignment triple hashes are used(###)

#Loads required packages
library(dplyr)

#Reads data into R
y_test = read.table("Samsung Data/test/y_test.txt")
X_test = read.table("Samsung Data/test/X_test.txt")
subject_test = read.table("Samsung Data/test/subject_test.txt")
y_train = read.table("Samsung Data/train/y_train.txt")
X_train = read.table("Samsung Data/train/X_train.txt")
subject_train = read.table("Samsung Data/train/subject_train.txt")

features = read.table("Samsung Data/features.txt")

labels = read.table("Samsung Data/activity_labels.txt")

###Uses descriptive activity names to name the activities in the data set
y_test = data.frame(labels[match(y_test$V1, labels$V1), 'V2'])
y_train = data.frame(labels[match(y_train$V1, labels$V1), 'V2'])

colnames(y_test) = "Activity"
colnames(y_train) = "Activity"

colnames(subject_test) = "Subject"
colnames(subject_train) = "Subject"

###Appropriately labels the data set with descriptive variable names
#features$V2 = make.names(names = features$V2, unique=TRUE, allow_ = TRUE)
colnames(X_test) = features$V2
colnames(X_train) = features$V2

final_test = cbind(subject_test, y_test, X_test)
final_train = cbind(subject_train, y_train, X_train)

###Merges the training and the test sets to create one data set 
merged_data = rbind(final_train, final_test)

###Extracts only the measurements on the mean and standard deviation for each
###measurement 
mean_data = grep("mean()" ,colnames(merged_data))
std_data = grep("std()" ,colnames(merged_data))

pattern = c("^t", "^f", "Acc", "Gyro", "Mag", "-mean[(][)]", "-std[(][)]", "-mad[(][)]", "-max[(][)]", "-min[(][)]", "-sma[(][)]", "-energy[(][)]", "-iqr[(][)]", "-entropy[(][)]", "-arCoeff[(][)]", "-correlation[(][)]", "-maxInds", "-meanFreq[(][)]", "-skewness[(][)]", "-kurtosis[(][)]", "-bandsEnergy[(][)]", "-angle[(][)]", "Body", "Gravity")
replacement = c("Time", "Frequency", "Accelarometer", "Gyroscope", "Magnitude", "Mean", "Standard deviation", "Median absolute deviation", "Maximum", "Minimum", "Signal magnitude area", "Energy measure", "Interquartile range", "Signal entropy", "Autorregresion coefficient", "Correlation coefficient", "Largest index", "Mean frequency", "Skewness", "Kurtosis", "Bands energy", "Angle", "Body", "Gravity")
c = colnames(merged_data)
i = 1
while(i <= length(pattern)){c = gsub(pattern[i], replacement[i], c)
i = i + 1
}
colnames(merged_data) = make.names(c, unique=TRUE, allow_ = FALSE)

merged_data[mean_data]
merged_data[std_data]

###From the data set, creates a second, independent tidy data set with
###the average of each variable for each activity and each subject.
as = merged_data %>%
    group_by(Activity, Subject) %>%
    summarize(across(.fns = mean))
#Tidy data set with the average of each variable for each activity and each
#subject respectively
write.table(as, "ActivitySubject.txt", row.name = FALSE)