TARGET := sample.pdf
CNT := 2

.PHONY: all clean distclean
all: $(TARGET)

clean:
	$(RM) *.aux *.log *.dvi *.bbl *.blg

distclean: clean
	$(RM) $(TARGET)

%.pdf: %.dvi
	dvipdfmx $<

%.dvi: %.tex
	for i in `seq 1 $(CNT)`; do platex -interaction=batchmode $<; done
	-pbibtex $*
	for i in `seq 1 $(CNT)`; do platex -interaction=batchmode $<; done

