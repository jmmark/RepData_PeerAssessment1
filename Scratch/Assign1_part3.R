#inherits data frame "activity" from previous script
#Assignment part 2
#sum up using aggregate, rather than dplyr--for practice
#by default aggregate omits missing variables

#calculate the aggregate and the max
meanIval <- aggregate(steps ~ interval, data = activity, FUN = mean)
maxIval <- meanIval$interval[meanIval$steps==max(meanIval$steps)]

#prepare the x axis with the right tick marks
xR <- as.POSIXct(c("00:00","24:00"),format="%H:%M")
xRseq <- seq(xR[1],xR[2],length.out=13)


plot(strptime(meanIval$interval,"%H:%M"), meanIval$steps, type = "l", lwd = 2, col = "red",xaxt="n",
     main = "", xlab = "", ylab = "")
axis.POSIXct(1,at=xRseq)
title(main = "Mean steps by 5 minute interval",xlab="5 minute interval",ylab="Mean number of steps")

#report stepsMean and stepsMedian, they are too close together to both be illustrated 
#on the histogram