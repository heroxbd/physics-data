.PHONY: all
all: 0-main.html l11.html

%.txt: %.srt
	sed -r -f srt.sed $^ > $@

%.html: %.org
	emacs $^ --batch -f org-html-export-to-html --kill
