
library(shiny)
library(e1071)

data(Titanic)
df <- as.data.frame(Titanic)

shinyServer( function(input, output) {
  output$plot1 <- renderPlot({
    
    selectedData <- df[df$Class==input$cl & df$Sex==input$se & df$Age==input$ag,5]
    bplt <- barplot(selectedData,
                    beside=FALSE, horiz=TRUE, xlim=c(0,700),
                    main="Titanic stats based on selected attributes",
                    ylab="Total",
                    col=c("red", "green"),
                    legend = c("Deads", "Survivors")
    )
    text(x=selectedData+20,
         y=bplt,
         labels=as.character(selectedData),
         xpd=TRUE)
  })

})