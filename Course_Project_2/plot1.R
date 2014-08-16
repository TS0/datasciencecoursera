setwd("")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Sample <- aggregate(NEI[, "Emissions"], by=list(NEI$year), FUN=sum)
Sample$PM <- round(Sample[,2]/1000,2)


png(filename="Plot1.png")
barplot(Sample$PM, names.arg=Sample$Group.1,
        main=expression("Total Emission of PM"[2.5]),
        xlab="Year", ylab=expression("Total Emission of PM"[2.5]))
dev.off()