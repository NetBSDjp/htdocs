#	$NetBSD: Makefile,v 1.3 1999/05/12 07:02:36 abs Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -a i386 $< $@
