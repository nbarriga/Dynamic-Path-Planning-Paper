STY = sty/utfsm_tesis.sty sty/xtocinc.sty
INC = tex/Introduction.tex \
      tex/Stateofart.tex \
      tex/ReqSynthesis.tex \
      tex/EmpiricalModel.tex \
      tex/AcsVerification.tex \

all: tesis_nbarriga.pdf
allbib: allbib.pdf

tesis_nbarriga.pdf: tesis_nbarriga.tex ../biblio.bib $(STY)
	pdflatex -halt-on-error $<
	bibtex $(basename $<)
	pdflatex -halt-on-error $<
	pdflatex -halt-on-error $<

allbib.pdf: allbib.tex ../biblio.bib
	pdflatex -halt-on-error $<
	bibtex $(basename $<)
	pdflatex -halt-on-error $<
	pdflatex -halt-on-error $<

clean:
	rm -f tesis_nbarriga.{aux,toc,log,tmp,dvi,idx,ilg,ind,bbl,blg,out,lof,lot} \
              .my_log \
	      allbib.{aux,toc,log,tmp,dvi,idx,ilg,ind,bbl,blg,out,lof,lot,pdf}

distclean: clean
	rm -f tesis_nbarriga.pdf

.PHONY: all allbib clean distclean
