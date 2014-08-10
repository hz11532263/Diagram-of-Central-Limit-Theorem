
# ui.R

library(shiny)

shinyUI(fluidPage( 

  titlePanel("Diagram of Central Limit Theorem"),

  sidebarLayout(
    sidebarPanel(
      sliderInput( 
                  "bins",  
                  "Number of bins:",  # label
                  min = 1,
                  max = 100,
                  value = 20,
			step = 1, 
                  animate=animationOptions(interval=200, loop=FALSE)),  

      sliderInput( 
                  "SampleSize", 
                  "sample size:",  # label
                  min = 1,
                  max = 1000,
                  value = 1, 
                  step = 1,
                  animate=animationOptions(interval=200, loop=FALSE))
    ),

    mainPanel(

      plotOutput("distPlot")
    )
  )
))
