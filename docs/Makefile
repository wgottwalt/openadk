ADK_TOPDIR=$(pwd)

all:	pdf text html

pdf:
	mkdir .pdf pdf
	cp *.txt .pdf
	cp images/*.png pdf
	a2x -v --dblatex-opts "-P latex.output.revhistory=0" -f pdf -d book -L -D pdf .pdf/manual.txt

text:
	mkdir .text text
	cp *.txt .text
	cp images/*.png text
	a2x -v -f text -d book -L -D text .text/manual.txt

html:
	mkdir .html html
	cp *.txt .html
	cp images/*.png html
	a2x -v --xsltproc-opts "--stringparam toc.section.depth 2" -f xhtml -d book -L -D html .html/manual.txt

clean:
	rm -rf pdf .pdf text .text html .html
