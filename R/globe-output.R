#' Render a WebGL Globe
#' 
#' Render a WebGL Globe in an application page.
#' @param outputId The ID of the output for this element.
#' @author Jeff Allen \email{jeff@@trestletech.com}
#' @export
globeOutput <- function(outputId){
  tagList(
    singleton(tags$head(
      initResourcePaths(),
      tags$script(src = 'shinyGlobe/third-party/three.min.js', type="text/javascript"),
      tags$script(src = 'shinyGlobe/third-party/Detector.js', type="text/javascript"),
      tags$script(src = 'shinyGlobe/third-party/Tween.js', type="text/javascript"),
      tags$script(src = 'shinyGlobe/globe.js', type="text/javascript"),
      tags$script(src = 'shinyGlobe/shinyGlobe.js', type="text/javascript"),
      includeCSS(system.file("/www/style.css", package="shinyGlobe"))
    )),
    div(id=outputId, class="shiny-globe-output") 
  )
}

