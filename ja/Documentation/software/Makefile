#	$NetBSD: Makefile,v 1.5 1999/11/23 23:41:39 abs Exp $
#	Process .list files into .html files

all:	compiling.html packages.html pkg-growth.html pkg-growth-jpg.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
