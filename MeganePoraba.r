meganeOrig <- read.csv("MeganePoraba.csv", sep=";", dec = ",")
meganeOrig
library(ggplot2)
library(lubridate)

datum <-as.Date(meganeOrig$Datum, format="%d. %m. %Y")

megane <- meganeOrig%>%mutate(Dan = day(datum), Mesec = month(datum) ,Leto = year(datum), Placilo = Litri * Eur.na.liter)%>%
  group_by(Leto, Mesec)%>%summarize("Poraba za vsak mesec v l" = sum(Litri), "Povprecje v l" = mean(Litri))
megane

ggplot(megane, aes(x=as.factor(Mesec), y=`Povprecje v l`, fill = as.factor(Leto)))+geom_bar(stat = "identity")