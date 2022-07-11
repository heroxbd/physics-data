progress:=$(guile (iota 2))

.PHONY: all
all: notes slides
slides: $(progress:%=out/p%.pdf)
notes: $(progress:%=lecture/l%.html)

p%.tex: pd.org
	emacs $^ --batch --eval="(search-forward \":EXPORT_FILE_NAME: $(basename $@)\")" --eval="(org-beamer-export-to-latex nil t)" --kill

out/p%.pdf: p%.tex
	latexmk -lualatex -auxdir=out -outdir=out $^

lecture/%.html: lecture/%.org
	emacs $^ --batch -f org-html-export-to-html --kill

2019/grade1.csv: 2019/phase1.csv 2019/phase2.csv 2019/TA.csv 2019/comments.csv
	./grade.R $@ $^
2019/grade2.csv: 2019/grade1.csv
