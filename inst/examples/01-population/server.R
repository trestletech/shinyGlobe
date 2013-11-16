library(shiny)
library(shinyGlobe)

#' Define server logic required to generate simple WebGL Globe
#' @author Jeff Allen \email{jeff@@trestletech.com}
shinyServer(function(input, output, session) {
  population <- readRDS("population.Rds")
  #Filter out to only major cities -- otherwise too much data. Now ~4.5k rows
  population <- population[population$Population > .0025, ]
  
  output$globe <- renderGlobe({
    population
  })
})