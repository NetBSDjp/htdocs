#	$NetBSD: Makefile,v 1.1 2000/07/19 20:43:07 dent Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
