library(dplyr)
library(tidyr)
subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
features <- read.table("features.txt")

colnames(X_train) <- features$V2
combined_train <- cbind(subject_train, y_train, X_train)


subject_test <- read.table("test/subject_test.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

colnames(X_test) <- features$V2
combined_test <- cbind(subject_test, y_test, X_test)

combined <- rbind(combined_train, combined_test)
combined <- combined[ , !duplicated(colnames(combined[3:561]))]

combined_stats <- combined %>%
  summarize_each(funs(mean, sd))
combined$V1.1[combined$V1.1 == 1] <- "Walking"
combined$V1.1[combined$V1.1 == 2] <- "Walking Upstairs"
combined$V1.1[combined$V1.1 == 3] <- "Walking Downstairs"
combined$V1.1[combined$V1.1 == 4] <- "Sitting"
combined$V1.1[combined$V1.1 == 5] <- "Standing"
combined$V1.1[combined$V1.1 == 6] <- "Laying"

combined2 <- combined %>%
  group_by(V1, V1.1) %>%
  summarize_each(funs(mean))
