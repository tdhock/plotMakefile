HOCKING-seq-segment.pdf: HOCKING-seq-segment.tex table-samples.tex figure-profiles.png figure-variables.png table-outliers.tex
	pdflatex HOCKING-seq-segment
table-samples.tex: table-samples.R zscores.RData
	R --no-save < $<
table-outliers.tex: table-outliers.R zscores.RData hg19.RData
	R --no-save < $<
figure-profiles.png: figure-profiles.R zscores.RData
	R --no-save < $<
figure-variables.png: figure-variables.R zscores.RData
	R --no-save < $<
zscores.RData: zscores.R
	R --no-save < $<
hg19.RData: hg19.R
	R --no-save < $<
