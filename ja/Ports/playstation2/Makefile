#	$NetBSD: Makefile,v 1.2 2002/08/01 20:25:02 jschauma Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl -a playstation2 $< $@
