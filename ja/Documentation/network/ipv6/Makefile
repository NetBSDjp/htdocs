#	$NetBSD: Makefile,v 1.3 2002/08/01 20:25:10 jschauma Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../../list2html.pl $< $@
