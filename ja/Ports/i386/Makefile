#	$NetBSD: Makefile,v 1.5 2001/04/09 00:24:32 dent Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -a i386 $< $@
