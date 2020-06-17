# load shiny & required packages
library(shiny)
library(insuranceData)
library(tidyverse)

# load data
data(AutoClaims)
# df <- read_csv("directory-name/file-name.csv)

# Optional: activate reactlog
options(shiny.reactlog = FALSE)


ui <- fluidPage(
  
  # Application title
  titlePanel("Simple Sidebar Layout Application"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("xcol",
                  "X Variable:",
                  choices = names(AutoClaims)
      ),
      selectInput("ycol",
                  "Y Variable:",
                  choices = names(AutoClaims)
      ),
      selectInput("color",
                  "Categorize by:",
                  choices = names(AutoClaims),
                  selected = "STATE"
      )
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
      ggplot(aes_string(input$xcol, input$ycol, color = input$color)) +
      geom_point() +
      ggtitle(paste(input$xcol, "vs.", input$ycol))

  })
}



shinyApp(ui,server)

# # ggplot
# AutoClaims %>%
#   ggplot(aes(AGE, PAID, color = CLASS)) +
#   geom_point() +
#   ggtitle(paste("Age", "Amount Paid"))


