#	$NetBSD: Makefile,v 1.1 2001/06/26 03:46:20 dent Exp $
#       Process .list files into .html files

all:  index.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -c NetBSD-1.4.3 $< $@
