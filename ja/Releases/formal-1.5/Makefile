#	$NetBSD: Makefile,v 1.3 2001/07/11 19:12:25 dent Exp $
#       Process .list files into .html files

all:  NetBSD-1.5.1.html index.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -c NetBSD-1.5.1 $< $@
