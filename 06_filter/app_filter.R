# load shiny & required packages
library(shiny)
library(insuranceData)
library(tidyverse)

# Optional: activate reactlog
options(shiny.reactlog = FALSE)

# load data
data(AutoClaims)
# df <- read_csv("directory-name/file-name.csv)


ui <- fluidPage(
  
  # Application title
  titlePanel("Simple Sidebar Layout Application"),
  
  # Sidebar with a slider input 
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider",
                  "Age:",
                  min = 50,
                  max = 120,
                  value = 50
      )
    ),
    
    # Display plot in main panel
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Define server logic to generate plot
server <- function(input, output) {
  
  output$plot <- renderPlot({
    # generate plot based on user inputs
    AutoClaims %>%
      filter(AGE >= input$slider) %>%
      ggplot(aes(AGE, PAID, color = CLASS)) +
      geom_point() +
      ggtitle(paste("Age", "Amount Paid"))

  })
}


shinyApp(ui,server)

# ggplot
# AutoClaims %>%
#   filter(AGE > 70) %>%
#   ggplot(aes(AGE, PAID, color = CLASS)) +
#   geom_point() +
#   ggtitle(paste("Age", "Amount Paid"))