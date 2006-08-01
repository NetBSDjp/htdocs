# $NetBSD: Makefile,v 1.78 2006/08/01 08:55:00 rillig Exp $

SUBDIR=		Changes
SUBDIR+=	Documentation
SUBDIR+=	Foundation
SUBDIR+=	Goals
SUBDIR+=	Hardware
SUBDIR+=	MailingLists
SUBDIR+=	Misc
SUBDIR+=	Releases
SUBDIR+=	People
SUBDIR+=	Ports
SUBDIR+=	Security
SUBDIR+=	Sites
SUBDIR+=	contrib
SUBDIR+=	developers
SUBDIR+=	donations
SUBDIR+=	errors
SUBDIR+=	gallery
SUBDIR+=	mirrors
SUBDIR+=	releng

DATA+=		.htaccess

NEWS_LANGS=	   cs de es et fr ja ko lt nl pl pt_PT pt_BR ru sv zh_CN zh_TW
DOCLANGS=	bg cs de es et fr ja ko lt nl pl pt_PT pt_BR ru sv zh_CN zh_TW
AUTOLAYOUTDIR=	${.CURDIR}
FILES=	gallery/events.* layout.xml

.for l in ${NEWS_LANGS}
SUBDIR+=	${l}
.  if (exists(${l}/Changes/index.list))
FILES+=${l}/Changes/index.list ${l}/Changes/index.html
.  elif (exists(${l}/Changes/index.xml))
FILES+=${l}/Changes/index.xml ${l}/Changes/index.html
.  endif
.  if exists(${l}/index.html)
FILES+=${l}/index.html
.  endif
.endfor
FILES+=index.html Changes/index.xml Changes/index.html

# This target regenerates the news files in all language subdirectories.
regenerate-news:
.for lang in ${NEWS_LANGS} .
	cd ${lang} && ${MAKE} index.html
.endfor
	

update:
	cvs update -A ${FILES} makeindex.sh Makefile share

# This target commits the relevant files for news and events.
commit:
.if defined(MSG) && !empty(MSG)
	cvs commit -m '${MSG}' ${FILES}
.else
	cvs commit ${FILES}
.endif

# This target prints the changes in the news and events.
diff:
	cvs diff -bu ${FILES}

.include "share/mk/language.mk"
.include "share/mk/web.site.mk"
