#	$NetBSD: Makefile,v 1.4 2001/09/13 22:04:24 tv Exp $
#       Process .list files into .html files

all:  NetBSD-1.5.1.html NetBSD-1.5.2.html index.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -c NetBSD-1.5.2 $< $@
