XELATEX ?= xelatex
TEXFLAGS = -interaction=nonstopmode -halt-on-error -file-line-error -no-shell-escape
SOURCES = main.tex fonts.tex nju.sty njulogo.pdf njuname.png njubackground.png njusme.png

.PHONY: all clean

all: main.pdf

main.pdf: $(SOURCES)
	$(XELATEX) $(TEXFLAGS) main.tex
	$(XELATEX) $(TEXFLAGS) main.tex

clean:
	rm -f main.aux main.log main.nav main.out main.snm main.toc main.vrb main.xdv main.fls main.fdb_latexmk main.synctex.gz
