#	$NetBSD: Makefile,v 1.6 2002/06/15 04:16:23 mason Exp $

supporting-cast.html: mkdevht supporting-cast.data supporting-cast.head supporting-cast.tail 
	./mkdevht ./supporting-cast.data
	cd ../de/People/ && make

mkdevht: mkdevht.c
	gcc -Wall -O2 -o mkdevht mkdevht.c

clean:
	rm -f mkdevht
