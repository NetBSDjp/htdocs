#	$NetBSD: Makefile,v 1.5 2000/05/17 11:57:43 blymn Exp $
#	Process .list files into .html files

all::	index.html programming.html uvm.html kgdb.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done


.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
