#	$NetBSD: Makefile,v 1.4 2002/08/01 20:25:36 jschauma Exp $
#	Process .list files into .html files

all:	cdroms.html

.SUFFIXES:	.list .html

.list.html:
	perl ../list2html.pl $< $@
