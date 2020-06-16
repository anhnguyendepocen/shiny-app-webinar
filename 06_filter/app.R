# load shiny & required packages
library(shiny)
library(insuranceData)
library(tidyverse)

# load data
data(dataCar)
# df <- read_csv("directory-name/file-name.csv)

# ggplot
# AutoClaims %>% 
#   ggplot(aes(AGE, PAID, color = CLASS)) +
#   geom_point() +
#   ggtitle(paste("Vehicle Value vs.", "Exposure"))

ui <- fluidPage(
  
  # Application title
  titlePanel("Simple Sidebar Layout Application"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("x",
                  "X Variable:",
                  choices = c("AGE", "PAID")),
      selectInput("y",
                  "X Variable:",
                  choices = c("AGE", "PAID")),
      selectInput("color",
                  "Categorize by:",
                  choices = c("CLASS", "STATE", "GENDER"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$plot <- renderPlot({
    # generate plot based on user inputs
    AutoClaims %>% 
      ggplot(aes(input$x, input$y, color = input$color)) +
      geom_point() +
      ggtitle(paste(input$x, "vs.", input$y))

  })
}



shinyApp(ui,server)