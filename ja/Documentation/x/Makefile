#	$NetBSD: Makefile,v 1.3 2005/02/07 16:46:14 kano Exp $
#	<!-- based on english translation: -->
#	<!-- NetBSD: Makefile,v 1.2 2002/08/01 20:25:07 jschauma Exp   -->
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl $< $@
