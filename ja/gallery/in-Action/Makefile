#       $NetBSD: Makefile,v 1.7 2004/02/28 09:51:18 grant Exp $
#       <!-- Based on english version: -->
#       <!-- NetBSD: Makefile,v 1.7 2004/02/28 09:51:18 grant Exp   -->
#
# Process .act files into .html files
#

all:    index.html screenshots.html   # index-new.html

index.html: index.act-template mkact.pl Makefile


.SUFFIXES:      .act-template .html

.act-template.html:
	iconv -f iso-2022-jp -t euc-jp < $< | perl mkact.pl >$*.act
	perl ./act2html.pl $*.act $@
	rm $*.act

clean:
	rm -f new2.act
	rm -f new2.html
	rm -f index-new.act
	rm -f index-new.html
