#	$NetBSD: Makefile,v 1.2 2002/08/01 20:25:07 jschauma Exp $
#       Process .list files into .html files

all:  features.html embed.html

.SUFFIXES:	.data .list .html

.list.html:
	perl ../list2html.pl $< $@
