### Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
### Which city has seen greater changes over time in motor vehicle emissions?

setwd("~/Data_Scientist/exdata_data_FNEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


install.packages("ggplot2")
library("ggplot2")


NEI_SCC <- merge(NEI, SCC, By="SCC")

OnRoad <- subset(NEI_SCC, fips == "06037" | fips == "24510" & type == 'ON-ROAD')
levels(OnRoad$fips)



OnRoad <- aggregate(Emissions ~ year + fips, OnRoad, sum)
OnRoad$fips[OnRoad$fips=="06037"] <- "Baltimore"
OnRoad$fips[OnRoad$fips=="24510"] <- "Los Angeles"
class(OnRoad$fips)
levels(OnRoad$fips)
png("plot6.png", width=840, height=480)
ggplot(data=OnRoad, aes(x=year, y=Emissions, col=fips)) + geom_line() + geom_point() + ggtitle("Emissions by motor vehicles - Los Angles vs Baltimore 1999-2008")
dev.off()