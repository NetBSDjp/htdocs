#	$NetBSD: Makefile,v 1.3 2001/06/06 18:47:47 marcus Exp $
#	Process .list files into .html files

all:	faq.html howto.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
