#	$NetBSD: Makefile,v 1.6 2002/02/14 03:22:23 jschauma Exp $
#       Process .list files into .html files

all:	index.html
	cd ..; make index; cd Changes;

.SUFFIXES:	.list .html

.list.html:
	../list2html.pl $< $@
