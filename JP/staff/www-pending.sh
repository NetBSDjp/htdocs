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
X	<TABLE BORDER="1">
X	<TR><TH>ファイル <TH>CVS <TH>原文 <TH>翻訳者
_EOF_

awk '/^[^#]/ && $3 == "NOT-YET" {
    printf "<TR><TD><A HREF=\"../../%s\">%s</a>\n", $1, $1
    printf "    <TD><A HREF=\"http://www.jp.netbsd.org/cgi-bin/cvsweb.cgi/htdocs/ja/%s\">CVS</A>\n", $1
    printf "    <TD><A HREF=\"http://www.jp.netbsd.org/%s\">原文</A>\n", $1
    printf "    <TD>%s\n", $2
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</TABLE>
X	
X	<H2>登録判断待ちファイル</H2>
X	<TABLE BORDER="1">
X	<TR><TH>ファイル <TH>CVS <TH>原文 <TH>翻訳者 <TH>査読者
_EOF_

awk '/^[^#]/ && $3 != "" && $3 != "NOT-YET" && $3 !~ ",DONE$" {
    printf "<TR><TD><A HREF=\"../../%s\">%s</a>\n", $1, $1
    printf "    <TD><A HREF=\"http://www.jp.netbsd.org/cgi-bin/cvsweb.cgi/htdocs/ja/%s\">CVS</A>\n", $1
    printf "    <TD><A HREF=\"http://www.jp.netbsd.org/%s\">原文</A>\n", $1
    printf "    <TD>%s\n", $2
    printf "    <TD>%s\n", $3
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</TABLE>
X	
X	<HR>
X	<H2>翻訳中のファイル</H2>
X	<TABLE BORDER="1">
X	<TR><TH>ファイル <TH>原文 <TH>翻訳者
_EOF_

awk '/^[^#]/ && $2 != "" && $3 == "" {
    printf "<TR><TD><A HREF=\"../../%s\">%s</a>\n", $1, $1
    printf "    <TD><A HREF=\"http://www.jp.netbsd.org/%s\">原文</A>\n", $1
    printf "    <TD>%s\n", $2
}' translation-assign.txt

sed 's/^X	//' << '_EOF_'
X	</TABLE>
X	</BODY>
X	</HTML>
_EOF_
