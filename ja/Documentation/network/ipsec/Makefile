#	$NetBSD: Makefile,v 1.4 2002/08/01 20:25:56 jschauma Exp $
#	Process .list files into .html files

all:	index.html oldtree.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../../list2html.pl -c NetBSD-current $< $@
