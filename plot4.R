### plot 4 ###

## read the data ##
workdir <- paste("/Users/sun/Documents/Work_place/R/learning/",
                 "Exploratory_data_analysis/ExData_Plotting1/",sep="")

power <- read.csv(paste(workdir,"household_power_consumption.txt",sep="")
                  ,sep=";",colClasses=c("character","character",rep("numeric",7))
                  ,na.strings="?")
## Subseting and transform the data
power07 <- subset(power,power$Date=="1/2/2007" | power$Date== "2/2/2007")
power07 <- transform(power07,day=paste(Date,Time,sep=" "))
power07 <- transform(power07,day=strptime(day,"%d/%m/%Y %T"))

## Make the plot
png("plot4.png")
par(mfrow=c(2,2))
with(power07,plot(day,Global_active_power,type="l",ylab="Global Active power",xlab=""))

with(power07,plot(day,Voltage,type="l",xlab="datetime"))

with(power07,plot(day,Sub_metering_1,type="l",ylim=c(0,40),ylab="Energy sub metering",xlab=""))
with(power07,points(day,Sub_metering_2,type="l",col="red"))
with(power07,points(day,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(power07,plot(day,Global_active_power,type="l",xlab="datetime"))

dev.off()
