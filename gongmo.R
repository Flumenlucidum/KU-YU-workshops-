library(dplyr)
pop=read.csv('pop.csv')

pop_new=read.csv('pop_new.csv')
mode(pop)
mode(pop_new)
mode(pop_new$pop)
install.packages('ggplot2')
library(ggplot2)
pop_new %>% 
  ggplot(aes(x=name, fill=pop)) +
  geom_bar(position = 'dodge')  
install.packages('raster')
install.packages('rgeos')
install.packages('maptools')
install.packages('rgdal')
library(raster)
library(rgeos)
library(maptools)

library(rgdal)
map=readOGR(dsn="C:/Users/main/Desktop/공모전",layer='TL_SCCO_CTPRVN')
getwd()
setwd('C:\\Users\\main\\Desktop\\공모전')
map=shapefile('TL_SCCO_SIG.shp')
map<-spTransform(map,CRSobj=CRS('+proj=longlat +ellps=WGS84 +no_defs'))
map_new1=fortify(map,region='SIG_CD')
View(map_new1)
install.packages('ggmap')
library(ggmap)

popreal=read.csv('gu.csv')
popreal
popreal$pop1<-as.numeric(popreal$pop)
popreal$gen1<-as.numeric(popreal$gen)
popreal$complain1<-as.numeric(popreal$complain)
popreal$complain_rela1<-as.numeric(popreal$complain_rela)

map_new1$id<-as.numeric(map_new1$id)
seoul_map=map_new1[map_new1$id<=11740,]
pop_merge<-merge(seoul_map,popreal,by='id')
ggplot()+geom_polygon(data=pop_merge, aes(x=long,y=lat,group=group, fill=pop_merge$complain_rela), color='black')+scale_fill_gradient(low='white',high='blue')
View(pop_merge)
variable.names(popreal)
mean(popreal$gen)
popreal$gen1<-as.numeric(popreal$gen)
