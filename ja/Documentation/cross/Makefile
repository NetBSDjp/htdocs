#	$NetBSD: Makefile,v 1.1 2001/01/08 11:48:43 itojun Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
