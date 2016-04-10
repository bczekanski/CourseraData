I read in the various data sets and used cbind and rbind to do make complete test and training datasets, then I r binded them together. 

This resulted in my combined data set. 

Then I used group_by and summarize to generate the different means and standard deviations. 

This created my combined _ stats data set

Combined2 is the data set with the means for each subject and activity.

In Combined2 V1 is the subject number, and V1.1 is the activity.

To create combined2 I put all of the data sets together and then grouped by v1, and V1.1 and then summarized each using the mean.

