#	$NetBSD: Makefile,v 1.6 2002/08/01 20:24:59 jschauma Exp $
#       Process .list files into .html files

all:  NetBSD-1.5.1.html NetBSD-1.5.2.html NetBSD-1.5.3.html index.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl -c NetBSD-1.5.3 $< $@
