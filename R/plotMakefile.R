plotMakefile <- structure(function
### plot a Makefile using library(diagram).
(makefile,
### Path to the Makefile.
 sort.fun=sortDefault,
### Function that takes a numeric vector of vertical/y values of the
### file names to plot, and returns the files names in the order they
### should appear on the plot.
 curve=0,
### passed to plotmat.
 segment.from=0.1,
### passed to plotmat.
 segment.to=0.9,
### passed to plotmat.
 box.type="none",
 ...
### passed to plotmat.
 ){
  pat <- paste0("(?<target>[^:]+)",
                ":\\W*",
                "(?<depends>.*?)",
                "\n\t",
                "(?<recipe>.*?)",
                "\n")
  mkLines <- readLines(makefile)
  mkText <- paste(c(mkLines, "\n"), collapse="\n")
  rules <- str_match_all_perl(mkText, pat)[[1]][,-1]
  depends <- strsplit(rules[,"depends"], split=" ")
  recipes <- rules[,"recipe"]
  usedfor <- list() #or reverse depends.
  targets <- rules[,"target"]
  names(depends) <- targets
  for(i in seq_along(recipes)){
    dep <- depends[[i]]
    recipes[i] <- gsub("$<", dep[1], recipes[i], fixed=TRUE)
    for(d in dep){
      usedfor[[d]] <- c(usedfor[[d]], targets[i])
    }
  }
  files <- unique(c(unlist(depends), targets))
  levelsBelow <- structure(rep(0, length(files)), names=files)
  addTo <- usedfor
  while(length(addTo)){
    add.files <- unique(unlist(addTo))
    levelsBelow[add.files] <- levelsBelow[add.files] + 1
    addTo <- usedfor[add.files]
  }
  belowList <- split(files, levelsBelow)
  level <- levelsBelow
  for(lev in length(belowList):1){
    up.files <- belowList[[lev]]
    down.files <- unique(unlist(depends[up.files]))
    level[down.files] <- lev-2
  }
  sorted.names <- sort.fun(level)
  ## check for a valid permutation of the names.
  stopifnot(is.character(sorted.names))
  stopifnot(names(level) %in% sorted.names)
  stopifnot(length(sorted.names) == length(level))
  sorted <- level[sorted.names]
  counts <- rev(table(sorted))
  edges <- matrix("0", length(sorted), length(sorted),
                  dimnames=list(names(sorted), names(sorted)))
  for(from in names(usedfor)){
    to <- usedfor[[from]]
    edges[to, from] <- ""
  }
  plotmat(edges, pos=counts, box.type=box.type, name=names(sorted),
          curve=curve, segment.from=segment.from, segment.to=segment.to,
          ...)
### Return value of plotmat.
},ex=function(){
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
})
