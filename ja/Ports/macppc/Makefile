#	$NetBSD: Makefile,v 1.6 2004/04/18 22:51:21 mbw Exp $
#	<!-- Based on english version: -->
#	<!-- NetBSD: Makefile,v 1.6 2004/04/18 22:51:21 mbw Exp   -->
#	Process .list files into .html files

all:	faq.html oldfaq.html x11.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl -a macppc $< $@
