#	$NetBSD: Makefile,v 1.6 2003/11/30 02:12:32 jschauma Exp $
#       Process .list files into .html files

all:  index.html NetBSD-1.6.html NetBSD-1.6.1.html NetBSD-1.6.2.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl -c NetBSD-1.6 $< $@
