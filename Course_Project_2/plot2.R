setwd("")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


Maryland <- subset(NEI, fips=='24510')

png(filename="Plot2.png")
barplot(tapply(X=Maryland$Emissions, INDEX=Maryland$year, FUN=sum),
        main="Total Emission in Baltimore City, MD",
        xlab="Year", ylab=expression("PM"[2.5]))
dev.off()