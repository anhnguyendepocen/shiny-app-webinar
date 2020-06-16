# Build a shiny application from scratch

# load the shiny package
library(shiny)

# define the UI + Server
ui <- fluidPage(
        # Application title
        titlePanel("My application title")
)

server <- function(input, output) {
    
}

# Run the application
shinyApp(ui = ui, server = server)
