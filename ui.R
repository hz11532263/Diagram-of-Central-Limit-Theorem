
# ui.R

library(shiny)

shinyUI(fluidPage( 

  titlePanel("Diagram of Central Limit Theorem"),

  sidebarLayout(
    sidebarPanel(
      radioButtons("dist", "Distribution type:",
                   c("Normal" = "norm",
                     "Uniform" = "unif",
                     "Log-normal" = "lnorm",
                     "Exponential" = "exp")
                  ),
      br(),

      sliderInput( 
                  "bins",  
                  "Number of bins:",  # label
                  min = 1,
                  max = 100,
                  value = 20,
		  step = 1, 
                 ),  

      sliderInput( 
                  "sampling",  
                  "Number of sampling:",  # label
                  min = 2,
                  max = 500,
                  value = 100,
		  step = 2, 
                  animate=animationOptions(interval=1000/3, loop=FALSE)
                 ),  

      sliderInput( 
                  "sampleSize", 
                  "Sample size:",  # label
                  min = 1,
                  max = 1000,
                  value = 1, 
                  step = 1,
                  animate=animationOptions(interval=1000/3, loop=FALSE)
                 )
    ),

    mainPanel(
      tabsetPanel(type = "tabs", 
        tabPanel("Plot", plotOutput("distPlot")), 
        tabPanel("Summary", verbatimTextOutput("summary"))
      )
    )
  )
))
