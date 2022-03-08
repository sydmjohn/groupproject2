library(quantmod)

SYMBOLS <- stockSymbols()

library(shiny)


ui <- fluidPage(selectInput("select", label=h3
                            ("Select a Stock"), choices=names(table(SYMBOLS$Name)),
                selected=1, 
                hr(),
                fluidRow(column(3, 
                                verbatimTextOutput("value")))))


server <- function(input, output, session)
  {
  output$value <- renderPrint({SYMBOLS$Symbol[which(SYMBOLS$Name== input$select)]}) 
  }

shinyApp(ui, server)




