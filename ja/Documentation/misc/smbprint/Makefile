#	$NetBSD: Makefile,v 1.1 2000/07/22 13:24:13 dent Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../../../list2html.pl $< $@
