# GettingAndCleaningData
Submission for final project in Coursera's Getting and Cleaning Data class

Cleaning was performed on data downloaded here:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Additional information about the data set can be found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In order to make the data tidy, Hadley Wickham's reshape2 package is used. This creates a "long" table, as described in section 3.1 of Wickham's paper called Tidy Data (viewable here: http://vita.had.co.nz/papers/tidy-data.pdf)

Because the goal of this assignment is to average various measurements per activity and subject, it seems intuitive to tidy the data by melting it, turning the measurement name into a variable. Please note that as mentioned in the rubric, tidy data in the long or wide form is considered acceptable.

The tidy data can be loaded into R with the following lines:
library(data.table)
tidy <- fread("tidy.txt")

You can also load the tidy data directly from GitHub like so:
library(data.table)
url <- "https://github.com/janse/GettingAndCleaningData/blob/master/tidy.txt"
tidy <- fread(url)

Specific descriptions of the various measurements included in the tidy data (adapted from the original documentation of the data) can be found in CODEBOOK.md

Other sites/articles that were helpful while creating this assignment:

http://regexr.com/ (a browser-based application for tinkering with regular expressions)

https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/ (an explanation of the assignment by David Hood)

https://www.r-bloggers.com/reshape-and-aggregate-data-with-the-r-package-reshape2/  (examples for melting and aggregating using reshape2)


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.