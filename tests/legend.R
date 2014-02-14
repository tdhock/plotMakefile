library(plotMakefile)

f <- system.file(file.path("Makefiles", "custom-capture.mk"),
            package="plotMakefile")
categories <-
  c(report="pdf$",
    figure="png$",
    "text/table"="tex$",
    data="RData$",
    code="R$")
res <- plotMakefile(f, categories=categories)
stopifnot(c("report", "text/table", "data", "code") %in% names(res$colors))
stopifnot("figure" != names(res$colors))
## ggplot()+
##   geom_text(aes(x, y, label=file, colour=category),
##             data=res$text)
