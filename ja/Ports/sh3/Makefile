#	$NetBSD: Makefile,v 1.2 2001/01/08 11:06:05 itojun Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -a sh3 $< $@
