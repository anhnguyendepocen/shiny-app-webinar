# Minimum viable example of a shiny app with a grid layout

library(shiny)

# Define UI
ui <- fluidPage(
  # Grid Layout
    fluidRow(wellPanel("Top row")),
    fluidRow(column(width = 4, wellPanel("Bottom row, column 1, width 4")),
             column(width = 8, wellPanel("Bottom row, column 2, width 8"))
    )
)


# Server function
server <- function(input, output) {
    
}

# Run the application
shinyApp(ui = ui, server = server)