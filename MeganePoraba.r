meganeOrig <- read.csv("MeganePoraba.csv", sep=";", dec = ",")
meganeOrig
library(ggplot2)
library(lubridate)
library(dplyr)
setwd("C:\\Users\\Dino\\Documents\\GitHub\\Lab")

datum <-as.Date(meganeOrig$Datum, format="%d. %m. %Y")

megane <- meganeOrig%>%mutate(Dan = day(datum), Mesec = month(datum) ,Leto = year(datum), Placilo = Litri * Eur.na.liter)%>%
  group_by(Leto, Mesec)%>%summarize("Poraba za vsak mesec v l" = sum(Litri), "Povprecje v l" = mean(Litri))
megane

ggplot(megane, aes(x=as.factor(Mesec), y=`Povprecje v l`, fill = as.factor(Leto)))+geom_bar(stat = "identity")


#ID,name,category,main_category,currency,deadline,goal,launched,pledged,state,backers,country,usd pledged,usd_pledged_real,usd_goal_real
#od zacetka leta 2010 do konca leta 2017
tabela <- read.csv("Kickstarter Projects\\ks-projects-201801.csv")
#odstranjevanje vrstic z nepravimi podatki
tabela <- tabela%>%filter(year(launched) != "1970", year(launched) != "2009", year(launched) != "2018", state != "undefined", state != "live")


#count, koliko je vrstic za vsako kategorijo
tabela2 <- tabela%>%group_by(Year = year(launched), Month = month(launched))%>%summarise(stevilo = n())
totalNumberofProjects <- nrow(tabela)

#stevilo projektov za vsak
tabela3 <- tabela%>%group_by(Status = state)%>%summarise(stevilo = n())
#zamenjaj Year in Month pa lahko prikazes stevilo projektov na mesec za vsako leto, ali stevilo porjektov na leto za vsak mesec
lineChart <- tabela2%>%ggplot(aes(x=as.factor(Month), y=stevilo, color=factor(Year), group=as.factor(Year)))+
  geom_line(stat="identity")+
  geom_point()

lineChart
#piechart???
#y=names around the chart, x is empty, fill is colors of the pie, label in geom_text gives names inside the pie chart, position to adjust to middle
pieChart <- tabela3%>%ggplot(aes(x="", y=stevilo, fill=Status))+
  geom_bar(stat="identity")+
  coord_polar("y")+
  ###kako dvignit label na sredini in kako odstranit label na zunanjem krogu
  geom_text(aes(label = paste(round(stevilo/totalNumberofProjects*100, digits = 2),"%")), position = position_stack(vjust=0.5))+
  labs(x = NULL, y = NULL, title = "Stevilo projektov glede na status")

pieChart
#

head(tabela, 1)

head(tabela%>%filter(state == "live")%>%select(deadline)%>%arrange(deadline), 10)

