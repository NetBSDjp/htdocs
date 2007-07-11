# $NetBSD: Makefile,v 1.1 2007/06/09 13:32:33 dsieger Exp $
# <!-- Based on english version: -->
# <!-- NetBSD: Makefile,v 1.1 2007/06/09 13:32:33 dsieger Exp   -->

DOCLANG=        ja
XML_ENCODING=   EUC-JP
SP_ENCODING=    EUC-JP
SX_ENCODING=    EUC-JP

# Do not use Tidy
NO_TIDY= YES

DOC=	netbsd-mac68k

SRCS+=	preface.xml
SRCS+=	netbsd-mac68k.xml
SRCS+=  chap-intro.xml
SRCS+=  chap-features.xml
SRCS+=  chap-bugs.xml
SRCS+=  chap-probs.xml
SRCS+=  chap-software.xml
SRCS+=  chap-porting-tips.xml
SRCS+=  chap-other-os.xml
SRCS+=  chap-other-netbsd.xml

SRCS+=	chapters.ent

# Make deeper TOC:
XSL_DBX_WITH_TOC_SECTION_DEPTH?= 2

# Reuse stuff from The NetBSD Guide.
CATALOGS+=              ../../../../guide/en/share/catalog
DSSSL?=                 ../../../../guide/en/share/default.dsl
XSLT_LOCAL_SINGLE?=     ../../../../guide/en/share/default-html.xsl
XSLT_LOCAL_SPLIT?=      ../../../../guide/en/share/default-html-chunk.xsl

all:    # doing this as depends doesn't work
	${MAKE} lint
	-${MAKE} html-split
	-${MAKE} html 

.include "../../../../share/mk/doc.docbook.mk"
