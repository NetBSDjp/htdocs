# $NetBSD: Makefile,v 1.9 2000/09/19 11:38:47 dent Exp $
# Nasty makefile to recurse into subdirs to ensure faq files are up to date

all::	books.html bootcd.html compat.html elf.html mirror.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

.SUFFIXES:	.list .html

.list.html:
	../list2html.pl $< $@
