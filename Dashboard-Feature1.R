SYMBOLS <- stockSymbols()

library(shiny)

ui <- dashboardPage(
  dashboardHeader(title= "Stock Dashboard"), 
  dashboardSidebar(), 
  dashboardBody(
    box(title= "Company Selection", status= "primary" ,  align= "center", height= 250,
        selectInput("select",
                    label = h3("Select A Stock Name"), 
                    choices = names(table(SYMBOLS$Name)), 
                    selected = 1),
        hr(),
        fluidRow(column(3, verbatimTextOutput("value")))
    )))

server <- function(input, output, session) {
  output$value <- renderPrint({ SYMBOLS$Symbol[which(SYMBOLS$Name == input$select)] })
}

shinyApp(ui, server)

