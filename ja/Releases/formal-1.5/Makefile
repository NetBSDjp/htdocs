#	$NetBSD: Makefile,v 1.5 2002/07/18 12:30:41 grant Exp $
#       Process .list files into .html files

all:  NetBSD-1.5.1.html NetBSD-1.5.2.html NetBSD-1.5.3.html index.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -c NetBSD-1.5.3 $< $@
