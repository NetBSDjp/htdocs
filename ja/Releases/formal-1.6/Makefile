#	$NetBSD: Makefile,v 1.1 2002/06/22 17:11:36 grant Exp $
#       Process .list files into .html files

all:  index.html NetBSD-1.6.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -c NetBSD-1.6 $< $@
