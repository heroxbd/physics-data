.PHONY: slides
slides: out/p0.pdf out/p1.pdf

p%.tex: pd.org
	emacs $^ --batch --eval="(search-forward \":EXPORT_FILE_NAME: $(basename $@)\")" --eval="(org-beamer-export-to-latex nil t)" --kill

out/p%.pdf: p%.tex
	latexmk -lualatex -auxdir=out -outdir=out $^

2019/grade1.csv: 2019/phase1.csv 2019/phase2.csv 2019/TA.csv 2019/comments.csv
	./grade.R $@ $^
2019/grade2.csv: 2019/grade1.csv
