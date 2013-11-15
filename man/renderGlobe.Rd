\name{renderGlobe}
\alias{renderGlobe}
\title{Render a WebGL Globe}
\usage{
  renderGlobe(expr, width = "auto", height = "auto",
    env = parent.frame(), quoted = FALSE, precision = 3)
}
\arguments{
  \item{expr}{The expression to be evaluated which should
  produce Web GL Globe}

  \item{width}{Either "auto", in which case the width will
  be calculated (reactively) based on the size of the
  glOutput element associated with this function, or a
  numeric value representing the width of the desired WebGL
  globe in pixels.}

  \item{height}{The height of the WebGL scene. See
  \code{width} for details.}

  \item{env}{The environment in which \code{expr} should be
  evaluated.}

  \item{quoted}{Is \code{expr} a quoted expression (with
  \code{quote()})? This is useful if you want to save an
  expression in a variable.}
}
\description{
  Render a WebGL Globe.
}
\author{
  Jeff Allen \email{jeff@trestletech.com}
}

