library(shiny)
library(shinyGlobe)

#' Define server logic required to generate simple WebGL Globe
#' @author Jeff Allen \email{jeff@@trestletech.com}
shinyServer(function(input, output, session) {
  population <- readRDS("population.Rds")
  #Filter out to only major cities -- otherwise too much data. Now ~10.9k rows
  population <- population[population$Population > .001, ]
  flattened <- as.vector(t(population))
  
  output$globe <- renderGlobe({
    list(a=flattened)
  })  
})