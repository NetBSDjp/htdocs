#	$NetBSD: Makefile,v 1.2 2002/08/01 20:25:09 jschauma Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl $< $@
