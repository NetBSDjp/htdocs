#	$NetBSD: Makefile,v 1.1 1999/02/15 18:46:45 abs Exp $
#	Process .faq files into .html files

all:	index.html

.SUFFIXES:	.faq .html

.faq.html:
	../makefaq.pl $< $@
