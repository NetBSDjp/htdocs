#	$NetBSD: Makefile,v 1.2 2001/02/24 22:21:06 dent Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -a next68k $< $@
