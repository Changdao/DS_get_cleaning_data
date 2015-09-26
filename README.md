Explanation
====================
The analysis process is as following:
read train set data x_test.txt in fixed width, as well as as 561 columns.
read train set data subject_test.txt.
read train set y_test.
bind those three dataset.
add new column to identify the data is trainset.

Do the above steps on the test set.
Union the train set and test set.
Then extract the independent tidy data set with the average of each variable for each activity and each subject.
