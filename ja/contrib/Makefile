#	$NetBSD: Makefile,v 1.3 2002/08/01 20:24:58 jschauma Exp $
#	Process .list files into .html files

all::	donations.html howto.html hardware.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

.SUFFIXES:	.list .html

.list.html:
	perl ../list2html.pl $< $@
