#	$NetBSD: Makefile,v 1.1 1999/06/17 19:57:44 danw Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -a macppc $< $@
