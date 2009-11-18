#	$NetBSD: README.txt,v 1.1 2009/11/18 03:49:06 jun Exp $

メールで簡単な変更を www@jp.NetBSD.org に提出できます。

ウェブページを編集して更新する方法が以下に書いてあります。

http://www.jp.netbsd.org/developers/htdocs.html

(このファイルはCVSリポジトリーの htdocs/developers/htdocs.htmlにあります)

=== 実装の詳細===

カレントディレクトリーにある全てのMakefile.incは1つ上のWEB_PREFIX(通常このhtdocs/
ディレクトリー)にあるweb.site.mkファイルによって自動的に取り込まれます。

新しいXMLファイルを加えるとき、あなたはhtdocs/layout.xmlにエントリーを加えなければなりません。
