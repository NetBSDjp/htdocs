# $NetBSD: Makefile,v 1.12 2003/06/10 14:22:38 jschauma Exp $
# Nasty makefile to recurse into subdirs to ensure faq files are up to date

all::	books.html bootcd.html bootfloppy.html compat.html elf.html
all::	mirror.html updating.html vmware.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

.SUFFIXES:	.list .html

.list.html:
	perl ../list2html.pl $< $@
