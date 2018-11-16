data(beavers)
head(beaver1)
apply(beaver1, 2, min)

options(scipen = 999)##da ni scientific
apply(beaver1, 2, mean)

apply(airquality, 2, mean)

l<-list(a<-1:10, b<-3:17, c<-30:35)
lapply(l,mean)

d<-sapply(l,mean)
d
d[2]

tapply(airquality$Temp,airquality$Month,mean)

#apply.txt
#Exercise 1
#a.
mymatrix = matrix(data = c(6,34,923,5,0, 112:116, 5,9,34,76,2, 545:549), nrow = 5)
mymatrix
#b.
apply(mymatrix, 1, mean)
#c.
apply(mymatrix, 2, mean)
#Exercise 2
#a.
l<-lapply(mtcars, min)
s<-sapply(mtcars, min)
m<-mapply(min, mtcars)
#b.
listobjects <- list(l,s,m)
#c.
lapply(listobjects, class)
#Exercise 3.
titanik<-as.data.frame(Titanic)
#a.
apply(Titanic, 2, sum)
#==
tapply(titanik$Freq, titanik$Sex, sum)
#b.
apply(Titanic, c(2, 4), sum)
#c.
apply(Titanic, c(2, 3), sum)
#Exercise 4
#a.
a<-lapply(iris, class)
##pravilnejsaa, a in b
sapply(iris[,!sapply(iris, is.numeric), drop=FALSE],levels)














