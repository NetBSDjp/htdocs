#	$NetBSD: Makefile,v 1.1 2000/05/17 11:57:45 blymn Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../../../list2html.pl $< $@
