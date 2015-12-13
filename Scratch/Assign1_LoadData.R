## data initially sits in a zip file in the working directory
##step 1 is to unzip it into the data folder
#lest load the libraries we will use right up front

library(ggplot2)

if (!file.exists("./Data")) {
    dir.create("./Data")
}

unzip("activity.zip",exdir="./Data")

#now read in the data, store it in activity data frame
activity <- read.csv("./Data/activity.csv")

#steps are integer, as it should be, but need to convert dates and intervals
#changing date is straightofrward
activity$date <- as.Date(activity$date)

#changing integer takes a few--need to get interval format to "0000" for strptime to work
activity$interval <- as.character(activity$interval)

activity[nchar(activity$interval)==1,"interval"] <- 
    paste("0",activity[nchar(activity$interval)==1,"interval"],sep="")

activity[nchar(activity$interval)==2,"interval"] <- 
    paste("0",activity[nchar(activity$interval)==2,"interval"],sep="")

activity[nchar(activity$interval)==3,"interval"] <- 
    paste("0",activity[nchar(activity$interval)==3,"interval"],sep="")

#want to convert to format "00:00"--can use strftime(strptime)
activity$interval <- format.POSIXlt(strptime(activity$interval, "%H%M"),"%H:%M")
