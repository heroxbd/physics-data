p0.tex: pd.org
	emacs $^ --batch --eval="(search-forward \":EXPORT_FILE_NAME: p0\")" --eval="(org-beamer-export-to-latex nil t)" --kill


2019/grade1.csv: 2019/phase1.csv 2019/phase2.csv 2019/TA.csv 2019/comments.csv
	./grade.R $@ $^
2019/grade2.csv: 2019/grade1.csv
