#	$NetBSD: Makefile,v 1.1 2002/09/19 13:50:43 abs Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl -a arm32 $< $@
