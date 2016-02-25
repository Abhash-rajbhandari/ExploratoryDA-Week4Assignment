NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
library(ggplot2)

# Subset NEI data fip.
subsetNEI  <- NEI[NEI$fips=="24510", ]

#Aggregrating Total by Year and Type
aggr <- aggregate(Emissions ~ year + type, subsetNEI, sum)


#Plotting the graph 
png("plot3.png", width=640, height=480)
g <- ggplot(aggr, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()