#	$NetBSD: Makefile,v 1.1 2002/01/22 20:30:20 cjep Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../list2html.pl $< $@
