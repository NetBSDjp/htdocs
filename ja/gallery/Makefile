#	$NetBSD: Makefile,v 1.20 2002/11/09 16:05:22 darcy Exp $
#	<!-- based on english translation: -->
#	<!-- NetBSD: Makefile,v 1.20 2002/11/09 16:05:22 darcy Exp   -->
#       Process .list files into .html files

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

