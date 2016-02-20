shinyUI(fluidPage(
  tags$h2("JavaScript output binding example"),
  fluidRow(
    column(width=6,
      p("This Shiny app is an adaptation of the",
        a(href="http://nvd3.org/examples/line.html", "Simple Line Chart"),
        "example for the",
        a(href="http://nvd3.org/", "NVD3.js"),
        "JavaScript charting library."
      ),
      tags$input(type="button", id="A", value="Update chart"),

      p("Source code:",
        a(href="https://github.com/jcheng5/shiny-js-examples/tree/master/output", "@jcheng5/shiny-js-examples/output"))
    )
  ),
  fluidRow(
    column(width=9,
      lineChartOutput("mychart")
    ),
    column(width=3,
      
           selectInput("select.country", label = h3("Select Country"), 
                       choices = countrylist, 
                       selected = 1),
           selectInput("select.product", label = h3("Select Product"), 
                       choices = productlist, 
                       selected = 1)
      
    )
  )
))
