#	$NetBSD: Makefile,v 1.1 2000/02/16 09:24:01 jun Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -a arm32 $< $@
