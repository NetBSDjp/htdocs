# $NetBSD: Makefile,v 1.18 2002/11/09 21:54:55 jschauma Exp $
# Nasty makefile to recurse into subdirs to ensure faq files are up to date

all::	PR.html announce.html htdocs.html gnats-admin.html translate.html \
	translate-german.html translate-french.html translate-spanish.html \
	mirrors.html new-port.html notes.html security.html style.html www.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

.SUFFIXES:	.list .html

.list.html:
	perl ../list2html.pl $< $@
