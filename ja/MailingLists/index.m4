divert(-1)dnl
#	$NetBSD: index.m4,v 1.95 2001/04/02 13:51:35 fvdl Exp $
#	Copyright (c) 1994-2001
#	    The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED.
# http://mail-index.netbsd.org/

undefine(`index')

define(`LISTARCHIVE',
`  <a href="http://mail-index.netbsd.org/$1/"><img src="/images/misc/tape.gif" origlink="../images/misc/tape.gif" align="bottom" border="0" width="29" height="29" alt="[View archive]"></a>
</td><td valign=top>')

define(`LISTSUBSCRIBE',
`  <a href="http://www.NetBSD.org/cgi-bin/subscribe_list.pl?list=$1"><img src="/images/misc/envelope.gif" origlink="../images/misc/envelope.gif" align="bottom" border="0" width="29" height="29" alt="[Subscribe]"></a>
</td><td valign=top>')

define(`LISTPREHEADER',
`divert(5)<table border=0 cellspacing=5 cellpadding=0><tr><td valign=top>')

define(`LISTHEADER',
`  <a name="$1"><b>$1:</b></a><br>')

define(`PORTLISTHEADER',
`  <a name="$1"><b>$1:</b></a> <a href="../Ports/substr($1,5)/">(homepage)</a><br>')

define(`LISTSECTION',
`<center><h3>$1</h3></center>
divert(5)<h3>$1</h3>

divert(0)dnl')

define(`LIST',
`    <li><a href="#$1">$1</a>
LISTPREHEADER
LISTSUBSCRIBE($1)
LISTARCHIVE($1)
LISTHEADER($1)')

define(`PORTLIST',
`    <li><a href="#$1">$1</a>
LISTPREHEADER
LISTSUBSCRIBE($1)
LISTARCHIVE($1)
PORTLISTHEADER($1)')

define(`OLDLIST',
`    <li><a href="#$1">$1</a>
LISTPREHEADER
LISTARCHIVE($1)
LISTHEADER($1)')

define(`ENDLIST', `</td></tr></table>

divert(0)dnl')

# here we go!!!
divert(0)dnl
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">

<html>
<head>
<!-- Copyright (c) 1994-2001
	The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED. -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-2022-jp">
<link rev="made" href="mailto:www@JP.NetBSD.ORG">
<title>NetBSD Mailing Lists</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">

<h1><img src="/images/NetBSD-flag.gif" origlink="../images/NetBSD-flag.gif"
align="middle" width="91" height="42" alt="NetBSD"> メールサーバーへのゲートウェイ</h1>

<p>
(訳註: ここで説明しているのは本家のメーリングリストです。日本語のメーリングリストについては <a href="http://www.jp.netbsd.org/ja/JP/ml.html">日本語メーリングリストのページ</a>を見てください。)
<p>

NetBSD プロジェクトでは、 NetBSD ユーザーと開発者が容易にやりとりできるよう、
さまざまな公開メーリングリストを用意しています。
メーリングリストはすべて、メーリングリスト管理パッケージ <b>Majordomo</b>
でサービスされており、 <i>majordomo@NetBSD.ORG</i> に空のメールを出すと、
NetBSD プロジェクトの Majordomo の使い方がわかるようになっています。
<p>

この WWW ページでは、各メーリングリストについて説明しているほか、
メーリングリストのアーカイブの閲覧、
さらにはメーリングリストの講読手続きもできるようになっています。
このページは、三つの部分に分かれています:
この導入部分;
すぐに見つけられるよう<a href="#index">メーリングリストの索引</a>;
そして、<a href="#descriptions">各メーリングリストの説明</a>
─ここにはアーカイブと講読手続へのリンクもあります。
<p>

<b>メーリングリストを講読するには</b>、このページの説明の部分にある
リスト名の後のリンク
<img src="/images/misc/envelope.gif" origlink="../images/misc/envelope.gif" width="29" height="29"
alt="[Subscribe]"> をクリックします。
それからフォームに e-mail アドレスを記入してください。
<i>注意: この機能は、フォームに対応したブラウザーでのみ使えます。</i>
<p>

<b>メーリングリストから脱退するには</b>、講読手続きに使ったアドレスから<a
href="mailto:majordomo@netbsd.org">majordomo@netbsd.org</a> へ、本文に
<tt><b>unsubscribe <em>listname</em></b></tt> とだけ書いたメールを送ります。
<p>

<b>メーリングリストのアーカイブを見るには</b>、このページの説明の部分にある
リスト名の後のリンク
<img src="/images/misc/tape.gif" origlink="../images/misc/tape.gif" width="29" height="29"
alt="[View archive]"> をクリックします。これでメールアーカイブサーバー <a
href="http://mail-index.netbsd.org/">mail-index.netbsd.org</a>
を利用できます
(ネットワークアクセスとこのマシンのラックスペースを提供してくださった
<a href="http://www.isc.org/">ISC</a> と、
サイトの構築と保守をしてくださった
<a href="mailto:root@garbled.net">Tim Rightnour</a>
のおかげです) 。
このほか、メーリングリストのアーカイブは、
<a href="http://www.geocrawler.com/lists/3/NetBSD/">Geocrawler</a>
にもあります。
<p>

NetBSD のメーリングリストの多くは、普通の unmoderated なものですが、
管理者によって moderated にされるような状況がたまに起きることに
ご注意ください。

<h2>メーリングリストアーカイブの検索</h2>

検索可能な索引が、
<a href="http://mail-index.netbsd.org/">http://mail-index.netbsd.org/</a>
と <a href="http://www.geocrawler.com/lists/3/NetBSD/">Geocrawler</a>
にあります。

<h2><a name="index">The NetBSD Project のメーリングリスト</a></h2>

<table><tr><td valign=top>

  LISTSECTION(全般のリスト)

  <ul>
LIST(current-users)
  NetBSD-current ソースツリーの最新バージョンを使っている
  すべてのユーザーのための公開討論の場です。ソースツリー中のバグ等について
  語るのによい場所です。 NetBSD-current ツリーは常に変化しているので、
  投稿前に最新のツリーを確認するようにしてください。
ENDLIST
LIST(netbsd-advocacy)
  プロジェクトの進め方についての公開討論のためのメーリングリストです。
ENDLIST
LIST(netbsd-announce)
  NetBSD に関するお知らせのためのメーリングリストです。
ENDLIST
LIST(netbsd-bugs)
  NetBSD のバグに関する議論のためのメーリングリストです。
  <i>send-pr(1)</i> で送られたバグレポートはすべてここに流れます。
ENDLIST
LIST(netbsd-docs)
  NetBSD の文書に関する議論のためのメーリングリストです。
ENDLIST
LIST(netbsd-help)
  ユーザーが質問を寄せる一般的な場としてのメーリングリストです。
ENDLIST
LIST(netbsd-ports)
  NetBSD の移植作業をしている人や興味がある人のためのメーリングリストです。
ENDLIST
LIST(netbsd-users)
  さまざまな形で NetBSD を使う人達のための公開討論の場です。
  おおぜいの参加者がこのリストを読んでいます
  ─ここへはよく考えた上で投稿してください。
ENDLIST
LIST(pkgsrc-changes)
  <a
  href="../Documentation/software/packages.html">NetBSD
  パッケージコレクション</a> (pkgsrc) のすべての変更についての
  commit メッセージが流れるメーリングリストです。
  毎日、 24 時間分のすべての commit メッセージをまとめて送る、<a
  href="http://www.NetBSD.org/cgi-bin/subscribe_list.pl?list=pkgsrc-changes-digest">ダイジェスト
  版</a>もあります。
ENDLIST
LIST(source-changes)
  NetBSD ソースツリーのすべての変更についての commit メッセージが
  流れるメーリングリストです。
  毎日、 24 時間分のすべての commit メッセージをまとめて送る、<a
  href="http://www.NetBSD.org/cgi-bin/subscribe_list.pl?list=source-changes-digest">ダイジェスト
  版</a>もあります。
ENDLIST
LIST(tech-embed)
  組み込みシステム上の NetBSD の使用に関する議論用です。
ENDLIST
LIST(tech-install)
  インストールの過程に関する技術的事項の議論用です。
ENDLIST
LIST(tech-kern)
  カーネル全般に関する技術的事項の議論用です。
ENDLIST
LIST(tech-misc)
  他の tech-* リストのいずれにも該当しない技術的事項の議論用です。
ENDLIST
LIST(tech-net)
  NetBSD のネットワークサブシステムに関する技術的事項の議論用です。
ENDLIST
LIST(tech-perform)
  NetBSD のパフォーマンス、特にパフォーマンスの改良に関する議論用です。
ENDLIST
LIST(tech-pkg)
  NetBSD パッケージシステムに関する技術的事項の議論用です。
ENDLIST
LIST(tech-ports)
  NetBSD のさまざまなハードウェアへの移植に関する技術的事項の議論用です。
ENDLIST
LIST(tech-security)
  NetBSD のセキュリティーに関する技術的な議論用です。
ENDLIST
LIST(tech-crypto)
  NetBSD システムにおける暗号化に関する技術的な議論用です。このリストでは、
  米国向け (cryptosrc-us) と国際版 (cryptosrc-intl) のいずれの暗号化についても
  扱います。
ENDLIST
LIST(tech-smp)
  NetBSD のマルチプロセッサー対応に関する技術的事項の議論用です。
ENDLIST
LIST(tech-toolchain)
  toolchain に関する技術的な議論用です。
ENDLIST
LIST(tech-userlevel)
  POSIX 準拠、コンパイル環境など、さまざまな
  カーネル以外に関することの技術的事項の議論用です。
ENDLIST
LIST(tech-x11)
  NetBSD で使われる X11 ウィンドウシステムに関する議論用です。
ENDLIST
LIST(www-changes)
  NetBSD WWW サーバーのすべての変更についての
  commit メッセージが流れるメーリングリストです。
ENDLIST
  </ul>

</td><td valign=top>

LISTSECTION(機種別のリスト)

  <ul>
PORTLIST(port-alpha)
  Digital の Alpha AXP システム上の NetBSD (NetBSD/alpha) 固有の事項の
  議論用です。
ENDLIST
PORTLIST(port-amiga)
  NetBSD on Commodore の Amiga や MacroSystem の DraCo マシン上の
  NetBSD (NetBSD/amiga) 固有の事項の議論用です。
  Motorola 68k ベースのすべてのポートに関する質問のための
  <a href="#port-m68k">port-m68k</a> リストもあります。
  <br><small>(このリストは、 <i>amiga</i>、 <i>amiga-dev</i>、
  <i>amiga-x</i> の各リストにとってかわるものです)。</small>
ENDLIST
PORTLIST(port-arc)
  MIPS ベースで ARC firmware を持った PC 上の NetBSD (NetBSD/arc)
  固有の事項の議論用です。
  MIPS ベースのすべてのポートに関する質問のための
  <a href="#port-mips">port-mips</a> リストもあります。
ENDLIST
LIST(port-arm)
  ARM ベースの NetBSD ポートすべてに関する事項の議論用です。
  ポート別のリストがありますので、各ポートに固有の質問や情報は
  そちらをご利用ください:
  <a href="#port-arm26">port-arm26</a>、
  <a href="#port-arm32">port-arm32</a>、
  <a href="#port-hpcarm">port-hpcarm</a>。
ENDLIST
PORTLIST(port-arm26)
  ARM2 と ARM3 ベースのマシン上の NetBSD (NetBSD/arm26)
  固有の事項の議論用です。
  ARM ベースのすべてのポートに関する質問のための
  <a href="#port-arm">port-arm</a> リストもあります。
ENDLIST
PORTLIST(port-arm32)
  ARM と StrongARM 系マイクロプロセッサー上の NetBSD (NetBSD/arm32)
  固有の事項の議論用です。
  ARM ベースのすべてのポートに関する質問のための
  <a href="#port-arm">port-arm</a> リストもあります。
ENDLIST
PORTLIST(port-atari)
  NetBSD on Atari の TT030、 Falcon、 Hades マシン上の NetBSD (NetBSD/atari)
  固有の事項の議論用です。
  Motorola 68k ベースのすべてのポートに関する質問のための
  <a href="#port-m68k">port-m68k</a> リストもあります。
ENDLIST
PORTLIST(port-bebox)
  Be, Inc. の PowerPC ベースの BeBox コンピューター上の NetBSD (NetBSD/bebox)
  固有の事項の議論用です。
  PowerPC ベースのすべてのポートに関する質問のための
  <a href="#port-powerpc">port-powerpc</a> リストもあります。
ENDLIST
PORTLIST(port-cobalt)
  Cobalt Networks の MIPS ベースの Qube および RaQ コンピューター上の NetBSD
  (NetBSD/cobalt) 固有の事項の議論用です。
  MIPS ベースのすべてのポートに関する質問のための
  <a href="#port-mips">port-mips</a> リストもあります。
ENDLIST
PORTLIST(port-dreamcast)
  Sega Dreamcast 上の NetBSD (NetBSD/dreamcast) 固有の事項の議論用です。
  日立 Super-H (SH3/4) チップベースのすべてのポートに関する質問のための
  <a href="#port-sh3">port-sh3</a> リストもあります。
ENDLIST
PORTLIST(port-hp300)
  Hewlett-Packard の 9000/300 および 9000/400 シリーズのマシン上の NetBSD
  (NetBSD/hp300) 固有の事項の議論用です。
  Motorola 68k ベースのすべてのポートに関する質問のための
  <a href="#port-m68k">port-m68k</a> リストもあります。
ENDLIST
PORTLIST(port-hp700)
  Hewlett-Packard の 9000/700 HP-PA RISC マシン上の NetBSD (NetBSD/hp700)
  固有の事項の議論用です。
ENDLIST
PORTLIST(port-hpcarm)
  ARM ベースの Windows CE PDA マシン上の NetBSD (NetBSD/hpcarm)
  固有の事項の議論用です。
  ARM ベースのすべてのポートに関する質問のための
  <a href="#port-arm">port-arm</a> リストもあります。
ENDLIST
PORTLIST(port-hpcmips)
  MIPS ベースの Windows CE PDA マシン上の NetBSD (NetBSD/hpcmips)
  固有の事項の議論用です。
  MIPS ベースのすべてのポートに関する質問のための
  <a href="#port-mips">port-mips</a> リストもあります。
ENDLIST
PORTLIST(port-hpcsh)
  日立 Super-H (SH3/4) 系ベースの Windows CE PDA マシン上の NetBSD
  (NetBSD/hpcsh) 固有の事項の議論用です。
  日立 Super-H (SH3/4) チップベースのすべてのポートに関する質問のための
  <a href="#port-sh3">port-sh3</a> リストもあります。
ENDLIST
PORTLIST(port-i386)
  i386 以降の CPU を持つ IBM PC 互換機上の NetBSD (NetBSD/i386)
  固有の事項の議論用です。
ENDLIST
PORTLIST(port-luna68k)
  68k ベースの OMROM LUNA マシン上の NetBSD (NetBSD/luna68k)
  固有の事項の議論用です。
  Motorola 68k ベースのすべてのポートに関する質問のための
  <a href="#port-m68k">port-m68k</a> リストもあります。
ENDLIST
LIST(port-m68k)
  m68k ベースの NetBSD ポートすべてに関する事項の議論用です。
  ポート別のリストがありますので、各ポートに固有の質問や情報は
  そちらをご利用ください:
  <a href="#port-amiga">port-amiga</a>、
  <a href="#port-atari">port-atari</a>、
  <a href="#port-hp300">port-hp300</a>、
  <a href="#port-luna68k">port-luna68k</a>、
  <a href="#port-mac68k">port-mac68k</a>、
  <a href="#port-mvme68k">port-mvme68k</a>、
  <a href="#port-news68k">port-news68k</a>、
  <a href="#port-next68k">port-next68k</a>、
  <a href="#port-sun3">port-sun3</a>、
  <a href="#port-x68k">port-x68k</a>。
ENDLIST
PORTLIST(port-mac68k)
  Apple の m68k ベースの Macintosh マシン上の NetBSD (NetBSD/mac68k)
  固有の事項の議論用です。
  Motorola 68k ベースのすべてのポートに関する質問のための
  <a href="#port-m68k">port-m68k</a> リストもあります。
  <br><small>(このリストは、 <i>macbsd-general</i> と
  <i>macbsd-development</i> の各リストにとってかわるものです)</small>。
ENDLIST
PORTLIST(port-macppc)
  Apple の PowerPC ベースの Macintosh マシン上の NetBSD (NetBSD/macppc)
  固有の事項の議論用です。
  PowerPC ベースのすべてのポートに関する質問のための
  <a href="#port-powerpc">port-powerpc</a> リストもあります。
ENDLIST
LIST(port-mips)
  MIPS ベースの NetBSD ポートすべてに関する事項の議論用です。
  ポート別のリストがありますので、各ポートに固有の質問や情報は
  そちらをご利用ください:
  <a href="#port-arc">port-arc</a>、
  <a href="#port-cobalt">port-cobalt</a>、
  <a href="#port-hpcmips">port-hpcmips</a>、
  <a href="#port-mipsco">port-mipsco</a>、
  <a href="#port-newsmips">port-newsmips</a>、
  <a href="#port-pmax">port-pmax</a>、
  <a href="#port-sgimips">port-sgimips</a>。
ENDLIST
PORTLIST(port-mipsco)
  MIPS Computer Systems, Inc. 製品上の NetBSD (NetBSD/mipsco)
  固有の事項の議論用です。
  MIPS ベースのすべてのポートに関する質問のための
  <a href="#port-mips">port-mips</a> リストもあります。
ENDLIST
PORTLIST(port-mvme68k)
  Motorola の 68k VME ボードコンピューター上の NetBSD
  (NetBSD/mvme68k) 固有の事項の議論用です。
  Motorola 68k ベースのすべてのポートに関する質問のための
  <a href="#port-m68k">port-m68k</a> リストもあります。
ENDLIST
PORTLIST(port-newsmips)
  MIPS ベースの Sony NEWS システム上の NetBSD (NetBSD/newsmips)
  固有の事項の議論用です。
  MIPS ベースのすべてのポートに関する質問のための
  <a href="#port-mips">port-mips</a> リストもあります。
ENDLIST
PORTLIST(port-news68k)
  68k ベースの Sony NEWS システム上の NetBSD (NetBSD/news68k)
  固有の事項の議論用です。
  Motorola 68k ベースのすべてのポートに関する質問のための
  <a href="#port-m68k">port-m68k</a> リストもあります。
ENDLIST
PORTLIST(port-next68k)
  68k ベースの NeXT 「黒いハードウェア」上の NetBSD (NetBSD/next68k)
  固有の事項の議論用です。
  Motorola 68k ベースのすべてのポートに関する質問のための
  <a href="#port-m68k">port-m68k</a> リストもあります。
ENDLIST
PORTLIST(port-ofppc)
  OpenFirmware PowerPC システム上の NetBSD (NetBSD/ofppc)
  固有の事項の議論用です。
  PowerPC ベースのすべてのポートに関する質問のための
  <a href="#port-powerpc">port-powerpc</a> リストもあります。
ENDLIST
PORTLIST(port-pc532)
  珍しい PC532 コンピューター上の NetBSD (NetBSD/pc532)
  固有の事項の議論用です。
ENDLIST
PORTLIST(port-pmax)
  Digital の MIPS ベースの DECstation および DECsystem マシン上の NetBSD
  (NetBSD/pmax) 固有の事項の議論用です。
  MIPS ベースのすべてのポートに関する質問のための
  <a href="#port-mips">port-mips</a> リストもあります。
ENDLIST
LIST(port-powerpc)
  PowerPC ベースの NetBSD ポートすべてに関する事項の議論用です。
  ポート別のリストがありますので、各ポートに固有の質問や情報は
  そちらをご利用ください:
  <a href="#port-bebox">port-bebox</a>、
  <a href="#port-macppc">port-macppc</a>、
  <a href="#port-ofppc">port-ofppc</a>、
  <a href="#port-prep">port-prep</a>、
  <a href="#port-sandpoint">port-sandpoint</a>。
ENDLIST
PORTLIST(port-prep)
  PReP ─ PowerPC リファレンスプラットフォーム─ 上の NetBSD (NetBSD/prep)
  固有の事項の議論用です。
  PowerPC ベースのすべてのポートに関する質問のための
  <a href="#port-powerpc">port-powerpc</a> リストもあります。
ENDLIST
PORTLIST(port-s390)
  IBM S/390 プラットフォーム上の NetBSD (NetBSD/s390) 固有の事項の議論用です。
ENDLIST
PORTLIST(port-sandpoint)
  MPC8240 プロセッサーモジュールを使った Motorola Sandpoint リファレンス
  プラットフォーム上の NetBSD (NetBSD/sandpoint) 固有の事項の議論用です。
  PowerPC ベースのすべてのポートに関する質問のための
  <a href="#port-powerpc">port-powerpc</a> リストもあります。
ENDLIST
PORTLIST(port-sgimips)
  SGI の MIPS プラットフォーム上の NetBSD (NetBSD/sgimips)
  固有の事項の議論用です。
  MIPS ベースのすべてのポートに関する質問のための
  <a href="#port-mips">port-mips</a> リストもあります。
ENDLIST
PORTLIST(port-sh3)
  日立 Super-H (SH3/4) チップベースの NetBSD ポートすべてに関する事項の
  議論用です。
  ポート別のリストがありますので、各ポートに固有の質問や情報は
  そちらをご利用ください:
  <a href="#port-dreamcast">port-dreamcast</a>、
  <a href="#port-hpcsh">port-hpcsh</a>。
ENDLIST
PORTLIST(port-sparc)
  Sun の 32 ビット Sparc ベースのマシン上の NetBSD (NetBSD/sparc).
  固有の事項の議論用です。
ENDLIST
PORTLIST(port-sparc64)
  Sun の 64 ビット Ultrasparc ベースのマシン上の NetBSD (NetBSD/sparc64)
  固有の事項の議論用です。
ENDLIST
PORTLIST(port-sun3)
  Sun の Motorola 68k ベースのマシン上の NetBSD (NetBSD/sun3 および
  NetBSD/sun3x) 固有の事項の議論用です。
  新しい Sparc ベースの Sun のマシンは、
  <a href="#port-sparc">port-sparc</a> と
  <a href="#port-sparc64">port-sparc64</a> がカバーします。
  Motorola 68k ベースのすべてのポートに関する質問のための
  <a href="#port-m68k">port-m68k</a> リストもあります。
ENDLIST
PORTLIST(port-vax)
  Digital の VAX シリーズのマシン上の NetBSD (NetBSD/vax)
  固有の事項の議論用です。
ENDLIST
PORTLIST(port-x68k)
  Sharp 製の日本の X68000/X68030 マシン上の NetBSD (NetBSD/x68k)
  固有の事項の議論用です。
  Motorola 68k ベースのすべてのポートに関する質問のための
  <a href="#port-m68k">port-m68k</a> リストもあります。
ENDLIST
  </ul>

</td><td valign=top>

  LISTSECTION(過去のリスト)

  <center><b>(アーカイブのみ)</b></center>
  <p>

  <ul>
OLDLIST(amiga)
  NetBSD/Amiga に関する事項の議論のためのリストです。<br>
  <em><a href="#port-amiga">port-amiga</a> に移行しました。</em>
ENDLIST
OLDLIST(amiga-dev)
  NetBSD/Amiga の高度な開発に関する事項を扱うリストです。<br>
  <em><a href="#port-amiga">port-amiga</a> に移行しました。</em>
ENDLIST
OLDLIST(amiga-x)
  NetBSD/Amiga で動作する X に関するリストです。<br>
  <em><a href="#port-amiga">port-amiga</a> に移行しました。</em>
ENDLIST
OLDLIST(m68k)
  m68k 系 CPU ベースのすべてのポートに関する事項を扱うリストです。<br>
  <em><a href="#port-m68k">port-m68k</a> に移行しました。</em>
ENDLIST
OLDLIST(macbsd-development)
  MacBSD の高度な開発に関する事項を扱うリストです。<br>
  <em><a href="#port-mac68k">port-mac68k</a> に移行しました。</em>
ENDLIST
OLDLIST(macbsd-general)
  MacBSD (NetBSD/mac68k) に関する事項の議論のためのリストです。<br>
  <em><a href="#port-mac68k">port-mac68k</a> に移行しました。</em>
ENDLIST
  </ul>

</td></tr></table>
divert(4)
<h2><a name="descriptions">リストの説明</a></h2>
divert(9)
<hr>

<table><tr><td>
    <a href="../"><img
	src="/images/NetBSD-flag.gif" origlink="../images/NetBSD-flag.gif" border=0
	width="91" height="42" alt=""></a>
  </td><td>
    <a href="../"><img
	src="/images/empty.gif" origlink="../images/empty.gif" border=0
	width="1" height="1" alt="NetBSD ">ホームページ</a>
</td></tr></table>

<hr> 
<address>
  <small>
  (連絡先 - <a href="../Misc/feedback.html">英語</a>,
       <a href="mailto:www@JP.NetBSD.ORG">日本語:
       www@JP.NetBSD.ORG</a>)<br>
  $NetBSD: index.m4,v 1.95 2001/04/02 13:51:35 fvdl Exp $<br>
  <a href="../Misc/disclaimer.html">Copyright &copy; 1994-2001
  The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED.</a>
  </small>
</address>

</body>
</html>
