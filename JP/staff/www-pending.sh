#!/bin/sh

exec >www-pending.html

sed 's/^X	//' << '_EOF_'
X	<HTML>
X	<HEAD>
X	<TITLE>WWW pending contents</TITLE>
X	</HEAD>
X	
X	<BODY>
X	
X	<H2>$B::FIBT$A%U%!%$%k(B</H2>
X	<UL>
_EOF_

awk '/^[^#]/ && $3 == "NOT-YET" {
    printf "<LI><A HREF=\"../../../ja/%s\">%s</a>\n", $1, $1
    printf "   (<A HREF=\"http://www.jp.netbsd.org/%s\">$B86J8(B</A>)\n", $1
    printf "   - $BK]Lu(B: %s\n", $2
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</UL>
X	
X	<H2>$BEPO?H=CGBT$A%U%!%$%k(B</H2>
X	<UL>
_EOF_

awk '/^[^#]/ && $3 != "" && $3 != "NOT-YET" && $3 !~ ",DONE$" {
    printf "<LI><A HREF=\"../../../ja/%s\">%s</a>\n", $1, $1
    printf "   (<A HREF=\"http://www.jp.netbsd.org/%s\">$B86J8(B</A>)\n", $1
    printf "   - $BK]Lu(B: %s, $B::FI(B: %s\n", $2, $3
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</UL>
X	
X	<HR>
X	<H2>$BK]LuCf$N%U%!%$%k(B</H2>
X	<UL>
_EOF_

awk '/^[^#]/ && $2 != "" && $3 == "" {
    printf "<LI><A HREF=\"http://www.jp.netbsd.org/%s\">%s ($B86J8(B)</a>\n", $1, $1
    printf "   - $BK]Lu(B: %s\n", $2
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</UL>
X	</BODY>
X	</HTML>
_EOF_
