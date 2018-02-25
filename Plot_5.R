### How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

setwd("~/Data_Scientist/exdata_data_FNEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


install.packages("ggplot2")
library("ggplot2")
levels(NEI_SCC$Data.Category)

NEI_SCC <- merge(NEI, SCC, By="SCC")

OnRoad <- subset(NEI_SCC, fips == "24510" & type == "ON-ROAD")


OnRoad <- aggregate(Emissions ~ year, OnRoad, sum)

png("plot5.png")
ggplot(data=OnRoad, aes(x=year, y=Emissions)) + geom_line() + geom_point() + ggtitle("Emissions by cars in Baltimore 1999-2008")
dev.off()