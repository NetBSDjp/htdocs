#	$NetBSD: Makefile,v 1.1 2001/08/07 22:57:22 dent Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
