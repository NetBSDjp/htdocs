# $NetBSD: Makefile,v 1.3 2002/08/01 20:25:26 jschauma Exp $
# Nasty makefile to recurse into subdirs to ensure faq files are up to date

all:	branch.html notes.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl $< $@
