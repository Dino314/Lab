library(shiny)

ui <- fluidPage(
  titlePanel("Action"),
  sidebarLayout(
    sidebarPanel(
      numericInput("priceInput", "Price", 30,10, 100, step=5),
      br(),
      actionButton("Multiply", "Multiply"),
      actionButton("Add", "Add")
      ),
      mainPanel(
      
      textOutput("Result1"),
      br(),
      br(),
      textOutput("Result2")
    )
  )
)

server <- function(input, output) {
  
   multiply <- eventReactive(input$Multiply, {
    
     paste("Multiplying inserted number with 10 resulted in  ",input$priceInput*10,".")
     
  })   
   
   
   add <- eventReactive(input$Add, {
     
     paste("Adding inserted number to 10 resulted in  ",input$priceInput+10,".")
     
   })  
  
      output$Result1<-renderText({
      
        multiply()
      
    })

    output$Result2<-renderText({
        
        add()
        
      })
      
}

shinyApp(ui = ui, server = server)