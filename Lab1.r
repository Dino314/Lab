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
#Exercize 4 = 
z <- factor(c("p", "q", "p", "r", "q"))
z
