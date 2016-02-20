shinyServer(function(input, output, session) {
  
  output$mychart <- renderLineChart({
    # Return a data frame. Each column will be a series in the line chart.
    
    dt1 <- dta.m2
    
    dt1 <- subset(dt1, Country == input$select.country & Product == input$select.product )
    
    dt2 <- melt( dt1, id = 1:3)
    
    colnames(dt2) <- c("Country", "Product", "variable", "Year", "value")
    
    dt3 <- dcast(dt2, Country + Product + Year ~ variable)
    
    dt3 <- dt3[!(colnames(dt3) %in% c("Year", "Country", "Product"))]
    
    return(dt3)
    
  })
})
