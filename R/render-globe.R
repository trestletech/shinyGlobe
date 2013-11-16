#' Render a WebGL Globe
#' 
#' Render a WebGL Globe.
#' @param expr The expression to be evaluated which should produce Web GL Globe.
#'   Should produce a data.frame with three columns: lat, long, and magnitude.
#' @param env The environment in which \code{expr} should be evaluated.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#' @author Jeff Allen \email{jeff@@trestletech.com}
#' @export
renderGlobe <- function(expr, env = parent.frame(), 
                     quoted = FALSE, precision = 3){
  func <- exprToFunction(expr, env, quoted)
  return(function() {
    data <- func()
    
    flattened <- as.vector(t(data))
    
    # RJSONIO doesn't seem to handle the data the way we want. Just serialize
    # ourselves as a string
    dataStr <- paste("[\"", "series", "\",[",
                     paste(round(flattened,precision), collapse=","), "]]", sep="")
    
    return (dataStr)
  })
}