shinyServer(function(input, output, session) {
  
  output$mychart <- renderLineChart({
    # Return a data frame. Each column will be a series in the line chart.
    data.frame(
      "Sine 2" = sin(1:10/10) * 0.25 + 0.5 * input$sinePhase
    )
  })
})
