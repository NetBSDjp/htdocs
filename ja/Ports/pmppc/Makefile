#	$NetBSD: Makefile,v 1.1 2002/05/31 10:16:16 augustss Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -a pmppc $< $@
