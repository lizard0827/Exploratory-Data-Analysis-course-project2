#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
setwd("/Users/lizard0827/Desktop/class/Exploratory data/exdata-data-NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
names(NEI)
mergeNEI_SCC<-merge(NEI, SCC, by.x="SCC", by.y="SCC", all=TRUE)
library(dplyr)
merge_select<-select(mergeNEI_SCC, (SCC:Short.Name))
Coal_list<-grepl("coal", merge_select$Short.Name, ignore.case=TRUE)
Coal_emission<-merge_select[Coal_list, ]
coal_emission_year<-aggregate(Emissions~year, Coal_emission, sum)
barplot(coal_emission_year$Emissions, names.arg=coal_emission_year$year, xlab="years", 
        ylab="total PM2.5 emission", main="Total Coal emissions over years")
dev.copy(png, file="Plot4.png", height=580, width=580)
dev.off()


library(ggplot2)
ggp<- ggplot(coal_emission_year, aes(year, Emissions, fill=type))+geom_bar(stat="identity")+
   theme_bw()+ xlab("years")+ ylab("total PM2.5 emission")+ ggtitle("Total emissions of Coal over years")


Coal_emission<-grep("coal", merge_select[(merge_select$Short.Name), ], ignore.case=TRUE)
