#	$NetBSD: Makefile,v 1.5 2002/08/01 20:25:16 jschauma Exp $
#       Process .list files into .html files

all:	index.html
	cd ..; make index; cd Changes;

.SUFFIXES:	.list .html

.list.html:
	perl ../list2html.pl $< $@
