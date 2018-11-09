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

  
  
  
  
  
  
  
  
  
  
  




