#	$NetBSD: README.txt,v 1.4 2011/09/01 10:18:47 ryoon Exp $
#	<!-- Based on english version: -->
#	<!-- NetBSD: README.txt,v 1.8 2006/07/29 17:58:42 rillig Exp   -->

単純な変更の場合は www@NetBSD.org にメールすることもできます。
(訳注:日本語のウェブページを変更した場合は www@jp.NetBSD.org にメールしてください)

ウェブページを編集して更新する方法が以下に書いてあります。

http://www.jp.netbsd.org/developers/htdocs.html

(このファイルはCVSリポジトリーの htdocs/developers/htdocs.htmlにあります)

=== 実装の詳細===

カレントディレクトリー(訳注: 編集対象のファイルがあるディレクトリ)からWEB_PREFIX(通常は htdocs/ ディレクトリー)の間にある全ての Makefile.inc ファイルはweb.site.mkファイルによって自動的にインクルードされます。つまり、自分で Makefile.incファイルをインクルードすべきではありません。

新しい XML ファイルを追加するときは、htdocs/layout.xml にエントリーを追加してください。
