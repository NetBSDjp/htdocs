#	$NetBSD: Makefile,v 1.5 1999/12/16 20:32:00 dmcmahill Exp $
#	Process .list files into .html files

all::	index.html wavelan.html dhcp.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
