packages=c("dplyr","XML","rvest","stringr","plyr","xml2","pryr")
package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)
  }
})

#################

library(shiny)

ui <- fluidPage(
  titlePanel("Reaktivnost"),
  sidebarLayout(
    sidebarPanel(
      numericInput("priceInput", "Price", 30,10, 100, step=5),
      br(),
      submitButton("calculate")),
      mainPanel(
      
      textOutput("Result")
      
    )
  )
)

server <- function(input, output) {
  
    
      output$Result<-renderText({
      
      paste("Multiplying inserted number with 10 resulted in  ",input$priceInput*10,".")
      
    })


}

shinyApp(ui = ui, server = server)