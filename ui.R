
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Computing Pi with Hit & Miss"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput("nsim",
                  "Enter the number of simulations to perform:",
                  min = 100,
                  value = 100,
                  step = 100),
      uiOutput("estimations")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("pointPlot")
    )
  )
))

