#	$NetBSD: Makefile,v 1.8 2003/01/10 00:37:41 jschauma Exp $

all: subdirs supporting-cast.html

subdirs:
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
		echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

supporting-cast.html: mkdevht supporting-cast.data supporting-cast.head supporting-cast.tail 
	./mkdevht ./supporting-cast.data
	cd ../de/People/ && make && cd ../../People
	cd ../se/People && make && cd ../../People

mkdevht: mkdevht.c
	gcc -Wall -O2 -o mkdevht mkdevht.c

clean:
	rm -f mkdevht
