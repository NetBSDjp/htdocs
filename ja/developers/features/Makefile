# $NetBSD: Makefile,v 1.4 2004/02/28 05:09:10 grant Exp $
# <!-- Based on english version: -->
# <!-- NetBSD: Makefile,v 1.4 2004/02/28 05:09:10 grant Exp   -->

AWK=awk

all: index.html
index.html: pre table post gentab.awk
	(cat pre; iconv -f iso-2022-jp -t euc-jp < table | $(AWK) -f gentab.awk ; cat post) | iconv -f euc-jp -t iso-2022-jp >index.html

clean:
	rm -f index.html
