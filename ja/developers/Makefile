# $NetBSD: Makefile,v 1.4 2002/08/01 20:24:57 jschauma Exp $
# Nasty makefile to recurse into subdirs to ensure faq files are up to date

all::	PR.html announce.html groups.html htdocs.html gnats-admin.html \
	kernel-profiling.html new-port.html notes.html pkg-import.html \
	security.html style.html www.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

.SUFFIXES:	.list .html

.list.html:
	perl ../list2html.pl $< $@
