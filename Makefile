
2019/grade1.csv: 2019/phase1.csv 2019/phase2.csv 2019/TA.csv 2019/comments.csv
	./grade.R $@ $^
2019/grade2.csv: 2019/grade1.csv
