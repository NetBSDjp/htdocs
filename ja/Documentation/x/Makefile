#	$NetBSD: Makefile,v 1.1.1.1 2001/11/10 09:17:57 kano Exp $
#	Process .list files into .html files

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
