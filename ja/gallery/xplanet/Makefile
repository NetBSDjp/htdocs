#	$NetBSD: Makefile,v 1.2 2006/09/22 08:59:29 rillig Exp $

XMLDOCS+=	index

PLACES=	NYC USeastern bay europe japan london oz us world
PNGS=	${PLACES:@.p.@xplanet-${.p.}-small.png xplanet-${.p.}.png@}

CLEANFILES=	${PNGS}

.include "../../share/mk/web.prefs.mk"

.if !empty(NBWWW:M[yY][eE][sS])
all: index.html
.else
all: index.html update

update: check-setup ${PNGS}

${PNGS}: netbsd.markers
	sh update-images

check-setup:
	@pkg_info -qe ImageMagick || ( echo "install pkgsrc/graphics/ImageMagick for convert" ; exit 1 ) 
	@pkg_info -qe xplanet || ( echo "install pkgsrc/x11/xplanet" ; exit 1 )
.endif

.include "../../share/mk/web.site.mk"
