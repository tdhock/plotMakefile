\name{plotMakefile}
\alias{plotMakefile}
\title{plotMakefile}
\description{plot a Makefile using library(diagram).}
\usage{plotMakefile(makefile, sort.fun = sortDefault, colors = NULL, 
    categories = NULL, curve = 0, segment.from = 0.1, segment.to = 0.9, 
    box.type = "none", legend.x = "bottom", ...)}
\arguments{
  \item{makefile}{Path to the Makefile.}
  \item{sort.fun}{Function that takes a numeric vector of vertical/y values of the
file names to plot, and returns the files names in the order they
should appear on the plot.}
  \item{colors}{Named character vector that maps categories to plot colors.}
  \item{categories}{Named character vector that maps each category to a regular
expression for matching filenames.}
  \item{curve}{passed to plotmat.}
  \item{segment.from}{passed to plotmat.}
  \item{segment.to}{passed to plotmat.}
  \item{box.type}{passed to plotmat.}
  \item{legend.x}{passed to legend as x.}
  \item{\dots}{passed to plotmat.}
}

\value{Return value of plotmat, plus colors used in the legend, and
categories for the text labels.}

\author{Toby Dylan Hocking}




\examples{
## Default sorting may result in a plot with edge crossings.
f <- system.file(file.path("Makefiles", "custom-capture.mk"),
                 package="plotMakefile")
plotMakefile(f)
## You can adjust this by providing a custom sort.fun, and you can
## adjust other plotmat parameters such as main (plot title).
sorter <- sortValues("table-variants.R", "trios.RData",
                     "sample.list.RData", "table-noise.R")
plotMakefile(f, sort.fun=sorter,
             main="custom capture variant detection project")
## If you want to just plot everything in black without a legend,
## specify that all files belong to the same category.
plotMakefile(f, categories=".*")
}
