as.Date("09/28/2008", format="%m/%d/%Y")
##################
currentL<-Sys.getlocale()
Sys.setlocale("LC_ALL", "Czech")
date<-ymd(today())
format(date, "%B")

Sys.setlocale("LC_ALL", "Russian")
date<-ymd(today())
format(date, "%d")
##################
Sys.setlocale("LC_ALL", "English")
as.Date("08,30,1930", format="%m,%d,%Y")

as.Date("Aug 30,1930", format="%b %d,%Y")

as.Date("30aug1930", format="%d%b%Y")

#strin<-format(ymd("1930-08-30"), format="%b %d,%Y")
#date1<-as.character(strin)
#as.Date(date1, format="%B %d,%Y")
#date1


###################
#functions

if(5>0){
  print("Positive")
}

a = c(5,7,2,9)
b=a
ifelse(a %% 2 == 0,"even","odd")

a*b

##########
#Exercise 1
i<-0
repeat{
  if(i%%2==0 & i>0){
    print(i)
  }
  else if(i==11) {
    break
  }
 i=i+1
}
#Exercise 2
msg <- c("Hello")
i <- 1

repeat{
  print(msg)
  if(i>4) break
  i=i+1
}
#Exercise 3
i<-1
while(i<8){
  if(i%%2==1){
  print(i)
  }
  i<-i+1
}
#Exercise 4
msg <- c("Hello")
i <- 1
while(i<7){
  print(msg)
  i<-i+1
}
#Exercise 5
x <- c(7, 4, 3, 8, 9, 25)
i<-1
for(val in x){
  print(val)
  if(i>3){
    break
  }
  i<-i+1
}
#Exercise 6
y <- c("q", "w", "e", "r", "z", "c")
for(val in y){
  print(val)
}
#Exercise 7???
a<-1
b<-1
for(i in 1:3){
  a<-a+1
  for(j in 1:3){
    b<-b+1
    print("a:")
    print(a)
    print("b: ")
    print(b)
    if(j>2){
      break
    }
  }
}
#Exercise 8
i<-1:5
for(j in i){
  if(j==3){
    next()
  }
  print(j)
}
  
  
  
  
  
  
  
  
  
  




