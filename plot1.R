rm(list=ls())

setwd("")
## omitted for privacy reasons include directory where you saved the .txt file

consumption<-read.table("household_power_consumption.txt", header=TRUE)

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

## plot actual graphs
png( file="plot1.png")
hist(subdata$Global_active_power, col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")


dev.off()