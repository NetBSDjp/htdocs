#       $NetBSD: Makefile,v 1.1 2000/02/23 12:37:43 itojun Exp $
#       Process .list files into .html files

all:index.html

.SUFFIXES: .list .html

.list.html:
	../../../list2html.pl $< $@
