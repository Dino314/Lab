library(shiny)
library(ggplot2)
library(tidyverse)

norway<-readxl::read_xlsx("norway_new_car_sales_by_model.xlsx")

ui <- fluidPage(
  
  # App title ----
  titlePanel("mtcars"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Number of cylinder----
      selectInput("Gear", h3("Number of gears"), 
                  choices = c("Audi" = "Audi", "Honda" = "Honda",
                              "Toyota" = "Toyota"), selected = "Audi")
      # za en gumb je dovolj samo ta vrstica
      #submitButton("calculate")
      #actionButton("Model", "Model"),
      #actionButton("Year", "Year")
      
    
      
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: ggplot2 scatter
      plotOutput("cylPlot")
      
    )
  )
)

server <- function(input, output) {
  
  #Mtcars
  
  # output$cylPlot <- renderPlot({
  #   
  #   mtcars%>%select(hp,mpg,gear)%>%
  #     filter(gear==input$Gear)%>%
  #     ggplot(.,aes(x=hp, y=mpg))+geom_point()+geom_smooth(method="lm")
  #   
  # })
  
  output$cylPlot <- renderPlot({
    df = norway%>%select(Year, Model, Manufacturer, Quantity)%>%filter(Manufacturer==input$Proizvajalec)
    ggplot(df, aes(x= as.factor(Year), y=Quantity, fill = Model))+geom_bar(stat = "identity")+ xlab("Year")
    
  })
  
}

shinyApp(ui = ui, server = server)