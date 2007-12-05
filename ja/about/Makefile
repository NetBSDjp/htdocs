#	$NetBSD: Makefile,v 1.3 2007/12/05 15:26:13 kano Exp $

XMLDOCS+=	call-it-a-duck 
XMLDOCS+=	crypto-export
XMLDOCS+=	disclaimer
XMLDOCS+=	embed
XMLDOCS+=	features
XMLDOCS+=	history
XMLDOCS+=	index
XMLDOCS+=	interop 
XMLDOCS+=	portability 
XMLDOCS+=	redistribution
XMLDOCS+=	standards 
XMLDOCS+=	system
XMLDOCS+=	roadmap

DEPENDS.roadmap+=	escape-cvs-tags

ROADMAPTAGS=	NetBSD

escape-cvs-tags:	ROADMAP
.for tag in ${ROADMAPTAGS}
	sed -e 's/^\(.*\)\$$\(${tag}.*\)\$$\(.*\)$$/\1%\2%\3/g' ROADMAP > ROADMAP.tmp && mv -f ROADMAP.tmp ROADMAP
.endfor

.include "../share/mk/web.site.mk"
