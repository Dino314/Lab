install.packages("tidyverse")
library(tidyverse)

masterDf = read.csv("Master.csv")
#view(masterDf)

masterDf %>% select (birthYear) %>% group_by(birthYear) %>% summarise(no=n()) 
#no je spremenljivka, n() je count

masterDf %>% select (birthCountry) %>% group_by(birthCountry) %>% 
  summarise(no=n()) %>% arrange(desc(no))


masterDf %>% select (birthCountry, weight) %>% group_by(birthCountry) %>% 
  summarise(averagew = mean(weight*0.45, na.rm = TRUE)) %>%  arrange(desc(averagew))


masterDf %>% select (birthCountry, birthYear, weight) %>% group_by(birthCountry, 
  birthYear) %>%  summarise(averagew = mean(weight*0.45, na.rm = TRUE)) %>%  
  arrange(desc(birthCountry)) %>% filter(substr(birthCountry,1,3)=="USA" & 
  birthYear>1900) %>%   spread(birthCountry, averagew)





library(readxl)

norcars = readxl::read_xlsx("norway_new_car_sales_by_model.xlsx")
norcars

norcars %>% select(Manufacturer, Year, Quantity) %>% group_by(Manufacturer, Year) %>% 
  summarise(number = sum(Quantity)) %>% spread(Year, number)







df <- read.table(textConnection("1|a,b,c\n2|a,c\n3|b,d\n4|e,f"), 
                 header = F, sep = "|", stringsAsFactors = F)
#print(df)

df %>% unnest(strsplit(V2, ","))


fTOc<-function(x) {round((x-32)*5/9,0)}
airquality%>%mutate(TempC=fTOc(Temp))%>%head()








df = as.data.frame(Titanic)


funkcija = function(Age, Survived, Sex){
  if(Age == "Child" & Survived == "No"){
    return("Poor child")
  }
  else if(Sex == "Female" & Survived == "No"){
    return("Oh no")
  }
  else if(Sex == "Male" & Age == "Adult" & Survived == "Yes"){
    return("You shouldn't have saved yourself if there were still 
           women and children aboard")
  }else{
    return("It's ok")
  }
}  

df %>% mutate(Output = funkcija(Age, Survived, Sex))


  


iris%>%summarise_if(is.numeric, mean, na.rm=TRUE)%>%round(.,2)

airquality%>%summarise_at(vars(Ozone,Temp),
                          funs(mean, median), na.rm=TRUE)




litkm = function(mpg){
  return(282.48/mpg)
  
}

mtcars %>% mutate(consumption = litkm(mpg))


mtcars %>% mutate(consumption = litkm(mpg)) %>% 
  summarise_at(vars(mpg, hp, consumption), funs(mean, median)) 


mtcars %>% mutate(consumption = litkm(mpg)) %>% 
  top_n(1, consumption) 

m = as.data.frame(mtcars)
m = cbind(m, as.data.frame(row, names(m)))
colnames(m)[12] = "Name"

m %>% top_n(1,mpg)

mtcars %>% mutate(Name = row.names(mtcars), 
  consumption = litkm(mpg)) %>% top_n(1, consumption) %>%
  select (Name, consumption)






master = read.csv("Master.csv")
people = read.csv("People.csv")
fielding = read.csv("FieldingOF.csv")

#df2%>%View()
people%>%View()


people %>% inner_join(fielding, by = c("playerID" = "playerID")) %>%
  mutate_if(is.factor, as.character) %>%
  select(nameGiven, yearID, Gcf)%>% 
  filter(yearID >= 1900 & yearID <= 1910 & Gcf>0) %>%
  group_by(yearID, nameGiven) %>% 
  mutate(Number=sum(Gcf)) %>%
  arrange(yearID, desc(Gcf)) %>%
  group_by(yearID) %>%
  top_n(2, Number) %>%
  slice(2)































