#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
#Which city has seen greater changes over time in motor vehicle emissions?
setwd("/Users/lizard0827/Desktop/class/Exploratory data/exdata-data-NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
names(NEI)
Bal_LA_NEI<-subset(NEI, fips=="24510" | fips=="06037")
mobile_list<-grepl("ON-ROAD", Bal_LA_NEI$type, ignore.case=TRUE)
mobile_emission_Bal_LA<-Bal_LA_NEI[mobile_list, ]
mobile_emission_Bal_LA$fips[mobile_emission_Bal_LA$fips=="24510"]<-"Baltimore City"
mobile_emission_Bal_LA$fips[mobile_emission_Bal_LA$fips=="06037"]<-"Los Angeles county"
mobile_emission<-aggregate(Emissions~year+fips, mobile_emission_Bal_LA, sum)
install.packages("ggplot2")
library(ggplot2)
mobile_emission_Bal_LA<-transform(mobile_emission, year=factor(year))
ggp<- ggplot(mobile_emission, aes(year, Emissions, fill=fips))+geom_bar(stat="identity")+guides(fill=FALSE)+
  theme_bw()+ facet_grid(.~fips)+ xlab("years")+ ylab("total PM2.5 emission")+ ggtitle("Total mobile emissions in Baltimore and LA")
print(ggp)
dev.copy(png, file="Plot6.png", height=480, width=480)
dev.off()
