#	$NetBSD: Makefile,v 1.3 1999/04/23 01:53:07 abs Exp $
#	Process .list files into .html files

all:	cdroms.html

.SUFFIXES:	.list .html

.list.html:
	../list2html.pl $< $@
