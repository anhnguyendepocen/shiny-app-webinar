library(shiny)

ui <- fluidPage(
    fluidRow(wellPanel("Row 1")),
    fluidRow(wellPanel("Row 2"))
    
)

server <- function(input, output){
    
}

shinyApp(ui, server)