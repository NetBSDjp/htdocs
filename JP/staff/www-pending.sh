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
X	<TABLE BORDER="1">
X	<TR><TH>$B%U%!%$%k(B <TH>CVS <TH>$B86J8(B <TH>$BK]Lu<T(B
_EOF_

awk '/^[^#]/ && $3 == "NOT-YET" {
    printf "<TR><TD><A HREF=\"../../%s\">%s</a>\n", $1, $1
    printf "    <TD><A HREF=\"http://www.jp.netbsd.org/cgi-bin/cvsweb.cgi/htdocs/ja/%s\">CVS</A>\n", $1
    printf "    <TD><A HREF=\"http://www.jp.netbsd.org/%s\">$B86J8(B</A>\n", $1
    printf "    <TD>%s\n", $2
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</TABLE>
X	
X	<H2>$BEPO?H=CGBT$A%U%!%$%k(B</H2>
X	<TABLE BORDER="1">
X	<TR><TH>$B%U%!%$%k(B <TH>CVS <TH>$B86J8(B <TH>$BK]Lu<T(B <TH>$B::FI<T(B
_EOF_

awk '/^[^#]/ && $3 != "" && $3 != "NOT-YET" && $3 !~ ",DONE$" {
    printf "<TR><TD><A HREF=\"../../%s\">%s</a>\n", $1, $1
    printf "    <TD><A HREF=\"http://www.jp.netbsd.org/cgi-bin/cvsweb.cgi/htdocs/ja/%s\">CVS</A>\n", $1
    printf "    <TD><A HREF=\"http://www.jp.netbsd.org/%s\">$B86J8(B</A>\n", $1
    printf "    <TD>%s\n", $2
    printf "    <TD>%s\n", $3
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</TABLE>
X	
X	<HR>
X	<H2>$BK]LuCf$N%U%!%$%k(B</H2>
X	<TABLE BORDER="1">
X	<TR><TH>$B%U%!%$%k(B <TH>$B86J8(B <TH>$BK]Lu<T(B
_EOF_

awk '/^[^#]/ && $2 != "" && $3 == "" {
    printf "<TR><TD><A HREF=\"../../%s\">%s</a>\n", $1, $1
    printf "    <TD><A HREF=\"http://www.jp.netbsd.org/%s\">$B86J8(B</A>\n", $1
    printf "    <TD>%s\n", $2
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</TABLE>
X	</BODY>
X	</HTML>
_EOF_
