#	$NetBSD: Makefile,v 1.5 1999/04/23 01:53:05 abs Exp $
#       Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../list2html.pl $< $@
