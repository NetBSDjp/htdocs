#	$NetBSD: Makefile,v 1.1 2000/06/20 02:07:34 soren Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -a sgimips $< $@
