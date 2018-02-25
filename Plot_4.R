### Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

setwd("~/Data_Scientist/exdata_data_FNEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


install.packages("ggplot2")
library("ggplot2")


NEI_SCC <- merge(NEI, SCC, By="SCC")

coal <- grepl("coal", NEI_SCC$Short.Name, ignore.case=TRUE)
coal <- (NEI_SCC[coal, ])


emissions_USA <- aggregate(Emissions ~ year, coal, sum)

dev.copy(png, file="plot4.png")
ggplot(data=emissions_USA, aes(x=year, y=Emissions)) + geom_line() + geom_point() + ggtitle("Coal combustion-related Emissions USA 1999-2008")
dev.off()