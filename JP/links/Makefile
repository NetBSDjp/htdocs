#	$Id: Makefile,v 1.3 1999/04/19 07:46:04 sakamoto Exp $

all:	links.html arch.html books.html

links.html arch.html:	mklinks.pl links.data
	./mklinks.pl < links.data

books.html: mkbooks.pl books.data
	./mkbooks.pl < books.data
