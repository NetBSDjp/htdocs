#	$NetBSD: Makefile,v 1.3 2001/02/07 19:14:44 dent Exp $
#	Process .list files into .html files

all:	info-3.html info-4.html info-5.html info-6.html info-7.html \
	info-8.html info-9.html

.SUFFIXES:	.list .html

.list.html:
	../../../list2html.pl $< $@
