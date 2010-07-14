#	$NetBSD: Makefile,v 1.5 2010/03/21 18:21:00 jschauma Exp $
#
# Please run 'make update' before adding NEWS.

XMLDOCS+=	000804
XMLDOCS+=	rss
XMLDOCS+=	1998
XMLDOCS+=	1999
XMLDOCS+=	2000
XMLDOCS+=	2001
XMLDOCS+=	2002
XMLDOCS+=	2003
XMLDOCS+=	2004
XMLDOCS+=	2005
XMLDOCS+=	2006
XMLDOCS+=	2007
XMLDOCS+=	2008
XMLDOCS+=	2009
XMLDOCS+=	index

all:	index.html
	cd .. && ${MAKE} index.html
	@echo "Index regeneration complete - time to 'make commit'"

update:
	cd .. && ${MAKE} update

commit:
	cd .. && ${MAKE} commit

.include "../share/mk/web.site.mk"
