#Create numeric vector with 100 elements
c(1:100)
#Create list with 10 elements
as.list(1:10)
#Create matrix with 10 rows and 5 columns
matrix(nrow = 10, ncol = 5)
#Create list with 5 named elements
list("ena"=1, "dva"=2, "tri"=3, "stiri"=4, "pet"=5)
#Create dataframe with 4 columns and rename them
a<-as.data.frame(c(1:5))
b<-as.data.frame(c(6:10))
c<-as.data.frame(c(11:15))
d<-as.data.frame(c(16:20))
e<-cbind(a,b,c,d)
colnames(e)<-c("prva", "druga", "tretja", "cetrta")
e
#open matrix.txt and complete the tasks
#Exercise 1
x<-c(1,2,3)
y<-c(4,5,6)
z<-c(9,8,7)
A<-matrix(c(x,y,z), nrow = 3, ncol = 3)
rownames(A)<-c("a", "b", "c")
A
#Exercise 2
is.matrix(A)
#Exercise 3
f<-c(1:12)
B<-matrix(f, nrow = 4, ncol = 3, byrow=TRUE)
colnames(B)<-c("x", "y", "z")
rownames(B)<-c("a", "b", "c", "d")
B
#open factors.txt and complete the tasks
#Exercise 1 = a
x = c(1, 2, 3, 3, 5, 3, 2, 4, NA)
as.factor(x)
#Exercise 2 = c
x <- c(11, 22, 47, 47, 11, 47, 11)
factor(x, levels=c(11, 22, 47), ordered=TRUE)
#Exercise 3 = c
z <- c("p", "a" , "g", "t", "b")
z[3] <- "b"
z
#Exercize 4
z <- factor(c("p", "q", "p", "r", "q"))
levels(z)
levels(z)[levels(z)=="p"]<-"w"
levels(z)
#Exercise 5
s1 <- factor(sample(letters, size=5, replace=TRUE))
s2 <- factor(sample(letters, size=5, replace=TRUE))
s3 <- factor(c(as.character(s1),as.character(s2)))
#Exercise 6
v1<-c(1:50)
v1

cut(v1, breaks = c(0, 10, 20, 30, 40, 50))

v <- iris$Sepal.Length
v

f1<-cut(v, breaks=4.3+(0:5*0.72))
f1
m<-summary(f1)
m
#Exercise 8
x <- data.frame(q=c(2, 4, 6), p=c("a", "b", "c"))
levels(x$p) <-c("fertiliser1", "fertiliser2", "fertiliser3")
x
levels(x$p)
#################################
str(x)
dim(x)
class(x)
 v<-iris$Sepal.Length
v 
v[v>6]

mylist<-list(x=c(1,5,7), y=c(4,2,6), z=c(0,3,4))
str(mylist)
mylist$y[3]

mylist[[2]][[3]]

a<-matrix(1:9, nrow=3)
a
colnames(a) <- c("A", "B", "C")
a
a[1:2, 3]
class(a[1:2, 3, drop=FALSE])

cars

cars[ ,2]

colnames(airquality)
head(airquality)

head(airquality[, c(1, 3, 4)])
cars[1:10, ]
cars[cars$speed==4,]

cars[cars$speed>10,2,drop=FALSE]

cars[cars$speed>3 & cars$dist==2,]
cars[cars$speed>3 | cars$dist==2,]

df<-as.tibble(airquality[airquality$Temp>75 & 
             airquality$Wind>12, c(1,5)])
df
na.omit(df)
#########################
#Exercise 1
mtcars[mtcars[[1]]>15.0,1]
#Exercise 2
as.data.frame(mtcars[mtcars[[1]]>=21, ])
#Exercise 3
mtcars[mtcars$cyl<6 & mtcars$gear==4, ]
#Exercise 4
mtcars[mtcars$mpg>=21, 1:4]
#Exercise 5
head(airquality[airquality$Ozone>28 | airquality$Temp>70, ], 5)
#Exercise 6
head(airquality[airquality$Ozone>28 & airquality$Temp>70, c(1, 4)], 5)
#Exercise 7
head(CO2[CO2$Treatment=="chilled" & CO2$uptake>15, -4], 10)
#Exercise 8
airquality[airquality$Ozone>100, c("Ozone", "Temp", "Month", "Day")]
