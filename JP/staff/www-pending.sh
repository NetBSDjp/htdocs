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
    printf "   - 翻訳: %s\n", $2
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</UL>
X	
X	<H2>登録判断待ちファイル</H2>
X	<UL>
_EOF_

awk '/^[^#]/ && $3 != "" && $3 != "NOT-YET" && $3 !~ ",DONE$" {
    printf "<LI><A HREF=\"../../../ja/%s\">%s</a>\n", $1, $1
    printf "   (<A HREF=\"http://www.jp.netbsd.org/%s\">原文</A>)\n", $1
    printf "   - 翻訳: %s, 査読: %s\n", $2, $3
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</UL>
X	
X	<HR>
X	<H2>翻訳中のファイル</H2>
X	<UL>
_EOF_

awk '/^[^#]/ && $2 != "" && $3 == "" {
    printf "<LI><A HREF=\"http://www.jp.netbsd.org/%s\">%s (原文)</a>\n", $1, $1
    printf "   - 翻訳: %s\n", $2
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</UL>
X	</BODY>
X	</HTML>
_EOF_
