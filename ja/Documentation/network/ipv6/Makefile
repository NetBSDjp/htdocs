#	$NetBSD: Makefile,v 1.2 1999/07/24 15:01:18 itojun Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../../../list2html.pl $< $@
