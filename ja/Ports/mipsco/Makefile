#	$NetBSD: Makefile,v 1.3 2001/04/08 21:15:44 dent Exp $
#	Process .list files into .html files

all:	faq.html models.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
