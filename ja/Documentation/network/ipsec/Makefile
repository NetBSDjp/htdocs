#	$NetBSD: Makefile,v 1.3 2001/06/06 22:50:45 kim Exp $
#	Process .list files into .html files

all:	index.html oldtree.html

.SUFFIXES:	.list .html

.list.html:
	../../../list2html.pl -c NetBSD-current $< $@
