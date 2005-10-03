#	$NetBSD: Makefile,v 1.2 2002/08/01 20:25:08 jschauma Exp $
#	<!-- based on english translation: -->
#	<!-- NetBSD: Makefile,v 1.2 2002/08/01 20:25:08 jschauma Exp   -->
#	Process .list files into .html files

all:	pkg-growth.html pkg-growth-jpg.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl $< $@
