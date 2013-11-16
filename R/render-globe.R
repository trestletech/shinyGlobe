#' Render a WebGL Globe
#' 
#' Render a WebGL Globe.
#' @param expr The expression to be evaluated which should produce Web GL Globe
#' @param width Either "auto", in which case the width will be calculated
#'   (reactively) based on the size of the glOutput element associated with this
#'   function, or a numeric value representing the width of the desired WebGL
#'   globe in pixels.
#' @param height The height of the WebGL scene. See \code{width} for details.
#' @param env The environment in which \code{expr} should be evaluated.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#' @author Jeff Allen \email{jeff@@trestletech.com}
#' @export
renderGlobe <- function(expr, width="auto", height="auto", env = parent.frame(), 
                     quoted = FALSE, precision = 3){
  func <- exprToFunction(expr, env, quoted)
  return(function() {
    data <- func()
        
    # RJSONIO doesn't seem to handle the data the way we want. Just serialize
    # ourselves as a string
    dataStr <- ""
    firstSer <- TRUE
    for (ser in names(data)){
      serStr <- paste("[\"", ser, "\",[",
                      paste(round(data[[ser]],precision), collapse=","), "]]", sep="")
      dataStr <- paste(dataStr, serStr, sep=ifelse(firstSer, "", ","))
      firstSer <- FALSE
    }
    
    return (dataStr)
  })
}