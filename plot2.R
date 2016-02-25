NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
NEIbalti <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
TotaggBal <- aggregate(Emissions ~ year, NEIbalti,sum)

png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
  TotaggBal$Emissions,
  names.arg=TotaggBal$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From all Baltimore City Sources"
)

dev.off()