# $NetBSD: Makefile,v 1.5 2000/03/25 18:09:25 dmcmahill Exp $
# Nasty makefile to recurse into subdirs to ensure faq files are up to date

all::	books.html elf.html bootcd.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

.SUFFIXES:	.list .html

.list.html:
	../list2html.pl $< $@
