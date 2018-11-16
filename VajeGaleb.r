#vaje galeb, 2. in 3. teden
x <- c(2.1, 4.2, 3.3, 5.4)
x[c(3, 2)] #izpise tiste stevilke ki vsebujejo ta stevila v decimalki??

x[order(x)]

mylist<-list(x=c(1,5,7), y=c(4,2,6), z=c(0,3,4))
mylist
mylist[[1]]#prvi element
mylist[[2]][[3]]#tretji element od drugega elementa

#subsetting.txt
#Exercise 1
a<-mtcars[,1]
a[a>15.0]
a
#Exercise 2
mtcars[mtcars$mpg>=21,]
#Exercise 3
mtcars[mtcars$cyl<6 & mtcars$gear==4,]
#Exercise 4
mtcars[mtcars$mpg>=21,1:4]
#Exercise 5
head(airquality[airquality$Ozone>28 | airquality$Temp>70,], 5)
#Exercise 6
head(airquality[airquality$Ozone>28 | airquality$Temp>70,c(1,4)], 5)
#Exercise 7
head(CO2[CO2$Treatment=="chilled" & CO2$uptake>15,-4],5)
#Exercise 8
airquality[airquality$Ozone>100,-(2:3)]
###################
#3. teden
###################
mdy("1-2-18")
wday(dmy("22.02.2022"))
#############
str_c("asd","fds", sep=" ")
nchar("adsdss")
str_sub("string",1,3)
a<-c("banana", "anana", "bana", "a")
str_detect(a, "an")
str_detect(a, "anana")

str_subset(a, "ana")

str_count(a, "an")
####
date_ranges <- c("23.01.2017 - 29.01.2017", "30.01.2017 - 06.02.2017")
data<-"banana, ananas"
str_split(data, ", ")

str_replace("banana", "a", "o")
str_replace_all("banana", "a", "o")
#####Names.txt
##1.
names<-c("Sophia Abbe", "Olivia Abbett", "Emma Abbey", "Ava Abbitt", "Isabella Abbot", "Mia Abbott", "Aria Abbs", "Riley Abby", "Zoe Abdon", "Amelia Able", "Layla Abner", "Charlotte Abney", "Aubrey Aborn", "Lily Abrahams", "Chloe Abram", "Harper Abram", "Evelyn Ace", "Adalyn Acey", "Emily Acker", "Abigail Ackerley", "Madison Ackerly", "Aaliyah Ackerman", "Avery Ackers", "Ella Ackert", "Scarlett Ackland", "Maya Ackland", "Mila Ackley", "Nora Acklin", "Camilla Ackroyd", "Arianna Acock", "Eliana Acomb", "Hannah Acomb", "Leah Acors", "Ellie Acre", "Kaylee Acreman", "Kinsley Acres", "Hailey Acton", "Madelyn Acuff", "Paisley Acy", "Elizabeth Adams", "Addison Adcock", "Isabelle Adcox", "Anna Addams", "Sarah Adderley", "Brooklyn Adderly", "Mackenzie Addicott", "Victoria Addington", "Luna Addy", "Penelope Ade", "Grace Ades")
str_c(str_sub(names,1,1),". ",str_split(names, " ", simplify=TRUE)[,2])#vzet prvo crko imen, dodat . in dodat se priimke
##2.
sum(str_count(str_sub(str_split(names, " ", simplify=TRUE)[,1], -1, -1), "[ahse]"))