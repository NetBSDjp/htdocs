#	$NetBSD: Makefile,v 1.4 2001/05/21 01:43:16 mbw Exp $
#	Process .list files into .html files

all:	faq.html x11.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -a macppc $< $@
