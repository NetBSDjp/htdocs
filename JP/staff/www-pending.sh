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
X	<H2>査読待ちファイル</H2>
X	<UL>
_EOF_

awk '/^[^#]/ && $3 == "NOT-YET" {
    printf "<LI><A HREF=\"../../../ja/%s\">%s</a>\n", $1, $1
    printf "   (<A HREF=\"http://www.jp.netbsd.org/%s\">原文</A>)\n", $1
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</UL>
X	
X	<H2>登録判断待ちファイル</H2>
X	<UL>
_EOF_

awk '/^[^#]/ && $3 != "" && $3 != "NOT-YET" {
    printf "<LI><A HREF=\"../../../ja/%s\">%s</a>\n", $1, $1
    printf "   (<A HREF=\"http://www.jp.netbsd.org/%s\">原文</A>)\n", $1
    printf "   - 査読: %s\n", $3
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</UL>
X	</BODY>
X	</HTML>
_EOF_
