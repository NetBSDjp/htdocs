#	$NetBSD: Makefile,v 1.4 2007/12/18 21:47:09 weinem Exp $

XMLDOCS+=	index
XMLDOCS+=	NetBSD-4.0:announcement.xsl,docbook-website::

#changes.mdoc is a fragment to be pasted to src/distrib/notes/common/main,
#do not commit it directly
XMLDOCS+=	relnotes:changes2relnotes.xsl:NetBSD-4.0.xml:changes.mdoc

.include "../../share/mk/web.site.mk"
