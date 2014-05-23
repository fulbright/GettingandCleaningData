Getting and Cleaning Data Course Project
========================================

This code book describes how the data set variables and the data in the "activity" column were relabeled.

### Relabeling the name of the variables:
The data is structured with the "subject" variable first, the "activity" variable second, and the rest of the measurement variables (79) last. All 79 measurement variables were relabeled so that the character strings contained only lowercase letters.

### Relabeling the data contained in the "activity" variable:

Initially, all of the data in the "activity" variable was a numeric value between 1 and 6. The "activity_labels.txt" file shows a specific character string associated with each number as follows:

* 1: walking
* 2: walking_upstairs
* 3: walking_downstairs
* 4: sitting
* 5: standing
* 6: laying

All of the data was relabeled. Instead of numbers, they were replaced with the descriptive character strings.