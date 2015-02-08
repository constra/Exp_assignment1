### plot 1 ###

## read the data ##
workdir <- paste("/Users/sun/Documents/Work_place/R/learning/",
                 "Exploratory_data_analysis/ExData_Plotting1/",sep="")
setwd(workdir)
power <- read.csv(paste(workdir,"household_power_consumption.txt",sep="")
                ,sep=";",colClasses=c("character","character",rep("numeric",7))
                ,na.strings="?")
## Subseting and transform the data
power07 <- subset(power,power$Date=="1/2/2007" | power$Date== "2/2/2007")
power07 <- transform(power07,day=paste(Date,Time,sep=" "))
power07 <- transform(power07,day=strptime(day,"%d/%m/%Y %T"))


## Make the plot
png("plot1.png")
hist(power07$Global_active_power,col="red",xlab="Global Active power (kilowatts)",
     main="Global Active Power")
dev.off()

