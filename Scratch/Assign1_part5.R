#assignment part 5
wkend <- c("Saturday","Sunday")
actReplace$daytype[weekdays(actReplace$date) %in% wkend] <- "Weekend"
actReplace$daytype[is.na(actReplace$daytype)] <- "Weekday"
actReplace$daytype <- as.factor(actReplace$daytype)
meanWdayInt <- aggregate(steps ~ interval + daytype, data = actReplace, FUN = mean)
#ggplot doesn't like to do time series without numeric on both sides
#convert it to floating representation of time, plot, use char to label points

meanWdayInt$numint <- as.numeric(substr(meanWdayInt$interval,1,2)) + 
                            as.numeric(substr(meanWdayInt$interval,4,5))/60

timeLabels <- c(meanWdayInt$interval[seq(1,11+(23*12),by = 12)],"00:00")
#OK, now build up the ggplot
myPlot <- ggplot(meanWdayInt, aes(numint, steps))
myPlot <- myPlot + geom_line(colour = "blue", size = 1.5)
myPlot <- myPlot + facet_grid(daytype ~ .)
myPlot <- myPlot + theme_bw()
myPlot <- myPlot + scale_x_continuous(breaks = seq(0,24,by=1), labels = timeLabels)
myPlot <- myPlot + ggtitle("Mean number of steps taken by 5 minute interval, by Weekday/Weekend")
myPlot <- myPlot + xlab("5 mintue interval") + ylab("Mean number of steps taken")
print(myPlot)