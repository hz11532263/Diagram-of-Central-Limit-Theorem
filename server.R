
# server.R

shinyServer(function(input, output) {

  data <- reactive({
    dist <- switch(input$dist,
                   norm = rnorm,
                   unif = runif,
                   lnorm = rlnorm,
                   exp = rexp,
                   rnorm)

   #set.seed(10000)    
    dist(7000000)
  })

  output$distPlot <- renderPlot({
    n = input$sampling
    y=0
    for (i in 1:n){
    
      y[i]=mean(sample(data(), input$sampleSize, rep=T))

    }

    limit=0
    if (input$dist=="norm"){
     limit=c(-3,3)
    } else if (input$dist=="unif") {
     limit=c(0,1)
    } else if (input$dist=="rlnorm"){
     limit=c(0,100)
    } else {
     limit=c(0,10)
    }

    bins <- seq(min(y), max(y), length.out = input$bins + 1)

    hist(y, col = 'darkgray', border = 'white',
         breaks=bins,
         xlim=limit,
         main='')
    lines(density(y), col="red")
    lines(bins, dnorm(bins, mean(y), sd(y)), col="blue")
    legend("topright", c("Density Estimate Curve","Normal Distribution Density Curve"),
           col = c("red", "blue"), lwd = 2, bty="n")

  })
  
  output$summary <- renderPrint({
    summary(data())
  })
  
})

