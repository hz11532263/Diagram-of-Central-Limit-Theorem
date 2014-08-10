
# server.R

shinyServer(function(input, output) {


   set.seed(10000)
   x=runif(7000000, 0, 1)


  output$distPlot <- renderPlot({
    y=0
    for (i in 1:300){
    
      y[i]=mean(sample(x, input$SampleSize, rep=T))

    }

    bins <- seq(min(y), max(y), length.out = input$bins + 1)

    hist(y, breaks=bins, col = 'darkgray', border = 'white', 
         xlim=c(0,1), main="Histogram of frequency")
    lines(density(y), col="red")
    lines(bins, dnorm(bins, mean(y), sd(y)), col="blue")
  })

})

