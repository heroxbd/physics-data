progress:=$(shell (seq 0 9)) a b c d e f

.PHONY: all slides notes clean
all: notes slides
slides: $(progress:%=upload/p%.pdf)
notes: upload/note.pdf

p%.tex: pd.org
	emacs $^ --batch --load=setup.el --eval="(search-forward \":EXPORT_FILE_NAME: $(basename $@)\")" --eval="(org-beamer-export-to-latex nil t nil)" --kill

note.org: pd.org
	sed -e '/LaTeX_CLASS_options/,/not-in-toc/c#+INCLUDE: book.org' $^ > $@
note.tex: note.org book.org
	emacs $< --batch --load=setup.el --eval="(org-beamer-export-to-latex)" --kill
	sed -f minted.sed -i $@
	./drop-toc-frame.sh $@

note.pdf: note.tex ef.pdf e7.pdf
	latexmk -shell-escape -lualatex $<

# Should ultimately fix ob-ein to be friendly to minted.
# put verbatim into scriptsize, need some better idea with org-mode.
e%.tex: p%.tex
	sed -f minted.sed < $< > $@
	sed -e 's/\\maketitle/\\begin{frame}\\titlepage\\end{frame}/' -i $@

out/%.pdf: fig/%.svg
	mkdir -p $(@D)
	rsvg-convert -f ps $^ | gs -dCompatibilityLevel=1.5 -sDEVICE=pdfwrite -sOutputFile=$@ -f -
ef.pdf: out/Data_Science_VD-migrate.pdf

e7.pdf: out/neutrino-higgs.pdf out/evolution-universe.pdf out/evolution-universe-decouple.pdf out/two-component.pdf out/Weyl-spinor.pdf out/neutrino-CP.pdf out/sun.pdf out/ppCNOchain.pdf out/homestake-principle.pdf out/Kamiokande.pdf out/anti-matter.pdf out/neutrino-anti.pdf out/neutrino-higgs.pdf out/Cobalt60.pdf

e%.pdf: e%.tex
	latexmk -shell-escape -lualatex $<

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
