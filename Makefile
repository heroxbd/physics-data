progress:=$(shell (seq 0 9)) a b c d e f

.PHONY: all slides notes jupyter clean
all: notes slides jupyter
slides: $(progress:%=upload/p%.pdf)
notes: $(progress:%=upload/l%.html) upload/note.pdf

j_list:=Python-Basics
jupyter: $(j_list:%=upload/%.slides.html)

p%.tex: pd.org
	emacs $^ --batch --load=setup.el --eval="(search-forward \":EXPORT_FILE_NAME: $(basename $@)\")" --eval="(org-beamer-export-to-latex nil t nil)" --kill

note.org: pd.org
	sed '/LaTeX_CLASS_options/,/not-in-toc/c#+INCLUDE: book.org' $^ > $@
note.tex: note.org book.org
	emacs $< --batch --load=setup.el --eval="(org-latex-export-to-latex)" --kill
	sed -f minted.sed -i $@
note.pdf: note.tex out/Data_Science_VD-migrate.pdf
	latexmk -shell-escape -lualatex $<

# Should ultimately fix ob-ein to be friendly to minted.
# put verbatim into scriptsize, need some better idea with org-mode.
e%.tex: p%.tex
	sed -f minted.sed < $< > $@

out/%.pdf: fig/%.svg
	mkdir -p $(@D)
	rsvg-convert -f ps $^ | gs -dCompatibilityLevel=1.5 -sDEVICE=pdfwrite -sOutputFile=$@ -f -
ef.tex: out/Data_Science_VD-migrate.pdf

e%.pdf: e%.tex
	latexmk -shell-escape -lualatex $^

lecture/%.html: lecture/%.org
	emacs $^ --batch -f org-html-export-to-html --kill

upload/p%.pdf: e%.pdf
	mkdir -p $(@D)
	cp $^ $@

upload/note.pdf: note.pdf
	mkdir -p $(@D)
	cp $^ $@

upload/l%.html: lecture/l%.html
	mkdir -p $(@D)
	cp $^ $@
upload/%.slides.html: notebooks/%.slides.html
	mkdir -p $(@D)
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
