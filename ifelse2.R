ui <- fluidPage(  
  
  titlePanel("Stock Price Fluctuation"),
  selectInput("selected", label = h3("Select Company"), 
              choices = list("SPG" = 1, "PEP" = 2, "TSLA" = 3,"AMZN" = 4, 'FB'=5 ), 
              selected = 1),
  verbatimTextOutput("M"),
  
  
  hr(),
  fluidRow(column(3, verbatimTextOutput("value")))
  
)
server <- function(input, output) {
  #output$value <- renderPrint({ input$select }),
  #output$plot <- renderPlot({input$graph})
  output$plot <- renderPlot({
    new<-filter(dataframe, x,CompanyCode %in% input$selected)
    autoplot(new)
  })
  output$value <- renderPrint({ input$checkGroup}),
  output$M <- renderPrint({ output$oid2<-renderPrint({
    if (CompanyCode == “SPG) {
      " "
    } else {
      " "
    }
  })
  })
  
}
shinyApp(ui = ui, server = server)
