#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(magrittr)
library(networkD3)
library(readxl)

# run reactlog for reactive debugging
library(reactlog)
options("shiny.reactlog" = TRUE) # enable reactlog recording


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("How to build a Shiny app from scratch"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h6("Welcome to our webinar on how to build a shiny application from scratch! Use the control widgets below to discover 
               what you will learn today."),
            checkboxGroupInput("checkbox_input", "Select a webinar topic:",
                               choices = c("How to build a shiny app from scratch" = "01",
                                           "shiny.rstudio.com" = "02",
                                           "Effective reactive programming Part 1" = "03"
                                           )
                               ),
            sliderInput("slider_input", "Time Elapsed", min = 1, max = 60, step = 1, value = 1)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            simpleNetworkOutput("knowledge_map")
        )
    )
)


# load data
# load("../knowledge-map/.RData")

nodes <- read_excel("nodes.xlsx")
links <- read_excel("links.xlsx")

# Define server logic required to draw a histogram
server <- function(input, output) {


    # generate network plot and save to output variable
    output$knowledge_map <- renderSimpleNetwork({
        
        # Only proceed if user has selected input
        req(input$checkbox_input)
        
        # filter based on user inputs
        nodes_filtered <-  nodes %>% filter(webinar %in% c(input$checkbox_input), time <= input$slider_input)
        links_filtered <-  links %>% filter(webinar %in% c(input$checkbox_input), time <= input$slider_input)
        
        # create plot
        forceNetwork(Links = links_filtered, Nodes = nodes_filtered,
                     Source = "source", Target = "target",
                     Value = "value", # strength of relationship (link width)
                     NodeID = "name",
                     Group = "group", Nodesize = "size",
                     opacityNoHover = TRUE, # display labels
                     opacity = 0.9,
                     fontSize = 10,
                     zoom = TRUE)
        
    })

    
}

# Run the application 
shinyApp(ui = ui, server = server)
