#	$NetBSD: Makefile,v 1.6 2002/03/21 10:10:45 hubertf Exp $
#	Process .list files into .html files

all::	index.html wavelan.html dhcp.html gprs.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
