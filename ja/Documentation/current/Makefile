#	$NetBSD: Makefile,v 1.2 1999/04/23 07:09:21 abs Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
