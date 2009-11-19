#	$NetBSD: README.txt,v 1.2 2009/11/19 14:32:27 kano Exp $
#	<!-- Based on english version: -->
#	<!-- NetBSD: README.txt,v 1.8 2006/07/29 17:58:42 rillig Exp   -->

メールで簡単な変更を www@jp.NetBSD.org に提出できます。

ウェブページを編集して更新する方法が以下に書いてあります。

http://www.jp.NetBSD.org/developers/htdocs.html

(このファイルはCVSリポジトリーの htdocs/developers/htdocs.htmlにあります)

=== 実装の詳細===

カレントディレクトリーにある全てのMakefile.incは1つ上のWEB_PREFIX(通常このhtdocs/
ディレクトリー)にあるweb.site.mkファイルによって自動的に取り込まれます。

新しいXMLファイルを加えるとき、あなたはhtdocs/layout.xmlにエントリーを加えなければなりません。
