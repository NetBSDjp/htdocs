#	$NetBSD: Makefile,v 1.1 2001/03/07 12:55:50 hubertf Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -a dreamcast $< $@
