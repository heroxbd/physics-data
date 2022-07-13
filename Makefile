progress:=$(shell (seq 0 2))

.PHONY: all slides notes jupyter clean
all: notes slides jupyter
slides: $(progress:%=upload/p%.pdf)
notes: $(progress:%=upload/l%.html)

j_list:=Python-Basics Python-Constructs
jupyter: $(j_list:%=upload/%.slides.html)

p%.tex: pd.org
	emacs $^ --batch --load=setup.el --eval="(search-forward \":EXPORT_FILE_NAME: $(basename $@)\")" --eval="(org-beamer-export-to-latex nil t nil)" --kill

# should ultimately fix ob-ein to be friendly to minted.
# put verbatim into scriptsize, need some better idea with org-mode.
ein/e%.tex: p%.tex
	sed -e 's/ein-python/python/' -e 's/ein-bash/bash/' -e '/{minted}/s/\[\]/\[bgcolor=lightgray\]/' -e 's/\\begin{verbatim}/{\\scriptsize\\begin{verbatim}/' -e 's/end{verbatim}/end{verbatim}}/' < $^ > $@

e%.pdf: ein/e%.tex
	latexmk -shell-escape -lualatex $^

lecture/%.html: lecture/%.org
	emacs $^ --batch -f org-html-export-to-html --kill

upload/p%.pdf: e%.pdf
	mkdir -p $(dir $@)
	cp $^ $@
upload/l%.html: lecture/l%.html
	mkdir -p $(dir $@)
	cp $^ $@
upload/%.slides.html: notebooks/%.slides.html
	mkdir -p $(dir $@)
	cp $^ $@

2019/grade1.csv: 2019/phase1.csv 2019/phase2.csv 2019/TA.csv 2019/comments.csv
	./grade.R $@ $^
2019/grade2.csv: 2019/grade1.csv

clean:
	rm -rf out/*
	rm -rf upload/*.pdf
	rm -rf *.tex
	rm -rf ein/*.tex

.DELETE_ON_ERROR:
.SECONDARY:

