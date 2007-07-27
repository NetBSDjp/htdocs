# $NetBSD: Makefile,v 1.96 2007/06/12 10:54:45 dsieger Exp $

SUBDIR=		about
SUBDIR+=	changes
SUBDIR+=	community
SUBDIR+=	contrib
SUBDIR+=	developers
SUBDIR+=	docs
SUBDIR+=	donations
SUBDIR+=	errors
SUBDIR+=	foundation
SUBDIR+=	gallery
SUBDIR+=	images
SUBDIR+=	mailinglists
SUBDIR+=	mirrors
SUBDIR+=	releases
SUBDIR+=	releng
SUBDIR+=	people
SUBDIR+=	ports
SUBDIR+=	sites
SUBDIR+=	support

DATA+=		.htaccess robots.txt

INDEX_LANGS=	   # cs de es et fr ja ko lt nl pl pt_BR ru sv zh_CN zh_TW
DOCLANGS=	bg cs de es et fr ja ko lt nl pl pt_BR ru sv zh_CN zh_TW
AUTOLAYOUTDIR=	${.CURDIR}
FILES=	gallery/events.xml gallery/events.html layout.xml

.for l in ${INDEX_LANGS}
SUBDIR+=	${l}
.  if (exists(${l}/changes/index.list))
FILES+=${l}/changes/index.list ${l}/changes/index.html
.  elif (exists(${l}/changes/index.xml))
FILES+=${l}/changes/index.xml ${l}/changes/index.html
.  endif
.  if exists(${l}/index.html)
FILES+=${l}/index.html
.  endif
.endfor
FILES+=index.html changes/index.xml changes/index.html

# This target regenerates the index files in all language subdirectories.
regenerate-index:
.for lang in ${INDEX_LANGS} .
	${RUN} cd ${lang} && ${MAKE} language-index
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

#
# Some simple integrity checks.
#

LINT_LAYOUT_SKIP_FILES=		docs/internals/*.xml
LINT_LAYOUT_SKIP_FILES+=	autolayout.xml
LINT_LAYOUT_SKIP_FILES+=	docs/guide/??/*.xml
LINT_LAYOUT_SKIP_FILES+=	layout.xml
LINT_LAYOUT_SKIP_FILES+=	pt_BR/Documentation/pkgsrc/*.xml
LINT_LAYOUT_SKIP_FILES+=	share/xml/*.xml

# The lint-layout target checks that all XML files are mentioned in the
# layout.xml file.
lint: lint-layout
.PHONY: lint-layout
lint-layout:
	${RUN} ${FIND} * -name '*.xml' -print				\
	| while read f; do						\
		case "$$f" in						\
		${LINT_LAYOUT_SKIP_FILES:@.m.@${.m.}) continue;;@}	\
		esac;							\
		${FGREP} -q "\"$$f\"" layout.xml			\
		|| echo "WARNING: [lint-layout] \"$$f\" is not mentioned in layout.xml." 1>&2; \
	done

.include "share/mk/language.mk"
.include "share/mk/web.site.mk"
