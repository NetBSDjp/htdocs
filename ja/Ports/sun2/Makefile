#	$NetBSD: Makefile,v 1.1 2001/05/09 15:55:08 fredette Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -a sun2 $< $@
