#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
setwd("/Users/lizard0827/Desktop/class/Exploratory data/exdata-data-NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
names(NEI)
emissions<-aggregate(Emissions~year, NEI, FUN=sum)
barplot(emissions$Emissions, names.arg=emissions$year, xlab="years", 
        ylab="total PM2.5 emission", main="Total emissions over years")
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()
