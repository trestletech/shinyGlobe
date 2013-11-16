library(shiny)
library(shinyGlobe)

#' Define UI for application that demonstrates a simple Ace editor
#' @author Jeff Allen \email{jeff@@trestletech.com}
shinyUI(
  tagList(
    globeOutput("globe"),
    div(id="info", tagList(
      HTML(
        'Population data from <a href="http://maxmind.com">MaxMind</a>.'
      ),
      HTML(
        '<br />Built in <a href ="http://rstudio.com/shiny/">Shiny</a> using the <a href ="http://github.com/trestletech/shinyGlobe/">ShinyGlobe</a> package.'
      )
    ))
  )  
)