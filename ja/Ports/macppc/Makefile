#	$NetBSD: Makefile,v 1.5 2002/08/01 20:25:44 jschauma Exp $
#	Process .list files into .html files

all:	faq.html x11.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl -a macppc $< $@
