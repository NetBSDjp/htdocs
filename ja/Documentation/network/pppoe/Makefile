#	$NetBSD: Makefile,v 1.1 2002/02/23 15:14:37 martin Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../../../list2html.pl $< $@
