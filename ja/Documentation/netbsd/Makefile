# $NetBSD: Makefile,v 1.1 1999/09/28 21:24:01 cjones Exp $
# Nasty makefile to recurse into subdirs to ensure faq files are up to date

all::	wscons.html

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
