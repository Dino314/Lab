index<-data.frame(year=2007:2016, pop=sample(10000:20000, size=10))

plot(index$year,index$pop)


plot(index$year,index$pop, type="l")

plot(index$year,index$pop, type="h")


plot(index$year,index$pop, type="l", main="Population by year",
     xlab="year",ylab="population")




mtc = mtcars %>% 
  select(mpg, cyl)%>%
  group_by(cyl) %>%
  summarise(meanmpg = mean(mpg, na.rm = TRUE))

plot(mtc$cyl,mtc$meanmpg, type="l",
     xlab="cyl",ylab="mean mpg")





lattice::dotplot(year~pop,data=index,main="Population by year",
                 ylab="year",xlab="population")

histogram(year~pop,data=index)

xyplot(mpg~wt | factor(cyl), data=mtcars, pch=19,
       main="MPG vs Wt", xlab="Wt/1,000",  ylab="MPG")




mtc = mtcars %>% 
  select(mpg, cyl, gear)%>%
  group_by(cyl, gear) %>%
  summarise(meanmpg = mean(mpg, na.rm = TRUE))


barchart(meanmpg~factor(gear) | factor(cyl), data=mtc)




g<-ggplot(index,aes(x=year,y=pop, group=1))+geom_line()
g<-g+ggtitle("Population by year")+xlab("Year")+
  ylab("Population")
g




ggplot(data=mtcars, aes(x=as.factor(cyl), 
  fill=factor(gear))) + geom_bar()+
  xlab("Num. of cyl")+ylab("")+labs(fill="Num. of gears")



ggplot(index,aes(x=as.factor(year), y=pop))+
  geom_bar(stat="identity") + 
  coord_cartesian(ylim=c(10000,20000))+ylab("Population")+
  xlab("year")



g<-g+theme(axis.text.x = element_text(angle = 60, hjust = 1))
g


#number of cars per cylinder barchart

ggplot(mtcars, aes(x=as.factor(cyl))) + geom_bar()+ theme_classic() + 
  xlab("Cyl") + ylab("Number of cars") + 
  ggtitle("Number of cars per cylinders")











