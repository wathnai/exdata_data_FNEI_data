### Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
### which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
### Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
setwd("~/Data_Scientist/exdata_data_FNEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


install.packages("ggplot2")
library("ggplot2")

emissions_baltimore <- NEI[NEI$fips=="24510", ]
head(emissions_baltimore)


emissions_baltimore_by_type_and_year <- aggregate(Emissions ~ year + type, emissions_baltimore, sum)

dev.copy(png, file="plot3.png")
ggplot(data=emissions_baltimore_by_type_and_year, aes(x=year, y=Emissions, col=type)) + geom_line() + geom_point() + ggtitle("Emissions in Baltimore City")
dev.off()