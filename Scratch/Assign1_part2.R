#inherits data frame "activity" from previous script
#Assignment part 2
#sum up using aggregate, rather than dplyr--for practice
#by default aggregate omits missing variables
#need to be explicit when computing the 

sumDay <- aggregate(steps ~ date, data = activity, FUN = sum)
hist(sumDay$steps, col="light blue", main = "Histogram of total steps by day", xlab = "Sum of steps by day")
stepsMean <- mean(sumDay$steps, na.rm = TRUE)
stepsMedian <- median(sumDay$steps, na.rm = TRUE)


#report stepsMean and stepsMedian, they are too close together to both be illustrated 
#on the histogram