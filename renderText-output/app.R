# Example of a shiny application with a sidebar layout, selectInput control widget,
# and simple text output.

library(shiny)

# Define UI
ui <- fluidPage(
    # Sidebar Layout
    sidebarLayout(
        # Sidebar Layout Elements (i.e. the panels)
        sidebarPanel = sidebarPanel(
            #Control Widget
            selectInput(
                inputId = "input_1",
                label = "Short description of control widget",
                choices = c(
                    "Iowa" = "IA",
                    "Colorado" = "CO",
                    "Massachusetts" = "MA"
                )
            )
        ),
        mainPanel = mainPanel(textOutput("output_1"))
    ))

# Server function
server <- function(input, output) {
    output$output_1 <- renderText({
        paste("You have selected", input$input_1)
    })
}
    
# Run the application
shinyApp(ui = ui, server = server)
