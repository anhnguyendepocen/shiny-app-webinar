library(shiny)


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("xcol",
                  "X:",
                  choices = c("Sepal.Length", "Sepal.Width")
      ),
      selectInput("ycol",
                  "Y:",
                  choices = c("Sepal.Length", "Sepal.Width")
      )
    ),
    mainPanel(plotOutput("plot"))

  )
)

server <- function(input,output) {
  output$plot <- renderPlot({
    iris %>%
      ggplot(aes(input$xcol, input$ycol)) +
      geom_point()
  })
}

shinyApp(ui, server)