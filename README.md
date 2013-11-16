shinyGlobe
==========

An integration of RStudio's Shiny with Google's WebGL Globe platform. 

A **[Live Demo](http://spark.rstudio.com/trestletech/globePopulation/)** is available at [http://spark.rstudio.com/trestletech/globePopulation/](http://spark.rstudio.com/trestletech/globePopulation/).

## Installation

`shinyGlobe` isn't yet available on CRAN, but you can use `devtools` to install it from GitHub.

```{r}
# Install devtools, if you haven't already.
install.packages("devtools")

library(devtools)
install_github("shinyGlobe", "trestletech")
```

## Usage

Currently, `shinyGlobe` offers a very simple interface in which a anew globe is generated every time data changes. It may later be possible to animate ("tween") between states, but that looks like it would take some work.

The two important functions in the package currently are `renderGlobe` and `globeOutput` which should be used in `server.R` and `ui.R`, respectively. `renderGlobe` generates the page element in your UI where the globe will be loaded. `renderGlobe` translates your data into a format used in generating the globe. See [this example](https://github.com/trestletech/shinyGlobe/tree/master/inst/examples/01-population) included in the pacakge for a basic demo.

## Credits

The package is built on top of Google's [WebGL Globe](https://github.com/dataarts/webgl-globe) platform, which does 99% of the heavy lifting here. Their code is available under an Apache v2 License.