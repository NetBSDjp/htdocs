#       $NetBSD: Makefile,v 1.6 2002/06/14 01:35:13 hubertf Exp $
#
# Process .act files into .html files
#

all:    index.html screenshots.html   # index-new.html

index.html: index.act-template mkact.pl Makefile


.SUFFIXES:      .act-template .html

.act-template.html:
	perl mkact.pl <$< >$*.act
	perl ./act2html.pl $*.act $@
	rm $*.act

clean:
	-rm new2.act
	-rm new2.html
	-rm index-new.act
	-rm index-new.html
