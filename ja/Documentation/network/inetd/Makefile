#	$NetBSD: Makefile,v 1.2 2002/08/01 20:25:57 jschauma Exp $
#	<!-- based on english translation: -->
#	<!-- NetBSD: Makefile,v 1.2 2002/08/01 20:25:57 jschauma Exp   -->

all:	index.html

.SUFFIXES:	.list .html

.list.html:
	perl ../../../list2html.pl -c NetBSD-current $< $@
