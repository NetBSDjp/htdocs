# $NetBSD: Makefile,v 1.3 2002/02/14 03:22:23 jschauma Exp $
# Nasty makefile to recurse into subdirs to ensure faq files are up to date

all:	index

subdirs:
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

index: index.html

index.html: gallery/events.html Changes/index.html
	./makeindex.sh
	
gallery/events.html: gallery/events.list
	cd gallery; make events.html; cd ..;

Changes/index.html: Changes/index.list
	cd Changes; make; cd ..;


