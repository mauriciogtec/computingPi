
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  
  output$pointPlot <- renderPlot({
    x.coord <- runif(input$nsim)
    y.coord <- runif(input$nsim)
    In <- (x.coord^2 + y.coord^2 <= 1)
    points <- data.frame(x.coord, y.coord, In)
    qplot(c(0,1), stat = "function", fun = function(x) sqrt(1-x^2), geom = "line") + # plot circle 
      geom_point(data = points, aes(x = x.coord, y = y.coord, colour = In, size = 2)) + # add points
      coord_fixed() + xlab("") + ylab("") + theme(legend.position="none") + # aspect ratio and details
      ggtitle ("Plotting the points inside and outside") 
  })

  output$estimations <- renderUI({
    x.coord <- runif(input$nsim)
    y.coord <- runif(input$nsim)
    frac.inside <- sum(x.coord^2 + y.coord^2 <= 1)/input$nsim
    HTML(paste("Fraction of points inside: <br><code>", frac.inside, "</code> <br>",
               "Estimation of PI (4 times the above) <br><code>", 4*frac.inside), "</code>")
  })
})
