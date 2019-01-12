##plots, regex

g<- ggplot(airquality, aes(x=Ozone, y=(Temp-32)*0.5556))+geom_point()
g<-g+ggtitle("Ozone vs. Temp")+facet_grid(Month~.)
g

g<-g+facet_grid(.~Month)+ggtitle("Ozone vs. Temp by months")
g<-g+geom_smooth(method = lm, se = FALSE)
g

g<- ggplot(airquality, aes(x=Ozone, y=(Temp-32)*0.5556))+geom_point()+
  geom_vline(xintercept=mean(airquality$Ozone, na.rm = TRUE), col="red")+
  ylab("Temp")+
  geom_hline(yintercept=mean(((airquality$Temp-32)*0.5556), na.rm = TRUE), col="blue")+
  ggtitle("Ozone vs. Temp")+coord_flip()
g

y<-ggplot(data=iris, aes(x=iris$Species, y=iris$Petal.Length)) + geom_point()+ 
  xlab("Species")+ylab("Petal length")+geom_boxplot(outlier.color = "blue")
y

#library(gridExtra)

grid.arrange(g,y, ncol=2)

t<-as.data.frame(Titanic)%>%select(Age, Survived, Freq)%>%group_by(Age, Survived)%>%mutate(count1=sum(Freq))%>%
  top_n(1,Freq)
t

g<-ggplot(t, aes(x=Age, y=count1, fill=Survived))+geom_bar(stat="identity")
g

titanik


#druga resitev
df<-titanik[rep(1:nrow(titanik), titanik[,5]), -5]

a<-ggplot(df, aes(x=Age, fill=Survived))+geom_bar()
#class
b<-ggplot(df, aes(x=Class, fill=Survived))+geom_bar()

grid.arrange(a,b,ncol=2)


###########################
string <- c(" car", "cars", "in a car", "truck", "car's trunk", "sdss")
grep(soda, string)

pattern <- "\\scar$"

soda <- "^([a-z][a-z])+$"#soda stevila

text<-"Yesterday I had 100 Euros, today I only have 45 Euros left."
gregexpr("(\\d+)",text)


?str()

#i<-1
#while(i<nchar(text)){
  #substr(text, gregexpr("(\\d+)",text)[[1]][i], 20)
  #i<-i+1
#}

text
pattern<-"(\\D*([0-9]+)\\D+([0-9]+)\\D*)" #[0-9] lahko nadomsetimo z \\d
sub(pattern, "\\2", text)#nekak extractor texta??
sub(pattern, "\\3", text)

#kako naredit za neznano stevilo stevilk

attributes(gregexpr("(\\d+)",text)[[1]])[[1]][2]# vrne vn 3 pa 2










