#	$NetBSD: Makefile,v 1.4 2002/08/01 20:25:12 jschauma Exp $
#	Process .list files into .html files

all::	index.html programming.html uvm.html kgdb.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done


.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl $< $@
