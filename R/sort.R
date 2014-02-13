sortValues <- function
### manually sort to avoid edge crossings.
(...
### file names in the order that they should appear on the plot.
 ){
  files <- c(...)
  stopifnot(is.character(files))
  function(level){
    tiebreak <- structure(rep(NA, length(level)), names=names(level))
    tiebreak[files] <- seq_along(files)
    names(level)[order(-level, tiebreak)]
  }
### a function that can be used as the sort.fun argument to
### plotmakefile.
}

### default sort.fun to be used with plotmakefile.
sortDefault <- function(level){
  names(level)[order(-level)]
}

## TODO: make a sort.fun that uses the output of plotmat()$arr to get
## the plotted edges for each permutation, and selects the permutation
## that minimizes the number of edge crossings (and to tiebreak, edge
## distances).

