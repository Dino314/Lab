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

