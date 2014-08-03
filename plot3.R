rm(list=ls())

setwd("")
## omitted for privacy reasons include directory where you saved the .txt file


# import whole dataset
assignment= read.table("household_power_consumption.txt", 
                       sep=";", 
                       header=TRUE,
                       na.strings="?",
                       col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
                       fill=FALSE, 
                       strip.white=TRUE)

## make copy so original data is retained
asscopy<-assignment

## set Date to date class
asscopy$Date<-as.Date(asscopy$Date, format= "%d/%m/%Y")
## create subset for plotting
subdata<-subset(asscopy, Date=="2007-02-01" | Date=="2007-02-02")

## set Date-Time format
subdata$DateTime<-as.POSIXct(paste(subdata$Date, as.character(subdata$Time)))


png(file= "plot3.png")

plot(x=subdata$DateTime, y=subdata$Sub_metering_1,
     type="l", ylab="Energy Sub Metering", xlab="" )
     lines(subdata$DateTime,subdata$Sub_metering_2, col="red" )
     lines(subdata$DateTime,subdata$Sub_metering_3, col="blue" )
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=1, lty=1, 
       pch=c(NA,NA) )
    
dev.off()
