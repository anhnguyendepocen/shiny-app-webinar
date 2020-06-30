library(shiny)

ui <- fluidPage(
    fluidRow(wellPanel("Row1")),
    fluidRow(wellPanel("Row2"))
)
    
server <- function(input, output) {
    
}

shinyApp(ui, server)