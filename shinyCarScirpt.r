#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)

norway<-readxl::read_xlsx("norway_new_car_sales_by_model.xlsx")


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Norway car sales"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("Proizvajalec",
                  "Izberi proizvajalca",
                  choices = c("Audi" = "Audi", "Honda" = "Honda", "Toyota" = "Toyota"), 
                  selected = "Honda"),
      actionButton("Sales", "Model"),
      actionButton("Year", "Year")
      #submitButton("Prikazi")     #za en button je dovolj submit, za ostale je treba action buttone z observeEvent
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("Sales"),
      plotOutput("Year")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  sales<-eventReactive(input$Sales, {
    
    
    df = norway%>%select(Model, Manufacturer, Quantity)%>%filter(Manufacturer==input$Proizvajalec)
    ggplot(df, aes(x=as.factor(Model), y=Quantity, fill = Model))+geom_bar(stat = "identity")+ xlab("Sales")
    
    
    
  })
  
  
  year<-eventReactive(input$Year, {
    
    df = norway%>%select(Year, Model, Manufacturer, Quantity)%>%filter(Manufacturer==input$Proizvajalec)
    ggplot(df, aes(x= as.factor(Year), y=Quantity, fill = Model))+geom_bar(stat = "identity")+ xlab("Year")
    
  })
  
  output$Sales<-renderPlot({
    
    sales()
    
  })
  
  output$Year<-renderPlot({
    
    year()
    
  })
}

# Run the application 
shinyApp(ui = ui, server = server)