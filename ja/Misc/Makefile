#	$NetBSD: Makefile,v 1.2 2001/07/13 22:43:19 jrf Exp $
#       Process .list files into .html files

all:  features.html embed.html

.SUFFIXES:	.data .list .html

.list.html:
	../list2html.pl $< $@
