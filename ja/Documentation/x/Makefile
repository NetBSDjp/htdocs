#	$NetBSD: Makefile,v 1.2 2002/09/19 14:18:46 kawamoto Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl $< $@
