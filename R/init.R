.global <- new.env()

initResourcePaths <- function() {
  if (is.null(.global$loaded)) {
    shiny::addResourcePath(
      prefix = 'shinyGlobe',
      directoryPath = system.file('www', package='shinyGlobe'))
    .global$loaded <- TRUE
  }
  HTML("")
}