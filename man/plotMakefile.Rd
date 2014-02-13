\name{plotMakefile}
\alias{plotMakefile}
\title{plotMakefile}
\description{plot a Makefile using library(diagram).}
\usage{plotMakefile(makefile, sort.fun = sortDefault, curve = 0, segment.from = 0.1, 
    segment.to = 0.9, ...)}
\arguments{
  \item{makefile}{Path to the Makefile.}
  \item{sort.fun}{Function that takes a numeric vector of vertical/y values of the
file names to plot, and returns the files names in the order they
should appear on the plot.}
  \item{curve}{passed to plotmat.}
  \item{segment.from}{passed to plotmat.}
  \item{segment.to}{passed to plotmat.}
  \item{\dots}{passed to plotmat.}
}

\value{Return value of plotmat.}

\author{Toby Dylan Hocking}




\examples{
  plotMakefile("~/R/plotMakefile/inst/Makefiles/custom-capture.mk")

##              sortValues("table-variants.R", "trios.RData",
##                         "sample.list.RData", "table-noise.R"))

## plotMakefile("~/R/plotMakefile/inst/Makefiles/seq-segment.mk",
##              sortValues("HOCKING-seq-segment.tex", "table-samples.tex",
##                         "figure-profiles.png",
##                         "figure-variables.png",
##                         "table-outliers.tex",
##                         "table-samples.R",
##                         "figure-profiles.R",
##                         "zscores.RData",
##                         "figure-variables.R"))

}
