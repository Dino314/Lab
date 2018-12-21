library(shiny)
library(ggplot2)
library(tidyverse)

ui <- fluidPage(
  
  # App title ----
  titlePanel("mtcars"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Number of cylinder----
      selectInput("Gear", h3("Number of gears"), 
                  choices = c("3" = 3, "4" = 4,
                              "5" = 5), selected = 3)
      
      
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
  
  output$cylPlot <- renderPlot({
    
    mtcars%>%select(hp,mpg,gear)%>%
      filter(gear==input$Gear)%>%
      ggplot(.,aes(x=hp, y=mpg))+geom_point()+geom_smooth(method="lm")
    
  })
  
}

shinyApp(ui = ui, server = server)