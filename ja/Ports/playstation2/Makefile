#	$NetBSD: Makefile,v 1.3 2001/11/18 13:45:19 hubertf Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl -a playstation2 $< $@
