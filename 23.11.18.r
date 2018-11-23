library(tidyverse)

iris %>% select(Species) %>% group_by(Species) %>% summarise(number = n())#summarise=count

master <- read.csv("Master.csv")

head(master)
#dplyr Lab html vaje
master %>% select(birthYear) %>% group_by(birthYear) %>% summarise(number =
                                                                     n())

master %>% select(birthCountry) %>% group_by(birthCountry) %>% summarise(number =
                                                                           n()) %>% arrange(number)

master %>% select(weight, birthCountry) %>% group_by(birthCountry) %>% summarise(Average = round(mean(weight /
                                                                                                        2.2, na.rm = TRUE))) %>% arrange(desc(Average))
##########
master %>% select(weight, birthCountry, birthYear) %>% group_by(birthCountry, birthYear) %>%
  summarise(Average = round(mean(weight / 2.2, na.rm = TRUE))) %>%
  arrange(desc(birthCountry)) %>% filter(substr(birthCountry, 1, 1) == "S" &
                                           birthYear > 1900) %>% spread(birthCountry, Average)

norway <-
  readxl::read_xlsx("norway_new_car_sales_by_model (1).xlsx")

norway %>% select(Manufacturer, Year, Quantity) %>% group_by(Manufacturer, Year) %>%
  summarise(Total = sum(Quantity)) %>% spread(Year, Total)

df <- read.table(
  textConnection("1|a,b,c\n2|a,c\n3|b,d\n4|e,f"),
  header = F,
  sep = "|",
  stringsAsFactors = F
)

df %>% unnest(V2 = strsplit(V2, ","))#isto ime stolpca izbrise starega

#Titanic dataset

Titanic <- as.data.frame(Titanic)

survival <- function(Age, Survived, Sex) {
  if (Age == "Child" & Survived == "No") {
    return("Poor child")
  }
  else if (Sex == "Female" & Survived == "No") {
    return("Oh no")
  }
  else if (Age == "Adult" & Sex == "Male" & Survived == "Yes") {
    return("You shouldn't have saved yourself if there were still women and children abroad")
  }
  else{
    return("It's okay")
  }
}

as.data.frame(Titanic %>% rowwise() %>% mutate(Node = survival(Age, Survived, Sex)))


#%>% mutate_if(is.integer, as.character)

typeof(as.character(Titanic$Age))
typeof(Titanic$Survived)
typeof(Titanic$Sex)

mpgTOl <- function(a){
  return(282.48/a)
}

mtcars%>%mutate(l_per_100km = mpgTOl(mpg))%>%summarise_at(vars(mpg, hp, l_per_100km), funs(mean, median))

mtcars%>%mutate(Name = row.names(mtcars), l_per_100km = mpgTOl(mpg))%>%top_n(-1, l_per_100km)%>%select(Name, l_per_100km)#najbolj ekonomicen

mtcars%>%mutate(Name = row.names(mtcars), l_per_100km = mpgTOl(mpg))%>%top_n(1, l_per_100km)%>%select(Name, l_per_100km)#najmanj ekonomicen

##############

master <- read.csv("master.csv")
fieldingof <- read.csv("FieldingOF.csv")

master%>%head()

fieldingof%>%head()

master%>%inner_join(fieldingof)%>%select(nameFirst, nameLast, yearID, Gcf)%>%group_by(yearID)%>%arrange(desc(yearID))



master$debut[1][1]
substr('2004-04-04', 1, 4)


















