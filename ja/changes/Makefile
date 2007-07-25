#	$NetBSD: Makefile,v 1.1 2007/06/08 17:00:26 dsieger Exp $
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
XMLDOCS+=	index

all:	index.html
	cd .. && ${MAKE} regenerate-index
	@echo "Index regeneration complete - time to 'make commit'"

update:
	cd .. && ${MAKE} update

commit:
	cd .. && ${MAKE} commit

.include "../share/mk/web.site.mk"
