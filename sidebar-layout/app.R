#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(



    # Sidebar with a slider input for number of bins 
    sidebarLayout(sidebarPanel = sidebarPanel("This is where you add your input controls"),
                  mainPanel = mainPanel("This is where you add your outputs, defined in the server function below,
                                        to display in the main panel")
        
        )
    )


# Define server logic required to draw a histogram
server <- function(input, output) {
}

# Run the application 
shinyApp(ui = ui, server = server)
