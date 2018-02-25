## This first line will likely take a few seconds. Be patient!
setwd("~/Data_Scientist/exdata_data_FNEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
### Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
emissions_per_year <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png")
barplot(emissions_per_year$Emissions, names.arg=emissions_per_year$year, xlab="years", ylab="total PM 2.5 emissions", col=c("darkblue","red", "green", "yellow"))
dev.off()