asdasd
R version 3.5.1 (2018-07-02) -- "Feather Spray"
Copyright (C) 2018 The R Foundation for Statistical Computing
Platform: i386-w64-mingw32/i386 (32-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> a = 4
> a
[1] 4
> a <-3
> a
[1] 3
> a + 3
[1] 6
> clear
Error: object 'clear' not found
> clear()
Error in clear() : could not find function "clear"
> c(1, true, "a")
Error: object 'true' not found
> c(1, TRUE, "a")
[1] "1"    "TRUE" "a"   
> c(1, TRUE)
[1] 1 1
> c(1, TRUE, FALSE)
[1] 1 1 0
> c(1, TRUE, FALSE)
[1] 1 1 0
> 
  > 
  > 'c'
[1] "c"
> "s"
[1] "s"
> +a+
  + +a
[1] 6
> 
  > 'a'
[1] "a"
> matrix()
[,1]
[1,]   NA
> matrix(1,1)
[,1]
[1,]    1
> matrix(1,1,2,3,4)
Error in matrix(1, 1, 2, 3, 4) : 'dimnames' must be a list
> matrix()
[,1]
[1,]   NA
> nrow
function (x) 
  dim(x)[1L]
<bytecode: 0x08995ac8>
  <environment: namespace:base>
  > nrow3
Error: object 'nrow3' not found
> nrow 3
Error: unexpected numeric constant in "nrow 3"
> matrix(nrow=3, ncol = 4)
[,1] [,2] [,3] [,4]
[1,]   NA   NA   NA   NA
[2,]   NA   NA   NA   NA
[3,]   NA   NA   NA   NA
> matrix(nrow=3, ncol = 4, byrow = T)
[,1] [,2] [,3] [,4]
[1,]   NA   NA   NA   NA
[2,]   NA   NA   NA   NA
[3,]   NA   NA   NA   NA
> matrix(nrow=3, ncol = 4)
[,1] [,2] [,3] [,4]
[1,]   NA   NA   NA   NA
[2,]   NA   NA   NA   NA
[3,]   NA   NA   NA   NA
> list(2,3,4)
[[1]]
[1] 2

[[2]]
[1] 3

[[3]]
[1] 4

> as.list(1,2,3)
[[1]]
[1] 1

> as.list(2,3)
[[1]]
[1] 2

> as.list(c(1,2))
[[1]]
[1] 1

[[2]]
[1] 2

> as.list(c(1,2),2)
[[1]]
[1] 1

[[2]]
[1] 2

> as.list(c(1,2),3)
[[1]]
[1] 1

[[2]]
[1] 2

> list(c(2,3,4))
[[1]]
[1] 2 3 4

> list(c(2,3,4))
[[1]]
[1] 2 3 4

> lit(1:10)
Error in lit(1:10) : could not find function "lit"
> list(1:10)
[[1]]
[1]  1  2  3  4  5  6  7  8  9 10

> as.list(1:10)
[[1]]
[1] 1

[[2]]
[1] 2

[[3]]
[1] 3

[[4]]
[1] 4

[[5]]
[1] 5

[[6]]
[1] 6

[[7]]
[1] 7

[[8]]
[1] 8

[[9]]
[1] 9

[[10]]
[1] 10

> as.list(c(1:10))
[[1]]
[1] 1

[[2]]
[1] 2

[[3]]
[1] 3

[[4]]
[1] 4

[[5]]
[1] 5

[[6]]
[1] 6

[[7]]
[1] 7

[[8]]
[1] 8

[[9]]
[1] 9

[[10]]
[1] 10

> as.list(c(1:10)) == list(1:10)
Error in as.list(c(1:10)) == list(1:10) : 
  comparison of these types is not implemented
> matrix(nrow=3, ncol = 4)
[,1] [,2] [,3] [,4]
[1,]   NA   NA   NA   NA
[2,]   NA   NA   NA   NA
[3,]   NA   NA   NA   NA
> matrix(1:8)
[,1]
[1,]    1
[2,]    2
[3,]    3
[4,]    4
[5,]    5
[6,]    6
[7,]    7
[8,]    8
> matrix(1:8, nrow = 4, ncol = 2, byrow=TRUE)
[,1] [,2]
[1,]    1    2
[2,]    3    4
[3,]    5    6
[4,]    7    8
> matrix(1:8, nrow = 4, ncol = 2, byrow=FLASE)
Error in matrix(1:8, nrow = 4, ncol = 2, byrow = FLASE) : 
  object 'FLASE' not found
> matrix(1:8, nrow = 4, ncol = 2, byrow=FALSE)
[,1] [,2]
[1,]    1    5
[2,]    2    6
[3,]    3    7
[4,]    4    8
> matrix(1:8, nrow = 4, ncol = 2)
[,1] [,2]
[1,]    1    5
[2,]    2    6
[3,]    3    7
[4,]    4    8
> matrix(1:8, nrow = 4, ncol = 2, byrow=TRUE)
[,1] [,2]
[1,]    1    2
[2,]    3    4
[3,]    5    6
[4,]    7    8
> matrix(1:8, nrow = 4, ncol = 2)
[,1] [,2]
[1,]    1    5
[2,]    2    6
[3,]    3    7
[4,]    4    8
> matrix(1:8, nrow = 4, ncol = 2) 
[,1] [,2]
[1,]    1    5
[2,]    2    6
[3,]    3    7
[4,]    4    8
> matrix(1:8, nrow = 4, ncol = 2) + 1
[,1] [,2]
[1,]    2    6
[2,]    3    7
[3,]    4    8
[4,]    5    9
> m<-matrix(1:8, nrow = 4, ncol = 2) + 1
> class(m)
[1] "matrix"
> is.matrix(T)
[1] FALSE
> is.matrix(M)
Error: object 'M' not found
> is.matrix(m)
[1] TRUE
> ?matrix
> rm(a)
> matrix(0, 1, nrow = 4, ncol = 2)
[,1] [,2]
[1,]    0    0
[2,]    0    0
[3,]    0    0
[4,]    0    0
> matrix(0:1, nrow = 4, ncol = 2)
[,1] [,2]
[1,]    0    0
[2,]    1    1
[3,]    0    0
[4,]    1    1
> rep(c(1,2,3), 10)
[1] 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
> seq(c(1,2,3), 10)
Error in seq.default(c(1, 2, 3), 10) : 'from' must be of length 1
> seq(1)
[1] 1
> seq(1:10)
[1]  1  2  3  4  5  6  7  8  9 10
> *seq
Error: unexpected '*' in "*"
> ?seq
> x<- c("good", "moderate", "good")
> x
[1] "good"     "moderate" "good"    
> y<-as.factor(x)
> y
[1] good     moderate good    
Levels: good moderate
> as.character(y)
[1] "good"     "moderate" "good"    
> x<- c("good","good", "moderate", "good")
> y<-as.factor(x)
> y
[1] good     good     moderate good    
Levels: good moderate
> z = factor(x, order = TRUE)
> z
[1] good     good     moderate good    
Levels: good < moderate
> x = c("good", "moderate", "good", "bad", "bad", "good")
> z = factor(x, order = TRUE)
> z
[1] good     moderate good     bad      bad      good    
Levels: bad < good < moderate
> x = c("good", "moderate", "good", "bad", "bad", "good", "z")
> z = factor(x, order = TRUE)
> z
[1] good     moderate good     bad      bad      good     z       
Levels: bad < good < moderate < z

cars
head(cars, 20)

?tibble
install.packages("tibble")
library(tibble)
as.tibble(cars)
?tibble
x<-c(1000:1050)
y <-c(50:100)

x
y
df <- as.data.frame(x,y)
?as.data.frame
df

df <- as.data.frame(x)
head(df)
df <- cbind(df,y)
colnames(df)
colnames(df)<-c("Stolpec1", "Stolpec2")
getwd()
