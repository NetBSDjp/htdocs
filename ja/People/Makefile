#	$NetBSD: $

supporting-cast.html: mkdevht supporting-cast.data supporting-cast.head supporting-cast.tail
	./mkdevht

mkdevht: mkdevht.c
	gcc -O2 -o mkdevht mkdevht.c

clean:
	rm -f mkdevht
