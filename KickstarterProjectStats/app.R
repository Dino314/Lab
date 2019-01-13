#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyjs)
library(ggplot2)
library(lubridate)
library(dplyr)
tabela <- read.csv("ks-projects-201801.csv")
tabela <- tabela%>%filter(year(launched) != "1970") #, year(launched) != "2009", year(launched) != "2018", state != "undefined", state != "live")
 numRow <- nrow(tabela)
#odstranjevanje vrstic z nepravimi podatki


# Define UI for application that draws a histogram
ui <- shinyUI(
  navbarPage("Kickstarter project stats",
             tabPanel("Stevilo podatkov na mesec za vsako leto", 
                                  
  # useShinyjs(),
   # Application title
   #titlePanel("Kickstarter project stats"),
   
   # Sidebar with a slider input for number of bins 
   #sidebarLayout(
      sidebarPanel(
         # selectInput("izbira",
         #             "Izberi za grupiranje",
         #             choices =  c("Leto" = "Year",
         #                          "Mesec" = "Month",
         #                          "Dan" = "Day"
         #                          )),
         sliderInput("sliderLeto", label = "Rang leta", min = 2009, max = 2018, 
                     value = c(2010, 2017), sep = "")
         # ,actionButton("crta", "Line chart"),
         # actionButton("pita", "Pie chart")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("LinePlot")
        # tabsetPanel(type = "tabs", 
        #             tabPanel("Plot", plotOutput("LinePlot")),
        #             tabPanel("Podrobnosti za posamezen mesec", plotOutput("PiePlot")))
         
#ID,name,category,main_category,currency,deadline,goal,launched,pledged,state,backers,country,usd pledged,usd_pledged_real,usd_goal_real
      )
  ),#end of first tabPanel

tabPanel("Sortiranje",
         sidebarPanel(
           selectInput("izbiraMesec",
                       "Mesec",
                       choices =  c("Januar" = 1,
                                    "Februar" = 2,
                                    "Marec" = 3,
                                    "April" = 4,
                                    "Maj" = 5,
                                    "Junij" = 6,
                                    "Julij" = 7,
                                    "Avgust" = 8,
                                    "September" = 9,
                                    "Oktober" = 10,
                                    "November" = 11,
                                    "December" = 12
                       ), selected = 6),
           selectInput("izbiraLeto",
                       "Mesec",
                       choices =  c("2009" = 2009,
                                    "2010" = 2010,
                                    "2011" = 2011,
                                    "2012" = 2012,
                                    "2013" = 2013,
                                    "2014" = 2014,
                                    "2015" = 2015,
                                    "2016" = 2016,
                                    "2017" = 2017,
                                    "2018" = 2018
                       ), selected = 2010),
           selectInput("izbiraKategorija",
                       "Sortiranje",
                       choices =  c("Category" = "main_category",
                                    "Currency" = "currency",
                                    "Goal funding" = "goal",
                                    "State" = "state",
                                    "Country" = "country",
                                    "Amount pledged" = "usd_pledged_real"
                       )),
           actionButton("izbiraGumbLeto", "Za leto"),
           actionButton("izbiraGumbMesec", "Za mesec v letu")
           
           # ,actionButton("crta", "Line chart"),
           # actionButton("pita", "Pie chart")
         ),
         
         # Show a plot of the generated distribution
         mainPanel(
           plotOutput("GrafPlot")
           # tabsetPanel(type = "tabs", 
           #             tabPanel("Plot", plotOutput("LinePlot")),
           #             tabPanel("Podrobnosti za posamezen mesec", plotOutput("PiePlot")))
           
           #ID,name,category,main_category,currency,deadline,goal,launched,pledged,state,backers,country,usd pledged,usd_pledged_real,usd_goal_real
         )
  
  
)

)
#   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  graf<-eventReactive(input$sliderLeto, {
    
    # hide("PiePlot")
    # show("LinePlot")
    
    tabela2 <- tabela%>%filter(year(launched) >= input$sliderLeto[1], year(launched) <= input$sliderLeto[2])%>%group_by(Year = year(launched), Month = month(launched))%>%summarise(stevilo = n())
    
    tabela2%>%ggplot(aes(x=as.factor(Month), y=stevilo, color=as.factor(Year), group=as.factor(Year)))+
      geom_line(stat="identity")+
      geom_point()
    
  })
  
  mesec<-eventReactive(input$izbiraGumbMesec, {
    
    # hide("LinePlot")
    # show("PiePlot")
    
    #fill by category, main_category, currency, goal(3 values), state, country, usd_pledged_real(5 or more values)
    tabela4 <- tabela%>%filter(month(launched) == input$izbiraMesec, year(launched) == input$izbiraLeto)%>%group_by(input$izbiraKategorija)%>%summarise(Count = n())
    
    # tabela4 <- tabela%>%filter(month(launched) == 1, year(launched) == 2014)%>%group_by(main_category)%>%summarise(Count = n())

    tabela4%>%ggplot(aes(x=input$izbiraKategorija, y=Count, fill = input$izbiraKategorija))+
      geom_bar(stat="identity")
    
  })
  
  output$LinePlot<-renderPlot({
    
    graf()
    
  })
  
  output$PiePlot<-renderPlot({
    
    
    pie()
    
  })
  
  output$GrafPlot<-renderPlot({
    
    mesec()
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

##piechart

# tabela3 <- tabela%>%group_by(Status = state)%>%summarise(stevilo = n())
# 
# tabela3%>%ggplot(aes(x="", y=stevilo, fill=Status))+
#   geom_bar(stat="identity")+
#   coord_polar("y")+
#   geom_text(aes(label = paste(round((stevilo/numRow)*100, digits = 2),"%")), position = position_stack(vjust=0.5))+
#   labs(x = NULL, y = NULL, title = "Stevilo projektov glede na status")