library(plotMakefile)

## Check that we can plot valid Makefiles without error.

data.dir <- system.file("Makefiles", package="plotMakefile")
files <- Sys.glob(file.path(data.dir, "*.mk"))
for(f in files){
  plotMakefile(f)
}
