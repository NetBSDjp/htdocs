# $NetBSD: Makefile,v 1.11 2000/09/09 07:47:07 dent Exp $
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
	../list2html.pl $< $@
