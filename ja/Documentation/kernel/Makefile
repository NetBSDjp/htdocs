#	$NetBSD: Makefile,v 1.3 1999/05/13 05:14:36 abs Exp $
#	Process .list files into .html files

all:	index.html programming.html uvm.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
