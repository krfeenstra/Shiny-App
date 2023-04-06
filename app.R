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
  shinyUI(pageWithSidebar(
    headerPanel("My first Shiny App"),
    sidebarPanel(
      selectInput(inputId = "variable",
                  label = "Variable:",
                  choices = c ("Horsepower" = "hp",
                               "Miles per Gallon" = "mpg",
                               "Number of Carburetors" = "carb"),
                  selected = "hp")
    ),
    
    mainPanel (
      plotOutput("carsPlot"),
      verbatimTextOutput("carsSummary")
    )
  )))


library(shiny)
library(dataset)

server <- function(input, output) {
  
  output$carsPlot <- renderPlot({
    hist(mtcars[,input$variable],
         main = "Histogram of mtcars variables",
         xlab = input$variable)
  })
  output$carsSummary <- renderPrint ({
    summary(mtcars[,input$variable])
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

