#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# library(shiny)
# library(ggplot2)
# library(lubridate)
# library(dplyr)
# tabela <- read.csv("ks-projects-201801.csv")
#odstranjevanje vrstic z nepravimi podatki
# tabela <- tabela%>%filter(year(launched) != "1970", year(launched) != "2009", year(launched) != "2018", state != "undefined", state != "live")

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Kickstarter project stats"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         selectInput("izbira",
                     "Izberi za grupiranje",
                     choices =  c("Leto" = "Year",
                                  "Mesec" = "Month",
                                  "Dan" = "Day"
                                  )),
         actionButton("crta", "Line chart"),
         actionButton("pita", "Pie chart")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("LinePlot"),
         plotOutput("PiePlot")
#ID,name,category,main_category,currency,deadline,goal,launched,pledged,state,backers,country,usd pledged,usd_pledged_real,usd_goal_real
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  graf<-eventReactive(input$crta, {
    
    tabela2 <- tabela%>%group_by(Year = year(launched), Month = month(launched))%>%summarise(stevilo = n())
    
    tabela2%>%ggplot(aes(x=as.factor(Month), y=stevilo, color=as.factor(Year), group=as.factor(Year)))+
      geom_line(stat="identity")+
      geom_point()
    
  })
  
  pie<-eventReactive(input$pita, {
    
    
    
    tabela3 <- tabela%>%group_by(Status = state)%>%summarise(stevilo = n())
    
    tabela3%>%ggplot(aes(x="", y=stevilo, fill=Status))+
      geom_bar(stat="identity")+
      coord_polar("y")+
      geom_text(aes(label = paste(round(stevilo/totalNumberofProjects*100, digits = 2),"%")), position = position_stack(vjust=0.5))+
      labs(x = NULL, y = NULL, title = "Stevilo projektov glede na status")
    
  })
  
  output$LinePlot<-renderPlot({
    
    # output$PiePlot<-renderText({})
    graf()
    
  })
  
  output$PiePlot<-renderPlot({
    
    
    pie()
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

