#	$NetBSD: Makefile,v 1.1 2001/09/21 18:38:08 tsutsui Exp $
#	Process .list files into .html files

all:	faq.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
