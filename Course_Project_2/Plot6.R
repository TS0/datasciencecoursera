setwd("")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BA.onroad <- subset(NEI, fips == "24510" & type == "ON-ROAD")
LA.onroad <- subset(NEI, fips == "06037" & type == "ON-ROAD")


BA.data <- aggregate(BA.onroad[, "Emissions"], by=list(BA.onroad$year), sum)
colnames(BA.data) <- c("year", "Emissions")
BA.data$City <- paste(rep('BA', 4))

LA.data <- aggregate(LA.onroad[, 'Emissions'], by=list(LA.onroad$year), sum)
colnames(LA.data) <- c("year", "Emissions")
LA.data$City <- paste(rep('LA', 4))
data <- as.data.frame(rbind(BA.data, LA.data))

## graph
png(filename="Plot6.png")
ggplot(data=data, aes(x=year, y=Emissions)) + geom_bar(aes(fill=year)) + guides(fill=F) +
  ggtitle("Total Emissions of Motor Vehicle Sources LA v BA") +
  ylab(expression("PM"[2.5])) + xlab("Year") + theme(legend.position="none") + facet_grid(. ~ City) +
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))
dev.off()
