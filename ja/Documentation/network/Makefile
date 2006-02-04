#	$NetBSD: Makefile,v 1.7 2002/08/01 20:25:57 jschauma Exp $
#	<!-- Based on english version: -->
#	<!-- NetBSD: Makefile,v 1.7 2002/08/01 20:25:57 jschauma Exp   -->
#	Process .list files into .html files

all::	wavelan.html gprs.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl $< $@
