#	$NetBSD: Makefile,v 1.1 2007/06/09 12:43:39 dsieger Exp $

XMLDOCS+=	index:index.xsl:index.xml:index.html
PARAMS.index+=	--stringparam autolayout-file ${AUTOLAYOUTFILE}
DEPENDS.index+=	list2group.xsl

.include "../share/mk/web.site.mk"
