# In this example, we add a control widget to the application /sidebar-layout/app.R

library(shiny)

# Define UI
ui <- fluidPage(
        # App Title
        titlePanel("Control Widget"),
  
        # Sidebar Layout
        sidebarLayout(
          # Sidebar Layout Elements (i.e. the panels)
          sidebarPanel = sidebarPanel(
            # Control widget
            selectInput(
                inputId = "input_1",
                label = "Short description of control widget",
                choices = c("Iowa" = "IA", "Colorado" = "CO", "Massachusetts" = "MA")
            )            
           ),
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