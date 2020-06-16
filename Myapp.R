library(shiny)

ui <- fluidPage(
  fluidRow(wellPanel("row1")),
  fluidRow("row2")
)

server <- function(input, output){
  
}

shinyApp(ui, server)