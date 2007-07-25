#	$NetBSD: Makefile,v 1.3 2007/06/17 15:11:49 pavel Exp $
#	<!-- Based on english version: -->
#	<!-- NetBSD: Makefile,v 1.3 2007/06/17 15:11:49 pavel Exp   -->

# SUBDIR+=	pages
SUBDIR+=	groups

XMLDOCS+=	core
XMLDOCS+=	index

# index.xsl should rather be called developers.xsl...
XMLDOCS+=		developers:index.xsl,docbook-website::
XMLDOCS+=		port-maintainers:index.xsl,docbook-website::
XMLDOCS+=		supporting-cast:index.xsl,docbook-website::

developers.html: developerdb.xml

.include "../../share/mk/web.site.mk"
