#	$NetBSD: Makefile,v 1.2 2002/08/01 20:25:37 jschauma Exp $
#       Process .list files into .html files

all:  index.html NetBSD-1.6.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl -c NetBSD-1.6 $< $@
