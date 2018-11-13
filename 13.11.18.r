#install.packages("tidyverse")
#library(tibble)
library(tidyverse)
library(stringr)
library(tibble)

summary(hflights)

hflights<-hflights::hflights##restore hflights

hflights<-tbl_df(hflights)

hflights[7]
#==
carriers<-hflights$UniqueCarrier

two <- c("AA", "AS")

lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue")

two <-lut[two]

two
####
glimpse(hflights)

lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", "DL" = "Delta", "OO" = "SkyWest", "UA" ="United", "US"="US_Airways", "WN"="Southwest","EV"="Atlantic_Southeast", "F9"="Frontier", "FL"="AirTran", "MQ"="American_Eagle","XE"="ExpressJet","YV"="Mesa")

hflights$UniqueCarrier<-lut[hflights$UniqueCarrier]##adding/replacing Unique Carrier simybols with words(stolpec menjava)
hflights
glimpse(hflights)

unique(hflights$CancellationCode)

cancellationEmpty <- hflights$CancellationCode==""

lut <- c("A"="carrier", "B"="weather", "C"="FFA", "D"="Security", "E"="not cancelled")

cancellationEmpty

hflights$CancellationCode[cancellationEmpty]<-"E"
hflights$CancellationCode<-lut[hflights$CancellationCode]

#############

hflights[c("ActualElapsedTime","ArrDelay","DepDelay")]
##==
select(hflights, ActualElapsedTime, ArrDelay, DepDelay)

select(hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay)

select(hflights, Origin:Cancelled)

select(hflights, ArrDelay, DepDelay)

select(hflights, UniqueCarrier, FlightNum, contains("tail"), contains("cancel"))

select(hflights, contains("time"), contains("delay"))

ex1r <-hflights[c("TaxiIn","TaxiOut","Distance")]
#==
ex1d <- select(hflights, TaxiIn, TaxiOut, Distance)

#########
g1<-mutate(hflights, ActualGroundTime= ActualElapsedTime - AirTime)
g1$ActualGroundTime

g2 <-mutate(g1, GroundTime = TaxiIn + TaxiOut)
g2$GroundTime == g1$ActualGroundTime

g3 <- mutate(g2, AverageSpeed = Distance/ AirTime * 60)
g3$AverageSpeed

m1 <- mutate(hflights, loss = ArrDelay - DepDelay, loss_percent = ((ArrDelay - DepDelay)/DepDelay)*100)
m1

m2 <- mutate(hflights, loss = ArrDelay - DepDelay, loss_percent = loss / DepDelay*100)
m2

m3 <- mutate(hflights, TotalTaxi = TaxiIn + TaxiOut, ActualGroundTime= ActualElapsedTime - AirTime, Diff = TotalTaxi - ActualGroundTime) 
m3

filter(hflights, Distance>=3000)

filter(hflights, UniqueCarrier=="JetBlue" | UniqueCarrier=="Southwest" | UniqueCarrier=="Delta")

filter(hflights, TaxiIn + TaxiOut > AirTime)

c1<-filter(hflights, Dest=="JFK")
c1

c2 <- mutate(hflights, Date = str_c(Year,".", Month,".", DayofMonth))
c2$Date

select(c2, Date, DepTime, ArrTime, TailNum)

nrow(filter(hflights, DayOfWeek %in% c(6,7), Distance>1000, TaxiIn + TaxiOut <15))

dtc <- filter(hflights, Cancelled == 1, !is.na(DepDelay))
dtc

arrange(dtc, DepDelay)

arrange(dtc, CancellationCode)

arrange(dtc, UniqueCarrier, DepDelay)

arrange(dtc, UniqueCarrier, desc(DepDelay))

arrange(hflights, DepDelay + ArrDelay)

arrange(filter(hflights, Dest=="DFW", DepTime <800), desc(AirTime))

summarise(hflights, min_dist = min(Distance), max_dist = max(Distance))

summarise(filter(hflights, Diverted==1), max_div = max(Distance))

#2.naloga po zejji (source hhtps)

temp1<-filter(hflights, !is.na(ArrDelay))

summarise(temp1, earliest = min(ArrDelay), average = mean())####not done

