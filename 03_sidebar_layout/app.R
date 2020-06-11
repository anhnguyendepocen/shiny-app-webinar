# Minimum viable example of a shiny app with a sidebar layout

library(shiny)

# Define UI
ui <- fluidPage(
  
  # App Title
  titlePanel("Sidebar Layout"),
  
  # Sidebar Layout
  sidebarLayout(
    # Sidebar Layout Elements
    sidebarPanel = sidebarPanel("Replace this placeholder text with your input controls of choice."),
    mainPanel = mainPanel(
      "Replace this placeholder text with outputs, defined in the server function below,
                                        you want displayed in the main panel."
    )
    
  )
)


# Server function
server <- function(input, output) {
    
}

# Run the application
shinyApp(ui = ui, server = server)