#	$NetBSD: Makefile,v 1.2 2002/08/01 20:25:04 jschauma Exp $
#	Process .list files into .html files

all:	info-3.html info-4.html info-5.html info-6.html info-7.html \
	info-8.html info-9.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../../list2html.pl $< $@
