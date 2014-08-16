setwd("")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

Balt.road <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

Balt.agg <- aggregate(Balt.road[, 'Emissions'], by=list(Balt.road$year), sum)
colnames(Balt.agg) <- c('year', 'Emissions')

png(filename="Plot5.png")
ggplot(data=Balt.agg, aes(x=year, y=Emissions)) + geom_bar(aes(fill=year)) + guides(fill=F) +
  ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') +
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') +
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))
dev.off()


