#	$NetBSD: Makefile,v 1.4 1999/10/26 15:19:43 abs Exp $
#	Process .list files into .html files

all::	donations.html howto.html hardware.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

.SUFFIXES:	.list .html

.list.html:
	../list2html.pl $< $@
