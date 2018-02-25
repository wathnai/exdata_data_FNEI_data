### This first line will likely take a few seconds. Be patient!
setwd("~/Data_Scientist/exdata_data_FNEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
### Use the base plotting system to make a plot answering this question.
emissions_baltimore <- NEI[NEI$fips=="24510", ]
head(emissions_baltimore) #optional, just for checking the output

emissions_baltimore <- aggregate(Emissions ~ year, emissions_baltimore, sum)

head(emissions_baltimore) #optional, just for checking the output

png("plot2.png")
barplot(emissions_baltimore$Emissions, names.arg=emissions_baltimore$year, xlab="years", ylab="total PM 2.5 emissions")
barplot(title("Emissions in Baltimore per year"))
dev.off()