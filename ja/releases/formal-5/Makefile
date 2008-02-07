#	$NetBSD: Makefile,v 1.2 2008/02/07 07:34:31 jnemeth Exp $

XMLDOCS+=	index
XMLDOCS+=	NetBSD-5.0:announcement.xsl,docbook-website::

#changes.mdoc is a fragment to be pasted to src/distrib/notes/common/main,
#do not commit it directly
XMLDOCS+=	relnotes:changes2relnotes.xsl:changes.xml:changes.mdoc

.include "../../share/mk/web.site.mk"
