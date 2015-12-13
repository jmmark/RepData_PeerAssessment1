##assignment part 4 - missing values
#calculate total missing values by column
naTable <- sapply(activity,function(x) {
    sum(is.na(x))
})

print("Total missing values by column")
print(naTable)

#replace na with the mean of the interval
#merge mean and overall, replace missing, drop merged col
actReplace <- merge(activity, meanIval, by.x = "interval",by.y="interval")
indexer <- is.na(actReplace$steps.x)
actReplace$steps.x[indexer] <- actReplace$steps.y[indexer]
actReplace <- actReplace[,1:3]
colnames(actReplace)[2] <- "steps"

#do the histogram thing again
sumDayR <- aggregate(steps ~ date, data = actReplace, FUN = sum)
hist(sumDayR$steps, col="purple", main = "Histogram of total steps by day",
     sub = "missing values replaced", xlab = "Sum of steps by day")
stepsMeanR <- mean(sumDayR$steps, na.rm = TRUE)
stepsMedianR <- median(sumDayR$steps, na.rm = TRUE)