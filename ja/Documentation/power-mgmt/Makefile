#	$NetBSD: Makefile,v 1.1 1999/07/18 07:21:16 abs Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
