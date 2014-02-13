HOCKING-custom-capture.pdf: HOCKING-custom-capture.tex table-variants.tex table-noise.tex
	pdflatex HOCKING-custom-capture
table-variants.tex: table-variants.R sample.list.RData trios.RData
	R --no-save < $<
trios.RData: trios.R
	R --no-save < $<
sample.list.RData: sample.list.R 
	R --no-save < $<
table-noise.tex: table-noise.R sample.list.RData
	R --no-save < $<
