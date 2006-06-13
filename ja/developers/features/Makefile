# $NetBSD: Makefile,v 1.4 2004/02/28 05:09:10 grant Exp $

AWK=awk

all: index.html
index.html: pre table post gentab.awk
	(cat pre; $(AWK) -f gentab.awk <table; cat post) >index.html

clean:
	rm -f index.html
