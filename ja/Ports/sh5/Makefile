#	$NetBSD: Makefile,v 1.1 2002/10/20 14:44:12 scw Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl $< $@
