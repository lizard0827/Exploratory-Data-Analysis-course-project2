#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimoreNEI<-subset(NEI, fips=="24510")
BaltimoreTotalbyType<-aggregate(Emissions~year+type, baltimoreNEI, sum)
install.packages("ggplot2")
library(ggplot2)
BaltimoreTotalbyType<-transform(BaltimoreTotalbyType, year=factor(year))
ggp<-ggplot(BaltimoreTotalbyType, aes(year, Emissions, fill=type))+geom_bar(stat="identity")+
   theme_bw()+ facet_grid(.~type)+ xlab("years")+ ylab("total PM2.5 emission")+ ggtitle("Total emissions of Baltimore city over years by Type")
print(ggp)
dev.copy(png, file="Plot3.png", height=680, width=580)
dev.off()
