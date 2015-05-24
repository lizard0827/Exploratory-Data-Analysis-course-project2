#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
names(NEI)
baltimoreNEI<-subset(NEI, fips=="24510")
BaltimoreTotal<-aggregate(Emissions~year, baltimoreNEI, sum)
barplot(BaltimoreTotal$Emissions, names.arg=BaltimoreTotal$year, xlab="years", 
        ylab="total PM2.5 emission", main="Total emissions of Baltimore city over years")
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()
