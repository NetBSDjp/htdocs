# $NetBSD: Makefile,v 1.2 2002/08/01 20:26:01 jschauma Exp $
# Nasty makefile to recurse into subdirs to ensure faq files are up to date

all::	serial.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../../list2html.pl $< $@
