#	$NetBSD: Makefile,v 1.1 2001/03/15 09:22:23 jun Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
