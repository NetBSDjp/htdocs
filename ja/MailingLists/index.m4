divert(-1)dnl
#	$NetBSD: index.m4,v 1.161 2004/10/30 22:33:36 jschauma Exp $
#	Copyright (c) 1994-2004
#	    The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED.
# http://mail-index.NetBSD.org/

undefine(`index')

define(`LISTNEWS',
`  <a href="http://news.NetBSD.org/'`patsubst(patsubst(patsubst(patsubst($1, `^port-', `ports-'), `-', `.'), `^', `netbsd.'), `netbsd.netbsd.', `netbsd.')'`/"><img src="../../images/misc/news.gif" origlink="../images/misc/news.gif" align="bottom" border="0" width="29" height="29" alt="[Newsgroup]"></a>
</td><td valign=top>', `-', `.')

define(`LISTARCHIVE',
`  <a href="http://mail-index.NetBSD.org/$1/"><img src="../../images/misc/tape.gif" origlink="../images/misc/tape.gif" align="bottom" border="0" width="29" height="29" alt="[View archive]"></a>
</td><td valign=top>')

define(`LISTSUBSCRIBE',
`  <a href="http://www.NetBSD.org/cgi-bin/subscribe_list.pl?list=$1"><img src="../../images/misc/envelope.gif" origlink="../images/misc/envelope.gif" align="bottom" border="0" width="29" height="29" alt="[Subscribe]"></a>
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
LISTNEWS($1)
LISTHEADER($1)')

define(`PORTLIST',
`    <li><a href="#$1">$1</a>
LISTPREHEADER
LISTSUBSCRIBE($1)
LISTARCHIVE($1)
LISTNEWS($1)
PORTLISTHEADER($1)')

define(`OLDLIST',
`    <li><a href="#$1">$1</a>
LISTPREHEADER
LISTARCHIVE($1)
LISTNEWS($1)
LISTHEADER($1)')

define(`ENDLIST', `</td></tr></table>

divert(0)dnl')

# here we go!!!
divert(0)dnl
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-2022-JP">
<!-- Copyright (c) 1994-2004
	The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED. -->
<link rev="made" href="mailto:www@JP.NetBSD.org">
<title>NetBSD Mailing Lists</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">

<h2>NetBSD $B%a!<%j%s%0%j%9%H(B</h2>

<p>
($BLuCp(B: $B$3$3$G@bL@$7$F$$$k$N$OK\2H$N%a!<%j%s%0%j%9%H$G$9!#F|K\8l$N%a!<%j%s%0%j%9%H$K$D$$$F$O(B <a href="http://www.jp.NetBSD.org/ja/JP/ml.html">$BF|K\8l%a!<%j%s%0%j%9%H$N%Z!<%8(B</a>$B$r8+$F$/$@$5$$!#(B)
<p>

NetBSD $B%W%m%8%'%/%H$G$O!"(B NetBSD $B%f!<%6!<$H3+H/<T$,MF0W$K$d$j$H$j$G$-$k$h$&!"(B
$B$5$^$6$^$J8x3+%a!<%j%s%0%j%9%H$rMQ0U$7$F$$$^$9!#(B
$B%a!<%j%s%0%j%9%H$O$9$Y$F!"%a!<%j%s%0%j%9%H4IM}%Q%C%1!<%8(B <b>Majordomo</b>
$B$G%5!<%S%9$5$l$F$*$j!"(B <i>majordomo@NetBSD.org</i> $B$K6u$N%a!<%k$r=P$9$H!"(B
NetBSD $B%W%m%8%'%/%H$N(B Majordomo $B$N;H$$J}$,$o$+$k$h$&$K$J$C$F$$$^$9!#(B
<p>

$B$3$N%Z!<%8$G$O!"3F%a!<%j%s%0%j%9%H$K$D$$$F@bL@$7$F$$$k$[$+!"(B
$B%a!<%j%s%0%j%9%H$N%"!<%+%$%V$N1\Mw!"(B
$B$5$i$K$O%a!<%j%s%0%j%9%H$N9VFI<jB3$-$b$G$-$k$h$&$K$J$C$F$$$^$9!#(B
$B$3$N%Z!<%8$O!";0$D$NItJ,$KJ,$+$l$F$$$^$9(B:
$B$3$NF3F~ItJ,(B;
$B$9$0$K8+$D$1$i$l$k$h$&(B<a href="#index">$B%a!<%j%s%0%j%9%H$N:w0z(B</a>;
$B$=$7$F!"(B<a href="#descriptions">$B3F%a!<%j%s%0%j%9%H$N@bL@(B</a>
$B(!$3$3$K$O%"!<%+%$%V$H9VFI<jB3$X$N%j%s%/$b$"$j$^$9!#(B
<p>

<b>$B%a!<%j%s%0%j%9%H$r9VFI$9$k$K$O(B</b>$B!"$3$N%Z!<%8$N@bL@$NItJ,$K$"$k(B
$B%j%9%HL>$N8e$N%j%s%/(B
<img src="../../images/misc/envelope.gif" origlink="../images/misc/envelope.gif" width="29" height="29"
alt="[Subscribe]"> $B$r%/%j%C%/$7$^$9!#(B
$B$=$l$+$i%U%)!<%`$K(B e-mail $B%"%I%l%9$r5-F~$7$F$/$@$5$$!#(B
<p>

<b>$B%a!<%j%s%0%j%9%H$+$iC&B`$9$k$K$O(B</b>$B!"9VFI<jB3$-$K;H$C$?%"%I%l%9$+$i(B<a
href="mailto:majordomo@NetBSD.org">majordomo@NetBSD.org</a> $B$X!"K\J8$K(B
<tt><b>unsubscribe <em>listname</em></b></tt> $B$H$@$1=q$$$?%a!<%k$rAw$j$^$9!#(B
<p>

<b>$B%a!<%j%s%0%j%9%H$N%"!<%+%$%V$r8+$k$K$O(B</b>$B!"$3$N%Z!<%8$N@bL@$NItJ,$K$"$k(B
$B%j%9%HL>$N8e$N%j%s%/(B
<img src="../../images/misc/tape.gif" origlink="../images/misc/tape.gif" width="29" height="29"
alt="[View archive]"> $B$r%/%j%C%/$7$^$9!#$3$l$G%a!<%k%"!<%+%$%V%5!<%P!<(B <a
href="http://mail-index.NetBSD.org/">mail-index.NetBSD.org</a>
$B$rMxMQ$G$-$^$9(B
($B%M%C%H%o!<%/%"%/%;%9$H$3$N%^%7%s$N%i%C%/%9%Z!<%9$rDs6!$7$F$/$@$5$C$?(B
<a href="http://www.isc.org/">ISC</a> $B$H!"(B
$B%5%$%H$N9=C[$HJ]<i$r$7$F$/$@$5$C$?(B
<a href="mailto:root@garbled.net">Tim Rightnour</a>
$B$N$*$+$2$G$9(B) $B!#(B
$B$3$N$[$+!"%a!<%j%s%0%j%9%H$N%"!<%+%$%V$O!"(B
<a href="http://www.geocrawler.com/lists/3/NetBSD/">Geocrawler</a>
$B$K$b$"$j$^$9!#(B
<p>

<b>$B%a!<%j%s%0%j%9%H$r%K%e!<%9%U%m%s%H%(%s%I$GFI$`$K$O(B</b>$B!"(B
$B$3$N%Z!<%8$N@bL@$NItJ,$K$"$k%j%9%HL>$N8e$N%j%s%/(B
<img src="../../images/misc/news.gif" origlink="../images/misc/news.gif" width="29" height="29"
alt="[Newsgroup]"> $B$r%/%j%C%/$7$^$9!#$3$l$G(B <a
href="http://news.NetBSD.org/">news.NetBSD.org</a> $B$N%K%e!<%9%"!<%+%$%V$rMxMQ$G$-$^$9!#(B
<p>

NetBSD $B$N%a!<%j%s%0%j%9%H$NB?$/$O!"IaDL$N(B unmoderated $B$J$b$N$G$9$,!"(B
$B4IM}<T$K$h$C$F(B moderated $B$K$5$l$k$h$&$J>u67$,$?$^$K5/$-$k$3$H$K(B
$B$4Cm0U$/$@$5$$!#(B

<h2>$B%a!<%j%s%0%j%9%H%"!<%+%$%V$N8!:w(B</h2>

$B:w0z$H%"!<%+%$%V$O(B
<a href="http://mail-index.NetBSD.org/">http://mail-index.NetBSD.org/</a>
$B$H(B <a href="http://www.geocrawler.com/lists/3/NetBSD/">Geocrawler</a> $B$K$"$j$^$9!#(B
<p>

Google $B$G%a!<%j%s%0%j%9%H$r4JC1$K8!:w(B (<a
href="../Misc/search.html">$B$=$NB>$N(B NetBSD $B8!:w(B</a>)<br>
<blockquote>
  <table border=0><tr><td valign=top>
  <img src="../../images/links/google.gif" origlink="../images/links/google.gif" width="120" height="42" alt="" border="0">
  </td>
  <td valign="top">
  <form method="get" action="http://www.google.com/custom">
    <input type="text" name="q" size=30 maxlength="255" value="">
    <input type="hidden" name="cof" value="LW:247;L:http://www.NetBSD.org/images/NetBSD-smaller.png;LH:241;AH:center;AWFID:4f6b0499f0f58d2c;">
    <input type="hidden" name="domains" value="mail-index.NetBSD.org">
    <input type="hidden" name="sitesearch" value="mail-index.NetBSD.org">
    <br>
    <input type="submit" value="Google $B8!:w(B">
    </form>
  </td></tr></table>
</blockquote>

<h2><a name="index">The NetBSD Project $B$N%a!<%j%s%0%j%9%H(B</a></h2>

<table><tr><td valign=top>

  LISTSECTION($BA4HL$N%j%9%H(B)

  <ul>
LIST(current-users)
  NetBSD-current $B%=!<%9%D%j!<$N:G?7%P!<%8%g%s$r;H$C$F$$$k(B
  $B$9$Y$F$N%f!<%6!<$N$?$a$N8x3+F$O@$N>l$G$9!#%=!<%9%D%j!<Cf$N%P%0Ey$K$D$$$F(B
  $B8l$k$N$K$h$$>l=j$G$9!#(B NetBSD-current $B%D%j!<$O>o$KJQ2=$7$F$$$k$N$G!"(B
  $BEj9FA0$K:G?7$N%D%j!<$r3NG'$9$k$h$&$K$7$F$/$@$5$$!#(B
ENDLIST
LIST(netbsd-advocacy)
  $B%W%m%8%'%/%H$N?J$aJ}$K$D$$$F$N8x3+F$O@$N$?$a$N%a!<%j%s%0%j%9%H$G$9!#(B
ENDLIST
LIST(netbsd-announce)
  NetBSD $B$K4X$9$k$*CN$i$;$N$?$a$N%a!<%j%s%0%j%9%H$G$9!#(B
ENDLIST
LIST(netbsd-bugs)
  NetBSD $B$N%P%0$K4X$9$k5DO@$N$?$a$N%a!<%j%s%0%j%9%H$G$9!#(B
  <i>send-pr(1)</i> $B$GAw$i$l$?(B NetBSD $B$N%P%0%l%]!<%H$O$9$Y$F$3$3$KN.$l$^$9!#(B
ENDLIST
LIST(pkgsrc-bugs)
  pkgsrc $B$N%P%0$K4X$9$k5DO@$N$?$a$N%a!<%j%s%0%j%9%H$G$9!#(B
  <i>send-pr(1)</i> $B$GAw$i$l$?(B 'pkg' $B%+%F%4%j!<$N%P%0%l%]!<%H$O$9$Y$F$3$3$KN.$l$^$9!#(B
ENDLIST
LIST(netbsd-docs)
  NetBSD $B$NJ8=q$K4X$9$k5DO@$N$?$a$N%a!<%j%s%0%j%9%H$G$9!#K]Lu<TMQ%a!<%j%s%0%j%9%H(B
$B$K4X$9$k>pJs$O(B<a href="../../developers/translate.html#ml" origlink="../developers/translate.html#ml">$B$3$N%Z!<%8(B</a>$B$K$"$j$^$9!#(B
ENDLIST
LIST(netbsd-help)
  $B%f!<%6!<$,<ALd$r4s$;$k0lHLE*$J>l$H$7$F$N%a!<%j%s%0%j%9%H$G$9!#(B
ENDLIST
LIST(netbsd-java)
  NetBSD $B>e$N(B Java $B$K4XO"$9$k$3$H$,$i$N8x3+F$O@$N>l$G$9!#(B
ENDLIST
LIST(netbsd-jobs)
  NetBSD $B%f!<%6!<$d3+H/<T$H4XO"$N$"$k5a?M9-9p$N$?$a$N(B
  $B%a!<%j%s%0%j%9%H$G$9!#(B
ENDLIST
LIST(netbsd-news)
  NetBSD $B$K4X$9$k%K%e!<%9$N$?$a$N%a!<%j%s%0%j%9%H$G$9!#(B
  $B%5!<%I%Q!<%F%#!<$N%K%e!<%9$b4^$_$^$9!#(B
ENDLIST
LIST(netbsd-ports)
  NetBSD $B$N0\?":n6H$r$7$F$$$k?M$d6=L#$,$"$k?M$N$?$a$N%a!<%j%s%0%j%9%H$G$9!#(B
ENDLIST
LIST(netbsd-users)
  $B$9$Y$F$N(B NetBSD $B%f!<%6!<8~$1$N!"%W%i%C%H%U%)!<%`$K$h$i$J$$0lHLE*$J(B
  $B8x3+F$O@$N>l$G$9!#$*$*$<$$$N;22C<T$,$3$N%j%9%H$rFI$s$G$$$k$?$a!"(B
  $B$h$/9M$($?>e$GEj9F$7$F$/$@$5$$!#(B NetBSD $B<+BN$NJ]<i$d@_7W$K4X$9$k(B
  $B5?Ld$d%3%a%s%H$O!"(B NetBSD $B$N;HMQ$K4X$9$kOCBj$H$O0[$J$k$?$a!"(B
  $B$3$N%j%9%H$K$O$U$5$o$7$/$"$j$^$;$s!#$=$N$h$&$JOCBj$O!"(B
  $B69$$HO0O$KFC2=$7$?5;=QE*$J%j%9%H$,$U$5$o$7$$$H$5$l$F$$$^$9!#(B
ENDLIST
LIST(pkgsrc-bulk)
  pkgsrc $B%P%k%/9=C[$NJs9p$H9=C[%m%0$,N.$l$k%a!<%j%s%0%j%9%H$G$9!#(B
ENDLIST
LIST(pkgsrc-changes)
  <a
  href="../Documentation/software/packages.html">NetBSD
  $B%Q%C%1!<%8%3%l%/%7%g%s(B</a> (pkgsrc) $B$N$9$Y$F$NJQ99$K$D$$$F$N(B
  commit $B%a%C%;!<%8$,N.$l$k%a!<%j%s%0%j%9%H$G$9!#(B
  $BKhF|!"(B 24 $B;~4VJ,$N$9$Y$F$N(B commit $B%a%C%;!<%8$r$^$H$a$FAw$k!"(B<a
  href="http://www.NetBSD.org/cgi-bin/subscribe_list.pl?list=pkgsrc-changes-digest">$B%@%$%8%'%9%H(B
  $BHG(B</a>$B$b$"$j$^$9!#(B
ENDLIST
LIST(source-changes)
  NetBSD $B%=!<%9%D%j!<$N$9$Y$F$NJQ99$K$D$$$F$N(B commit $B%a%C%;!<%8$,(B
  $BN.$l$k%a!<%j%s%0%j%9%H$G$9!#(B
  $BKhF|!"(B 24 $B;~4VJ,$N$9$Y$F$N(B commit $B%a%C%;!<%8$r$^$H$a$FAw$k!"(B<a
  href="http://www.NetBSD.org/cgi-bin/subscribe_list.pl?list=source-changes-digest">$B%@%$%8%'%9%H(B
  $BHG(B</a>$B$b$"$j$^$9!#(B
ENDLIST
LIST(regional-au)
  $B%*!<%9%H%i%j%":_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-boston)
  $B%\%9%H%s:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-ca)
  $B%+%J%@:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-cs)
  $B%A%'%36&OB9q$H%9%m%P%-%"6&OB9q:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-de)
  $B%I%$%D$*$h$S%I%$%D8l7w0h:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-fr)
  $B%U%i%s%9:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-it)
  $B%$%?%j%":_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-jp)
  $BF|K\:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-london)
  $B%m%s%I%s:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-nl)
  $B%*%i%s%@:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-nordic)
  $BKL2$:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-nyc)
  $B%K%e!<%h!<%/%7%F%#!<:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-pl)
  $B%]!<%i%s%I:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-pt)
  $B%]%k%H%,%k$*$h$S%]%k%H%,%k8l7w0h:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(regional-sfba)
  $B%5%s%U%i%s%7%9%3OQ4_:_=;$N%f!<%6!<8~$1$N5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-cluster)
  NetBSD $B%[%9%H$K$h$k%/%i%9%?!<$N9=C[$d1?MQ$K4X$9$k5;=QE*$J5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-embed)
  $BAH$_9~$_%7%9%F%`>e$N(B NetBSD $B$N;HMQ$K4X$9$k5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-install)
  NetBSD $B$N%$%s%9%H!<%k%=%U%H%&%'%"$N2~NI$K$D$$$F$N5;=QE*;v9`$N5DO@MQ$G$9!#(B
  $BCm0U(B: $B$3$N%a!<%j%s%0%j%9%H$O(B NetBSD $B$N%$%s%9%H!<%k$N<j=u$1MQ$G$O$"$j$^$;$s!#(B
  NetBSD $B$N%$%s%9%H!<%k$GLdBj$,$"$k>l9g$O!"$3$3$G$O$J$/(B netbsd-help $B$r8+$F$/$@$5$$!#(B
ENDLIST
LIST(tech-kern)
  $B%+!<%M%kA4HL$K4X$9$k5;=QE*;v9`$N5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-misc)
  $BB>$N(B tech-* $B%j%9%H$N$$$:$l$K$b3:Ev$7$J$$5;=QE*;v9`$N5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-net)
  NetBSD $B$N%M%C%H%o!<%/%5%V%7%9%F%`$K4X$9$k5;=QE*;v9`$N5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-perform)
  NetBSD $B$N%Q%U%)!<%^%s%9!"FC$K%Q%U%)!<%^%s%9$N2~NI$K4X$9$k5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-pkg)
  NetBSD $B%Q%C%1!<%8%7%9%F%`$K4X$9$k5;=QE*;v9`$N5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-ports)
  NetBSD $B$N$5$^$6$^$J%O!<%I%&%'%"$X$N0\?"$K4X$9$k5;=QE*;v9`$N5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-security)
  NetBSD $B$N%;%-%e%j%F%#!<$K4X$9$k5;=QE*$J5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-crypto)
  NetBSD $B%7%9%F%`$K$*$1$k0E9f2=$K4X$9$k5;=QE*$J5DO@MQ$G$9!#$3$N%j%9%H$G$O!"(B
  $BJF9q8~$1(B (cryptosrc-us) $B$H9q:]HG(B (cryptosrc-intl) $B$N$$$:$l$N0E9f2=$K$D$$$F$b(B
  $B07$$$^$9!#(B
ENDLIST
LIST(tech-smp)
  NetBSD $B$N%^%k%A%W%m%;%C%5!<BP1~$K4X$9$k5;=QE*;v9`$N5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-toolchain)
  toolchain $B$K4X$9$k5;=QE*$J5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-userlevel)
  POSIX $B=`5r!"%3%s%Q%$%k4D6-$J$I!"$5$^$6$^$J(B
  $B%+!<%M%k0J30$K4X$9$k$3$H$N5;=QE*;v9`$N5DO@MQ$G$9!#(B
ENDLIST
LIST(tech-x11)
  NetBSD $B$G;H$o$l$k(B X11 $B%&%#%s%I%&%7%9%F%`$K4X$9$k5DO@MQ$G$9!#(B
ENDLIST
LIST(www-changes)
  NetBSD WWW $B%5!<%P!<$N$9$Y$F$NJQ99$K$D$$$F$N(B
  commit $B%a%C%;!<%8$,N.$l$k%a!<%j%s%0%j%9%H$G$9!#(B
ENDLIST
  </ul>

</td><td valign=top>

LISTSECTION($B5!<oJL$N%j%9%H(B)

  <ul>
PORTLIST(port-acorn26)
  ARMv2 $B$H(B ARMv2a $B%^%7%s>e$N(B NetBSD (NetBSD/arm26)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  ARM $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-arm">port-arm</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-acorn32)
  ARM6 $B$*$h$S$=$l0J9_$N(B CPU $B%Y!<%9$N%^%7%s>e$N(B NetBSD
  (NetBSD/acorn32) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  ARM $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-arm">port-arm</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-algor)
  Algorithmics, Ltd. MIPS $B%Y!<%9$NI>2A%\!<%I>e$N(B NetBSD (NetBSD/alpha)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  MIPS $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-mips">port-mips</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-alpha)
  Digital $B$N(B Alpha AXP $B%7%9%F%`>e$N(B NetBSD (NetBSD/alpha) $B8GM-$N;v9`$N(B
  $B5DO@MQ$G$9!#(B
ENDLIST
PORTLIST(port-amd64)
  AMD64 $B%Y!<%9$N%^%7%s>e$N(B NetBSD (NetBSD/amd64)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
ENDLIST
PORTLIST(port-amiga)
  Commodore $B$N(B Amiga $B$d(B MacroSystem $B$N(B DraCo $B%^%7%s>e$N(B
  NetBSD (NetBSD/amiga) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  Motorola 68k $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-m68k">port-m68k</a> $B%j%9%H$b$"$j$^$9!#(B
  <br><small>($B$3$N%j%9%H$O!"(B <i>amiga</i>$B!"(B <i>amiga-dev</i>$B!"(B
  <i>amiga-x</i> $B$N3F%j%9%H$K$H$C$F$+$o$k$b$N$G$9!#(B)</small>
ENDLIST
PORTLIST(port-arc)
  MIPS $B%Y!<%9$G(B ARC firmware $B$r;}$C$?(B PC $B>e$N(B NetBSD (NetBSD/arc)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  MIPS $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-mips">port-mips</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
LIST(port-arm)
  ARM $B%Y!<%9$N(B NetBSD $B%]!<%H$9$Y$F$K4X$9$k;v9`$N5DO@MQ$G$9!#(B
  $B%]!<%HJL$N%j%9%H$,$"$j$^$9$N$G!"3F%]!<%H$K8GM-$N<ALd$d>pJs$O(B
  $B$=$A$i$r$4MxMQ$/$@$5$$(B:
  <a href="#port-acorn26">port-acorn26</a>$B!"(B
  <a href="#port-acorn32">port-acorn32</a>$B!"(B
  <a href="#port-cats">port-cats</a>$B!"(B
  <a href="#port-hpcarm">port-hpcarm</a>$B!#(B
ENDLIST
PORTLIST(port-atari)
  Atari $B$N(B TT030$B!"(B Falcon$B!"(B Hades $B%^%7%s>e$N(B NetBSD (NetBSD/atari)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  Motorola 68k $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-m68k">port-m68k</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-bebox)
  Be, Inc. $B$N(B PowerPC $B%Y!<%9$N(B BeBox $B%3%s%T%e!<%?!<>e$N(B NetBSD (NetBSD/bebox)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  PowerPC $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-powerpc">port-powerpc</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-cats)
  ARM $B%Y!<%9$N(B Chalice Technology CATS $B%^%7%s$*$h$S(B EBSA $BI>2A%\!<%I>e$N(B
  NetBSD (NetBSD/cats) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  ARM $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-arm">port-arm</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-cobalt)
  Cobalt Networks $B$N(B MIPS $B%Y!<%9$N(B Qube $B$*$h$S(B RaQ $B%3%s%T%e!<%?!<>e$N(B NetBSD
  (NetBSD/cobalt) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  MIPS $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-mips">port-mips</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-dreamcast)
  Sega Dreamcast $B>e$N(B NetBSD (NetBSD/dreamcast) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  $BF|N)(B Super-H (SH3/4) $B%A%C%W%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-sh3">port-sh3</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-evbmips)
  MIPS $B%Y!<%9$N(B CPU $B$r;}$DI>2A%\!<%I>e$N(B NetBSD (NetBSD/evbmips)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#8=:_$N$H$3$m(B MIPS Malta $B$,%5%]!<%H$5$l$F$$$^$9!#(B
  MIPS $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-mips">port-mips</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-hp300)
  Hewlett-Packard $B$N(B 9000/300 $B$*$h$S(B 9000/400 $B%7%j!<%:$N%^%7%s>e$N(B NetBSD
  (NetBSD/hp300) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  Motorola 68k $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-m68k">port-m68k</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-hp700)
  Hewlett-Packard $B$N(B 9000/700 HP-PA RISC $B%^%7%s>e$N(B NetBSD (NetBSD/hp700)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
ENDLIST
PORTLIST(port-hpcarm)
  ARM $B%Y!<%9$N(B Windows CE PDA $B%^%7%s>e$N(B NetBSD (NetBSD/hpcarm)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  ARM $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-arm">port-arm</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-hpcmips)
  MIPS $B%Y!<%9$N(B Windows CE PDA $B%^%7%s>e$N(B NetBSD (NetBSD/hpcmips)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  MIPS $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-mips">port-mips</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-hpcsh)
  $BF|N)(B Super-H (SH3/4) $B7O%Y!<%9$N(B Windows CE PDA $B%^%7%s>e$N(B NetBSD
  (NetBSD/hpcsh) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  $BF|N)(B Super-H (SH3/4) $B%A%C%W%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-sh3">port-sh3</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-i386)
  i386 $B0J9_$N(B CPU $B$r;}$D(B IBM PC $B8_495!>e$N(B NetBSD (NetBSD/i386)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
ENDLIST
PORTLIST(port-iyonix)
  ARM $B%Y!<%9$N(B <a href="http://www.iyonix.com/">Iyonix pc</a>
  $B>e$N(B NetBSD (NetBSD/iyonix)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
ENDLIST
PORTLIST(port-luna68k)
  68k $B%Y!<%9$N(B OMRON LUNA $B%^%7%s>e$N(B NetBSD (NetBSD/luna68k)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  Motorola 68k $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-m68k">port-m68k</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
LIST(port-m68k)
  m68k $B%Y!<%9$N(B NetBSD $B%]!<%H$9$Y$F$K4X$9$k;v9`$N5DO@MQ$G$9!#(B
  $B%]!<%HJL$N%j%9%H$,$"$j$^$9$N$G!"3F%]!<%H$K8GM-$N<ALd$d>pJs$O(B
  $B$=$A$i$r$4MxMQ$/$@$5$$(B:
  <a href="#port-amiga">port-amiga</a>$B!"(B
  <a href="#port-atari">port-atari</a>$B!"(B
  <a href="#port-hp300">port-hp300</a>$B!"(B
  <a href="#port-luna68k">port-luna68k</a>$B!"(B
  <a href="#port-mac68k">port-mac68k</a>$B!"(B
  <a href="#port-mvme68k">port-mvme68k</a>$B!"(B
  <a href="#port-news68k">port-news68k</a>$B!"(B
  <a href="#port-next68k">port-next68k</a>$B!"(B
  <a href="#port-sun2">port-sun2</a>$B!"(B
  <a href="#port-sun3">port-sun3</a>$B!"(B
  <a href="#port-x68k">port-x68k</a>$B!#(B
ENDLIST
PORTLIST(port-mac68k)
  Apple $B$N(B m68k $B%Y!<%9$N(B Macintosh $B%^%7%s>e$N(B NetBSD (NetBSD/mac68k)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  Motorola 68k $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-m68k">port-m68k</a> $B%j%9%H$b$"$j$^$9!#(B
  <br><small>($B$3$N%j%9%H$O!"(B <i>macbsd-general</i> $B$H(B
  <i>macbsd-development</i> $B$N3F%j%9%H$K$H$C$F$+$o$k$b$N$G$9!#(B)</small>
ENDLIST
PORTLIST(port-macppc)
  Apple $B$N(B PowerPC $B%Y!<%9$N(B Macintosh $B%^%7%s>e$N(B NetBSD (NetBSD/macppc)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  PowerPC $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-powerpc">port-powerpc</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
LIST(port-mips)
  MIPS $B%Y!<%9$N(B NetBSD $B%]!<%H$9$Y$F$K4X$9$k;v9`$N5DO@MQ$G$9!#(B
  $B%]!<%HJL$N%j%9%H$,$"$j$^$9$N$G!"3F%]!<%H$K8GM-$N<ALd$d>pJs$O(B
  $B$=$A$i$r$4MxMQ$/$@$5$$(B:
  <a href="#port-algor">port-algor</a>$B!"(B
  <a href="#port-arc">port-arc</a>$B!"(B
  <a href="#port-cobalt">port-cobalt</a>$B!"(B
  <a href="#port-evbmips">port-evbmips</a>$B!"(B
  <a href="#port-hpcmips">port-hpcmips</a>$B!"(B
  <a href="#port-mipsco">port-mipsco</a>$B!"(B
  <a href="#port-newsmips">port-newsmips</a>$B!"(B
  <a href="#port-playstation2">port-playstation2</a>$B!"(B
  <a href="#port-pmax">port-pmax</a>$B!"(B
  <a href="#port-sbmips">port-sbmips</a>$B!"(B
  <a href="#port-sgimips">port-sgimips</a>$B!#(B
ENDLIST
PORTLIST(port-mipsco)
  MIPS Computer Systems, Inc. $B@=IJ>e$N(B NetBSD (NetBSD/mipsco)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  MIPS $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-mips">port-mips</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-mvme68k)
  Motorola $B$N(B 68k VME $B%\!<%I%3%s%T%e!<%?!<>e$N(B NetBSD
  (NetBSD/mvme68k) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  Motorola 68k $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-m68k">port-m68k</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-mvmeppc)
  Motorola $B$N(B PowerPC VME $B%\!<%I%3%s%T%e!<%?!<>e$N(B NetBSD
  (NetBSD/mvmeppc) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  PowerPC $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-powerpc">port-powerpc</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-news68k)
  68k $B%Y!<%9$N(B Sony NEWS $B%7%9%F%`>e$N(B NetBSD (NetBSD/news68k)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  Motorola 68k $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-m68k">port-m68k</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-newsmips)
  MIPS $B%Y!<%9$N(B Sony NEWS $B%7%9%F%`>e$N(B NetBSD (NetBSD/newsmips)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  MIPS $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-mips">port-mips</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-next68k)
  68k $B%Y!<%9$N(B NeXT $B!V9u$$%O!<%I%&%'%"!W>e$N(B NetBSD (NetBSD/next68k)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  Motorola 68k $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-m68k">port-m68k</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-ofppc)
  OpenFirmware PowerPC $B%7%9%F%`>e$N(B NetBSD (NetBSD/ofppc)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  PowerPC $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-powerpc">port-powerpc</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-pc532)
  $BDA$7$$(B PC532 $B%3%s%T%e!<%?!<>e$N(B NetBSD (NetBSD/pc532)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
ENDLIST
PORTLIST(port-pdp10)
  DEC PDP-10 $B%3%s%T%e!<%?!<>e$N(B NetBSD (NetBSD/pdp10)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
ENDLIST
PORTLIST(port-playstation2)
  Sony Playstation 2 $B%^%7%s>e$N(B NetBSD (NetBSD/playstation2)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  MIPS $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-mips">port-mips</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-pmax)
  Digital $B$N(B MIPS $B%Y!<%9$N(B DECstation $B$*$h$S(B DECsystem $B%^%7%s>e$N(B NetBSD
  (NetBSD/pmax) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  MIPS $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-mips">port-mips</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
LIST(port-powerpc)
  PowerPC $B%Y!<%9$N(B NetBSD $B%]!<%H$9$Y$F$K4X$9$k;v9`$N5DO@MQ$G$9!#(B
  $B%]!<%HJL$N%j%9%H$,$"$j$^$9$N$G!"3F%]!<%H$K8GM-$N<ALd$d>pJs$O(B
  $B$=$A$i$r$4MxMQ$/$@$5$$(B:
  <a href="#port-bebox">port-bebox</a>$B!"(B
  <a href="#port-macppc">port-macppc</a>$B!"(B
  <a href="#port-mvmeppc">port-mvmeppc</a>$B!"(B
  <a href="#port-ofppc">port-ofppc</a>$B!"(B
  <a href="#port-prep">port-prep</a>$B!"(B
  <a href="#port-sandpoint">port-sandpoint</a>$B!#(B
ENDLIST
PORTLIST(port-prep)
  PReP $B(!(B PowerPC $B%j%U%!%l%s%9%W%i%C%H%U%)!<%`(!(B $B>e$N(B NetBSD (NetBSD/prep)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  PowerPC $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-powerpc">port-powerpc</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-s390)
  IBM S/390 $B%W%i%C%H%U%)!<%`>e$N(B NetBSD (NetBSD/s390) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
ENDLIST
PORTLIST(port-sandpoint)
  MPC8240 $B%W%m%;%C%5!<%b%8%e!<%k$r;H$C$?(B Motorola Sandpoint $B%j%U%!%l%s%9(B
  $B%W%i%C%H%U%)!<%`>e$N(B NetBSD (NetBSD/sandpoint) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  PowerPC $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-powerpc">port-powerpc</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-sbmips)
  Broadcom $B$N(B SiByte Broadband Processor $B%Y!<%9$N%W%i%C%H%U%)!<%`>e$N(B
  NetBSD (NetBSD/sbmips) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  MIPS $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-mips">port-mips</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-sgimips)
  SGI $B$N(B MIPS $B%W%i%C%H%U%)!<%`>e$N(B NetBSD (NetBSD/sgimips)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  MIPS $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-mips">port-mips</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-sh3)
  $BF|N)(B Super-H (SH3/4) $B%A%C%W%Y!<%9$N(B NetBSD $B%]!<%H$9$Y$F$K4X$9$k;v9`$N(B
  $B5DO@MQ$G$9!#(B
  $B%]!<%HJL$N%j%9%H$,$"$j$^$9$N$G!"3F%]!<%H$K8GM-$N<ALd$d>pJs$O(B
  $B$=$A$i$r$4MxMQ$/$@$5$$(B:
  <a href="#port-dreamcast">port-dreamcast</a>$B!"(B
  <a href="#port-hpcsh">port-hpcsh</a>$B!#(B
ENDLIST
PORTLIST(port-sh5)
  SH5 $B%Y!<%9$N(B NetBSD $B%]!<%H$9$Y$F$K4X$9$k;v9`$N5DO@MQ$G$9!#(B
ENDLIST
PORTLIST(port-sparc)
  Sun $B$N(B 32 $B%S%C%H(B Sparc $B%Y!<%9$N%^%7%s>e$N(B NetBSD (NetBSD/sparc)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
ENDLIST
PORTLIST(port-sparc64)
  Sun $B$N(B 64 $B%S%C%H(B Ultrasparc $B%Y!<%9$N%^%7%s>e$N(B NetBSD (NetBSD/sparc64)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
ENDLIST
PORTLIST(port-sun2)
  Sun $B$N(B Motorola 68010 $B%Y!<%9$N%^%7%s>e$N(B NetBSD (NetBSD/sun2)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#$h$j?7$7$$(B Sun $B$N%^%7%s$O!"(B
  <a href="#port-sun3">port-sun3</a>$B!"(B
  <a href="#port-sparc">port-sparc</a>$B!"(B
  <a href="#port-sparc64">port-sparc64</a> $B$,%+%P!<$7$^$9!#(B
  Motorola 68k $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-m68k">port-m68k</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-sun3)
  Sun $B$N(B Motorola 68020 (sun3) $B$*$h$S(B 68030 (sun3x) $B%Y!<%9$N%^%7%s>e$N(B
  NetBSD (NetBSD/sun3) $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  $B$h$j?7$7$$(B Sparc $B%Y!<%9$N(B Sun $B$N%^%7%s$O!"(B
  <a href="#port-sparc">port-sparc</a> $B$H(B
  <a href="#port-sparc64">port-sparc64</a> $B$,%+%P!<$7$^$9!#(B
  Motorola 68k $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-m68k">port-m68k</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-vax)
  Digital $B$N(B VAX $B%7%j!<%:$N%^%7%s>e$N(B NetBSD (NetBSD/vax)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
ENDLIST
PORTLIST(port-x68k)
  Sharp $B@=$NF|K\$N(B X68000/X68030 $B%^%7%s>e$N(B NetBSD (NetBSD/x68k)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
  Motorola 68k $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k<ALd$N$?$a$N(B
  <a href="#port-m68k">port-m68k</a> $B%j%9%H$b$"$j$^$9!#(B
ENDLIST
PORTLIST(port-xen)
  <a href="http://www.cl.cam.ac.uk/Research/SRG/netos/xen/">Xen $B2>A[%^%7%s%b%K%?!<(B</a>
  $B>e$N(B NetBSD (NetBSD/xen)
  $B8GM-$N;v9`$N5DO@MQ$G$9!#(B
ENDLIST
  </ul>

</td><td valign=top>

  LISTSECTION($B2a5n$N%j%9%H(B)

  <center><b>($B%"!<%+%$%V$N$_(B)</b></center>
  <p>

  <ul>
OLDLIST(amiga)
  NetBSD/amiga $B$K4X$9$k;v9`$N5DO@$N$?$a$N%j%9%H$G$9!#(B<br>
  <em><a href="#port-amiga">port-amiga</a> $B$K0\9T$7$^$7$?!#(B</em>
ENDLIST
OLDLIST(amiga-dev)
  NetBSD/amiga $B$N9bEY$J3+H/$K4X$9$k;v9`$r07$&%j%9%H$G$9!#(B<br>
  <em><a href="#port-amiga">port-amiga</a> $B$K0\9T$7$^$7$?!#(B</em>
ENDLIST
OLDLIST(amiga-x)
  NetBSD/amiga $B$GF0:n$9$k(B X $B$K4X$9$k%j%9%H$G$9!#(B<br>
  <em><a href="#port-amiga">port-amiga</a> $B$K0\9T$7$^$7$?!#(B</em>
ENDLIST
OLDLIST(m68k)
  m68k $B7O(B CPU $B%Y!<%9$N$9$Y$F$N%]!<%H$K4X$9$k;v9`$r07$&%j%9%H$G$9!#(B<br>
  <em><a href="#port-m68k">port-m68k</a> $B$K0\9T$7$^$7$?!#(B</em>
ENDLIST
OLDLIST(macbsd-development)
  MacBSD $B$N9bEY$J3+H/$K4X$9$k;v9`$r07$&%j%9%H$G$9!#(B<br>
  <em><a href="#port-mac68k">port-mac68k</a> $B$K0\9T$7$^$7$?!#(B</em>
ENDLIST
OLDLIST(macbsd-general)
  MacBSD (NetBSD/mac68k) $B$K4X$9$k;v9`$N5DO@$N$?$a$N%j%9%H$G$9!#(B<br>
  <em><a href="#port-mac68k">port-mac68k</a> $B$K0\9T$7$^$7$?!#(B</em>
ENDLIST
  </ul>

</td></tr></table>
divert(4)
<h2><a name="descriptions">$B%j%9%H$N@bL@(B</a></h2>
divert(9)
<hr>

<table><tr><td>
    <a href="../"><img
	src="../../images/NetBSD-flag.png" origlink="../images/NetBSD-flag.png" border=0
	width="90" height="90" alt=""></a>
  </td><td>
    <a href="../"><img
	src="../../images/empty.gif" origlink="../images/empty.gif" border=0
	width="1" height="1" alt="NetBSD ">$B%[!<%`%Z!<%8(B</a>
</td></tr></table>

<hr> 
<address>
  <small>
  ($BO"Mm@h(B - <a href="http://www.NetBSD.org/cgi-bin/feedback.cgi">$B1Q8l(B</a>,
       <a href="mailto:www@JP.NetBSD.org">$BF|K\8l(B:
       www@JP.NetBSD.org</a>)<br>
  $NetBSD: index.m4,v 1.161 2004/10/30 22:33:36 jschauma Exp $<br>
  <a href="../Misc/disclaimer.html">Copyright &copy; 1994-2004
  The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED.</a>
  </small>
</address>

</body>
</html>
