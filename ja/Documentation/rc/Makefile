#	$NetBSD: Makefile,v 1.1 2001/07/28 00:01:36 jrf Exp $
#	Process .list files into .html files

all:	index.html	

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -c NetBSD-current $< $@
