library(quantmod)

SYMBOLS <- stockSymbols()

library(shiny)


                selected=1, 
                hr(),
                fluidRow(column(3, 
                                verbatimTextOutput("value"))))


server <- function(input, output, session)
  {
  output$value <- renderPrint({SYMBOLS$Symbol[which(SYMBOLS$Name== input$select)]}) 
  }

shinyApp(ui, server)




