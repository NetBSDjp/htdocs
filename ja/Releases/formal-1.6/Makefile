#	$NetBSD: Makefile,v 1.3 2003/04/16 21:15:55 grant Exp $
#       Process .list files into .html files

all:  index.html NetBSD-1.6.html NetBSD-1.6.1.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl -c NetBSD-1.6 $< $@
