divert(-1)dnl
#	$NetBSD: index.m4,v 1.138 2003/07/01 13:38:58 lukem Exp $
#	Copyright (c) 1994-2003
#	    The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED.
# http://mail-index.netbsd.org/

undefine(`index')

define(`LISTNEWS',
`  <a href="http://news.NetBSD.org/'`patsubst(patsubst(patsubst(patsubst($1, `^port-', `ports-'), `-', `.'), `^', `netbsd.'), `netbsd.netbsd.', `netbsd.')'`/"><img src="../images/misc/news.gif" align="bottom" border="0" width="29" height="29" alt="[Newsgroup]"></a>
</td><td valign=top>', `-', `.')

define(`LISTARCHIVE',
`  <a href="http://mail-index.NetBSD.org/$1/"><img src="../images/misc/tape.gif" align="bottom" border="0" width="29" height="29" alt="[View archive]"></a>
</td><td valign=top>')

define(`LISTSUBSCRIBE',
`  <a href="http://www.NetBSD.org/cgi-bin/subscribe_list.pl?list=$1"><img src="../images/misc/envelope.gif" align="bottom" border="0" width="29" height="29" alt="[Subscribe]"></a>
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">

<html>
<head>
<!-- Copyright (c) 1994-2003
	The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED. -->
<link rev="made" href="mailto:www@NetBSD.org">
<title>NetBSD Mailing Lists</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">

<h2>NetBSD mailing lists</h2>

The NetBSD Project provides a variety of public mailing lists to
facilitate communication between the users and developers of NetBSD.
All of the mailing lists are served by the <b>Majordomo</b> mailing
list management package, and you can find out more about how to use
the NetBSD Project's Majordomo by mailing <i>majordomo@NetBSD.org</i>
with an empty message body.
<p>

Using this page, you can find out what the various mailing
lists are for, look at the mailing list archives, and even subscribe to
the mailing lists themselves.  This page is broken up into three sections:
this introductory section; an
<a href="#index">index of the mailing lists</a> for quick reference; and the
<a href="#descriptions">descriptions of the mailing lists</a>, along
with links to allow you to look at their archives and subscribe to them.
<p>

<b>To subscribe to a mailing list</b> click on the
<img src="../images/misc/envelope.gif" width="29" height="29"
alt="[Subscribe]"> link
next to its name, in the description section of this page.  You will
then have to fill out a form, to supply your e-mail address.
<p>

<b>To unsubscribe from a mailing list</b> send an email
message from the address by which you are subscribed to <a
href="mailto:majordomo@NetBSD.org">majordomo@NetBSD.org</a> containing
only the message <tt><b>unsubscribe <em>listname</em></b>.</tt>
<p>

<b>To obtain a mailing list archive</b> click on the
<img src="../images/misc/tape.gif" width="29" height="29"
alt="[View archive]"> link
next to its name, in the description section of this page.  This will
take you to the mail archive server <a
href="http://mail-index.NetBSD.org/">mail-index.NetBSD.org</a>.
(Many thanks to the <a href="http://www.isc.org/">ISC</a> for the network
access and rack space for this machine as well as
<a href="mailto:root@garbled.net">Tim Rightnour</a> for building and
maintaining the site..). An alternative index of our mailing lists
is available at
<a href="http://www.geocrawler.com/lists/3/NetBSD/">Geocrawler</a>.
<p>

<b>To read the list through a news frontend</b> click on the
<img src="../images/misc/news.gif" width="29" height="29"
alt="[Newsgroup]"> link next to its name, in the description section of this
page.  This will take you to the news-archive at <a
href="http://news.NetBSD.org/">news.NetBSD.org</a>.
<p>

Please note that while the majority of the NetBSD mailing lists are
normally unmoderated, there are circumstances which will occasionally
cause a mailing list to be moderated by its manager.

<h2>Searchable mailing list archives</h2>

Indexes and archives are provided on
<a href="http://mail-index.NetBSD.org/">http://mail-index.NetBSD.org/</a>
and <a href="http://www.geocrawler.com/lists/3/NetBSD/">Geocrawler</a>.
<p>

Quick search the mailing lists with Google (<a
href="../Misc/search.html">other NetBSD searches</a>)<br>
<blockquote>
  <table border=0><tr><td valign=top>
  <img src="../images/links/google.gif" width="120" height="42" alt="" border="0">
  </td>
  <td valign="top">
  <form method="get" action="http://www.google.com/custom">
    <input type="text" name="q" size=30 maxlength="255" value="">
    <input type="hidden" name="cof" value="LW:247;L:http://www.netbsd.org/images/NetBSD-smaller.jpg;LH:241;AH:center;AWFID:4f6b0499f0f58d2c;">
    <input type="hidden" name="domains" value="mail-index.netbsd.org">
    <input type="hidden" name="sitesearch" value="mail-index.netbsd.org">
    <br>
    <input type="submit" value="Google Search">
    </form>
  </td></tr></table>
</blockquote>

<h2><a name="index">The NetBSD Project's mailing lists</a></h2>

<table><tr><td valign=top>

  LISTSECTION(General lists)

  <ul>
LIST(current-users)
  This is a forum for all people using an up-to-date
  version of the NetBSD-current source tree.  It is a
  good forum for talking about ``gotchas'' in the tree.
  Since the NetBSD-current tree is a quickly moving target,
  please confirm any problems with the latest tree
  before posting.
ENDLIST
LIST(netbsd-advocacy)
  This mailing list is for open discussion on how to promote the project.
ENDLIST
LIST(netbsd-announce)
  This mailing list is for announcements about NetBSD.
ENDLIST
LIST(netbsd-bugs)
  This mailing list is where you can discuss bugs in NetBSD.
  All bug reports sent with <i>send-pr(1)</i> appear here.
ENDLIST
LIST(netbsd-docs)
  This mailing list is for discussing NetBSD docs.  Information regarding
  mailing lists for translators is available from <a href="../developers/translate.html#ml">this page</a>.
ENDLIST
LIST(netbsd-help)
  This list provides a general help forum where users can ask
  questions.
ENDLIST
LIST(netbsd-java)
  This is a forum for discussing issues related to Java on NetBSD.
ENDLIST
LIST(netbsd-jobs)
  This mailing list is for job advertisements relevant to NetBSD users
  and developers.
ENDLIST
LIST(netbsd-news)
  This mailing list is for news about NetBSD, including from
  third parties.
ENDLIST
LIST(netbsd-ports)
  This list is for people working on or generally interested
  in ports of NetBSD.
ENDLIST
LIST(netbsd-users)
  This is a general purpose forum for all NetBSD users, regardless of
  platform. As a large number of subscribers receive this list, please
  use your good judgement when posting. Questions or comments about the
  maintenance or design of NetBSD itself, as opposed to issues related
  to using NetBSD, aren't appropriate to this list, and are better voiced
  in a more narrowly focused technical list.
ENDLIST
LIST(pkgsrc-changes)
  This list is for those who are interested in getting a
  commit message for every change committed to the <a
  href="../Documentation/software/packages.html">NetBSD
  Packages Collection</a> (pkgsrc).   It is also available in <a
  href="http://www.NetBSD.org/cgi-bin/subscribe_list.pl?list=pkgsrc-changes-digest">digest
  form</a>, meaning one message daily containing all commit messages for changes
  to the source tree in that 24 hour period.
ENDLIST
LIST(source-changes)
  This list is for those who are interested in getting a
  commit message for every change committed to the NetBSD
  source tree.   It is also available in <a
  href="http://www.NetBSD.org/cgi-bin/subscribe_list.pl?list=source-changes-digest">digest
  form</a>, meaning one message daily containing all commit messages for changes
  to the source tree in that 24 hour period.
ENDLIST
LIST(regional-au)
  Discussion relevant to users in Australia.
ENDLIST
LIST(regional-boston)
  Discussion relevant to users in Boston.
ENDLIST
LIST(regional-cs)
  Discussion relevant to users in Czech Republic &amp; Slovak Republic.
ENDLIST
LIST(regional-fr)
  Discussion relevant to users in France.
ENDLIST
LIST(regional-jp)
  Discussion relevant to users in Japan.
ENDLIST
LIST(regional-london)
  Discussion relevant to users in London.
ENDLIST
LIST(regional-nl)
  Discussion relevant to users in the Netherlands.
ENDLIST
LIST(regional-nyc)
  Discussion relevant to users in New York City.
ENDLIST
LIST(regional-pl)
  Discussion relevant to users in Poland.
ENDLIST
LIST(regional-sfba)
  Discussion relevant to users in the San Francisco Bay Area.
ENDLIST
LIST(tech-embed)
  Discussions of the use of NetBSD in embedded systems.
ENDLIST
LIST(tech-install)
  Technical discussion of improvements to NetBSD's installation
  software. NOTE: This mailing list is not for assistance with installing
  NetBSD. If you have problems installing NetBSD, see netbsd-help instead!
ENDLIST
LIST(tech-kern)
  Discussion of general kernel technical issues.
ENDLIST
LIST(tech-misc)
  Discussion of technical issues that aren't really
  appropriate for any of the other tech-* lists.
ENDLIST
LIST(tech-net)
  Discussion of technical issues relating to NetBSD's
  networking subsystem.
ENDLIST
LIST(tech-perform)
  Discussion of performance issues in NetBSD, especially ways to
  improve performance.
ENDLIST
LIST(tech-pkg)
  Discussion of technical issues related to the NetBSD package system.
ENDLIST
LIST(tech-ports)
  Discussion of technical issues related to porting NetBSD to different
  hardware.
ENDLIST
LIST(tech-security)
  Technical discussion regarding security issues in NetBSD.
ENDLIST
LIST(tech-crypto)
  Technical discussion regarding cryptography in the NetBSD system. This list
  applies to both US-based (cryptosrc-us) and International (cryptosrc-intl)
  available cryptography.
ENDLIST
LIST(tech-smp)
  Discussion of technical issues relating to
  multi-processor support for NetBSD.
ENDLIST
LIST(tech-toolchain)
  Technical discussion of toolchain issues.
ENDLIST
LIST(tech-userlevel)
  Discussion of non-kernel related technical issues, such
  as POSIX compliance, compilation environment, etc.
ENDLIST
LIST(tech-x11)
  Discussion of the X11 window system as used with NetBSD.
ENDLIST
LIST(www-changes)
  This list is for those who are interested in getting a commit message
  for every change committed to the NetBSD WWW server's documents.
ENDLIST
  </ul>

</td><td valign=top>

LISTSECTION(Machine specific lists)

  <ul>
PORTLIST(port-acorn32)
  Discussion of issues specific to NetBSD on ARM6 and newer based machines
  (NetBSD/acorn32).
  There is also a <a href="#port-arm">port-arm</a> list for
  questions related to all ARM based ports.
ENDLIST
PORTLIST(port-algor)
  Discussion of issues specific to NetBSD on Algorithmics, Ltd. MIPS-based
  evaluation boards (NetBSD/algor).
  There is also a <a href="#port-mips">port-mips</a> list for
  questions related to all MIPS based ports.
ENDLIST
PORTLIST(port-alpha)
  Discussion of issues specific to NetBSD on Digital's Alpha AXP systems
  (NetBSD/alpha).
ENDLIST
PORTLIST(port-amd64)
  Discussion of issues specific to NetBSD on AMD64 based machines
  (NetBSD/amd64).
ENDLIST
PORTLIST(port-amiga)
  Discussion of issues specific to NetBSD on Commodore's Amiga and
  MacroSystem's DraCo machines (NetBSD/amiga).
  There is also a <a href="#port-m68k">port-m68k</a> list for
  questions related to all Motorola 68k based ports.
  <br><small>(This list supersedes the <i>amiga</i>, <i>amiga-dev</i>, and
  <i>amiga-x</i> lists.)</small>
ENDLIST
PORTLIST(port-arc)
  Discussion of issues specific to NetBSD on MIPS based PCs with ARC firmware
  (NetBSD/arc).
  There is also a <a href="#port-mips">port-mips</a> list for
  questions related to all MIPS based ports.
ENDLIST
LIST(port-arm)
  Discussion of issues relevant to all ARM-based NetBSD ports.
  There are lists for the individual ports and they should be used for
  port-specific questions and information:
  <a href="#port-acorn32">port-acorn32</a>,
  <a href="#port-arm26">port-arm26</a>,
  <a href="#port-cats">port-cats</a>, and
  <a href="#port-hpcarm">port-hpcarm</a>.
ENDLIST
PORTLIST(port-arm26)
  Discussion of issues specific to NetBSD on ARM2 and ARM3 based machines
  (NetBSD/arm26).
  There is also a <a href="#port-arm">port-arm</a> list for
  questions related to all ARM based ports.
ENDLIST
PORTLIST(port-atari)
  Discussion of issues specific to NetBSD on Atari's TT030, Falcon, and Hades
  machines (NetBSD/atari).
  There is also a <a href="#port-m68k">port-m68k</a> list for
  questions related to all Motorola 68k based ports.
ENDLIST
PORTLIST(port-bebox)
  Discussion of issues specific to NetBSD on Be, Inc.'s PowerPC based BeBox
  computer (NetBSD/bebox).
  There is also a <a href="#port-powerpc">port-powerpc</a> list for
  questions related to all PowerPC based ports.
ENDLIST
PORTLIST(port-cats)
  Discussion of issues specific to NetBSD on ARM based Chalice Technology CATS
  machines and EBSA evaluation boards (NetBSD/cats).
  There is also a <a href="#port-arm">port-arm</a> list for
  questions related to all ARM based ports.
ENDLIST
PORTLIST(port-cobalt)
  Discussion of issues specific to NetBSD on Cobalt Networks MIPS based
  Qube and RaQ computers (NetBSD/cobalt).
  There is also a <a href="#port-mips">port-mips</a> list for
  questions related to all MIPS based ports.
ENDLIST
PORTLIST(port-dreamcast)
  Discussion of issues specific to NetBSD on Sega Dreamcast (NetBSD/dreamcast).
  There is also a <a href="#port-sh3">port-sh3</a> list for
  questions related to all Hitachi Super-H (SH3/4) chips-based ports.
ENDLIST
PORTLIST(port-evbarm)
  Discussion of issues specific to NetBSD on ARM-based evaluation boards
  (NetBSD/evbarm).
  There is also a <a href="#port-arm">port-arm</a> list for
  questions related to all ARM based ports.
ENDLIST
PORTLIST(port-evbmips)
  Discussion of issues specific to NetBSD on evaluation boards with
  MIPS-based CPUs  (NetBSD/evbmips).  Currently the MIPS Malta is supported.
  There is also a <a href="#port-mips">port-mips</a> list for
  questions related to all MIPS based ports.
ENDLIST
PORTLIST(port-evbsh3)
  Discussion of issues specific to NetBSD on Hitachi SuperH(TM) SH3/4
  evaluation boards (NetBSD/evbsh3).
  There is also a <a href="#port-sh3">port-sh3</a> list for
  questions related to all sh3 based ports.
ENDLIST
PORTLIST(port-hp300)
  Discussion of issues specific to NetBSD on Hewlett-Packard's 9000/300 and
  9000/400 series machines (NetBSD/hp300).
  There is also a <a href="#port-m68k">port-m68k</a> list for
  questions related to all Motorola 68k based ports.
ENDLIST
PORTLIST(port-hp700)
  Discussion of issues specific to NetBSD on Hewlett-Packard's 9000/700 
  HP-PA RISC machines (NetBSD/hp700).
ENDLIST
PORTLIST(port-hpcarm)
  Discussion of issues specific to NetBSD on ARM based Windows CE PDA machines
  (NetBSD/hpcarm).
  There is also a <a href="#port-arm">port-arm</a> list for
  questions related to all ARM based ports.
ENDLIST
PORTLIST(port-hpcmips)
  Discussion of issues specific to NetBSD on MIPS based Windows CE PDA machines
  (NetBSD/hpcmips).
  There is also a <a href="#port-mips">port-mips</a> list for
  questions related to all MIPS based ports.
ENDLIST
PORTLIST(port-hpcsh)
  Discussion of issues specific to NetBSD on Hitachi Super-H (SH3/4) family 
  based Windows CE PDA machines (NetBSD/hpcsh).
  There is also a <a href="#port-sh3">port-sh3</a> list for
  questions related to all Hitachi Super-H (SH3/4) based ports.
ENDLIST
PORTLIST(port-i386)
  Discussion of issues specific to NetBSD on IBM PC clones with i386 or better
  CPUs (NetBSD/i386).
ENDLIST
PORTLIST(port-luna68k)
  Discussion of issues specific to NetBSD on 68k based OMROM LUNA machines
  (NetBSD/luna68k).
  There is also a <a href="#port-m68k">port-m68k</a> list for
  questions related to all Motorola 68k based ports.
ENDLIST
LIST(port-m68k)
  Discussion of issues relevant to all m68k-based NetBSD ports.
  There are lists for the individual ports and they should be used for
  port-specific questions and information:
  <a href="#port-amiga">port-amiga</a>,
  <a href="#port-atari">port-atari</a>,
  <a href="#port-hp300">port-hp300</a>,
  <a href="#port-luna68k">port-luna68k</a>,
  <a href="#port-mac68k">port-mac68k</a>,
  <a href="#port-mvme68k">port-mvme68k</a>,
  <a href="#port-news68k">port-news68k</a>,
  <a href="#port-next68k">port-next68k</a>,
  <a href="#port-sun2">port-sun2</a>,
  <a href="#port-sun3">port-sun3</a>, and
  <a href="#port-x68k">port-x68k</a>.
ENDLIST
PORTLIST(port-mac68k)
  Discussion of issues specific to NetBSD on Apple's m68k based Macintosh
  machines (NetBSD/mac68k).
  There is also a <a href="#port-m68k">port-m68k</a> list for
  questions related to all Motorola 68k based ports.
  <br><small>(This list supersedes both the <i>macbsd-general</i> and
  <i>macbsd-development</i> lists.)</small>
ENDLIST
PORTLIST(port-macppc)
  Discussion of issues specific to NetBSD on Apple's PowerPC based Macintosh
  machines (NetBSD/macppc).
  There is also a <a href="#port-powerpc">port-powerpc</a> list for
  questions related to all PowerPC based ports.
ENDLIST
LIST(port-mips)
  Discussion of issues relevant to all MIPS-based NetBSD ports.
  There are lists for the individual ports and they should be used for
  port-specific questions and information:
  <a href="#port-algor">port-algor</a>,
  <a href="#port-arc">port-arc</a>,
  <a href="#port-cobalt">port-cobalt</a>,
  <a href="#port-evbmips">port-evbmips</a>,
  <a href="#port-hpcmips">port-hpcmips</a>,
  <a href="#port-mipsco">port-mipsco</a>,
  <a href="#port-newsmips">port-newsmips</a>,
  <a href="#port-playstation2">port-playstation2</a>,
  <a href="#port-pmax">port-pmax</a>,
  <a href="#port-sbmips">port-sbmips</a>. and
  <a href="#port-sgimips">port-sgimips</a>.
ENDLIST
PORTLIST(port-mipsco)
  Discussion of issues specific to NetBSD on products of MIPS Computer Systems, Inc. (NetBSD/mipsco)
  There is also a <a href="#port-mips">port-mips</a> list for
  questions related to all MIPS based ports.
ENDLIST
PORTLIST(port-mvme68k)
  Discussion of issues specific to NetBSD on Motorola's 68k VME board computers
  (NetBSD/mvme68k).
  There is also a <a href="#port-m68k">port-m68k</a> list for
  questions related to all Motorola 68k based ports.
ENDLIST
PORTLIST(port-mvmeppc)
  Discussion of issues specific to NetBSD on Motorola's PowerPC VME board
  computers (NetBSD/mvmeppc).
  There is also a <a href="#port-powerpc">port-powerpc</a> list for
  questions related to all PowerPC based ports.
ENDLIST
PORTLIST(port-newsmips)
  Discussion of issues specific to NetBSD on MIPS based Sony NEWS systems
  (NetBSD/newsmips).
  There is also a <a href="#port-mips">port-mips</a> list for
  questions related to all MIPS based ports.
ENDLIST
PORTLIST(port-news68k)
  Discussion of issues specific to NetBSD on 68k based Sony NEWS systems
  (NetBSD/news68k).
  There is also a <a href="#port-m68k">port-m68k</a> list for
  questions related to all Motorola 68k based ports.
ENDLIST
PORTLIST(port-next68k)
  Discussion of issues specific to NetBSD on 68k based NeXT "black hardware"
  (NetBSD/next68k).
  There is also a <a href="#port-m68k">port-m68k</a> list for
  questions related to all Motorola 68k based ports.
ENDLIST
PORTLIST(port-ofppc)
  Discussion of issues specific to NetBSD on OpenFirmware PowerPC systems
  (NetBSD/ofppc).
  There is also a <a href="#port-powerpc">port-powerpc</a> list for
  questions related to all PowerPC based ports.
ENDLIST
PORTLIST(port-pc532)
  Discussion of issues specific to NetBSD on the rather rare PC532 computer
  (NetBSD/pc532).
ENDLIST
PORTLIST(port-pdp10)
  Discussion of issues specific to NetBSD on DEC PDP-10 computer
  (NetBSD/pdp10).
ENDLIST
PORTLIST(port-playstation2)
  Discussion of issues specific to NetBSD on Sony's Playstation 2
  machines (NetBSD/playstation2).
  There is also a <a href="#port-mips">port-mips</a> list for
  questions related to all MIPS based ports.
ENDLIST
PORTLIST(port-pmax)
  Discussion of issues specific to NetBSD on Digital's MIPS based DECstation
  and DECsystem machines (NetBSD/pmax).
  There is also a <a href="#port-mips">port-mips</a> list for
  questions related to all MIPS based ports.
ENDLIST
LIST(port-powerpc)
  Discussion of issues relevant to all PowerPC based NetBSD ports.
  There are lists for the individual ports and they should be used for
  port-specific questions and information:
  <a href="#port-bebox">port-bebox</a>,
  <a href="#port-macppc">port-macppc</a>,
  <a href="#port-mvmeppc">port-mvmeppc</a>,
  <a href="#port-ofppc">port-ofppc</a>,
  <a href="#port-prep">port-prep</a>, and
  <a href="#port-sandpoint">port-sandpoint</a>.
ENDLIST
PORTLIST(port-prep)
  Discussion of issues specific to NetBSD on PReP -- PowerPC Reference Platform
  (NetBSD/prep).
  There is also a <a href="#port-powerpc">port-powerpc</a> list for
  questions related to all PowerPC based ports.
ENDLIST
PORTLIST(port-s390)
  Discussion of issues specific to NetBSD on IBM S/390 platforms
  (NetBSD/s390).
ENDLIST
PORTLIST(port-sandpoint)
  Discussion of issues specific to NetBSD on Motorola Sandpoint reference
  platform using the MPC8240 processor module (NetBSD/sandpoint).
  There is also a <a href="#port-powerpc">port-powerpc</a> list for
  questions related to all PowerPC based ports.
ENDLIST
PORTLIST(port-sbmips)
  Discussion of issues specific to NetBSD on Broadcom's SiByte
  Broadband Processor-based platforms (NetBSD/sbmips).  There
  is also a <a href="#port-mips">port-mips</a> list for questions
  related to all MIPS based ports.
ENDLIST
PORTLIST(port-sgimips)
  Discussion of issues specific to NetBSD on SGI MIPS platforms
  (NetBSD/sgimips).  There is also a <a href="#port-mips">port-mips</a>
  list for questions related to all MIPS based ports.
ENDLIST
PORTLIST(port-sh3)
  Discussion of issues relevant to all Hitachi Super-H (SH3/4) chips-based
  NetBSD ports.
  There are lists for the individual ports and they should be used for
  port-specific questions and information:
  <a href="#port-dreamcast">port-dreamcast</a>, and
  <a href="#port-hpcsh">port-hpcsh</a>.
ENDLIST
PORTLIST(port-sparc)
  Discussion of issues specific to NetBSD on Sun's 32-bit Sparc based machines
  (NetBSD/sparc).
ENDLIST
PORTLIST(port-sparc64)
  Discussion of issues specific to NetBSD on Sun's 64-bit Ultrasparc based
  machines (NetBSD/sparc64).
ENDLIST
PORTLIST(port-sun2)
  Discussion of issues specific to NetBSD on Sun's Motorola 68010 based machines
  (NetBSD/sun2). Newer Sun machines are covered on
  <a href="#port-sun3">port-sun3</a>, 
  <a href="#port-sparc">port-sparc</a> and
  <a href="#port-sparc64">port-sparc64</a>.
  There is also a <a href="#port-m68k">port-m68k</a> list for
  questions related to all Motorola 68k based ports.
ENDLIST
PORTLIST(port-sun3)
  Discussion of issues specific to NetBSD on Sun's Motorola 68020 (sun3) and
  68030 (sun3x) based machines (NetBSD/sun3). Newer Sparc based Sun machines
  are covered on
  <a href="#port-sparc">port-sparc</a> and
  <a href="#port-sparc64">port-sparc64</a>.
  There is also a <a href="#port-m68k">port-m68k</a> list for
  questions related to all Motorola 68k based ports.
ENDLIST
PORTLIST(port-vax)
  Discussion of issues specific to NetBSD on Digital's VAX series of machines
  (NetBSD/vax).
ENDLIST
PORTLIST(port-x68k)
  Discussion of issues specific to NetBSD on Sharp's Japanese X68000/X68030
  machines (NetBSD/x68k).
  There is also a <a href="#port-m68k">port-m68k</a> list for
  questions related to all Motorola 68k based ports.
ENDLIST
  </ul>

</td><td valign=top>

  LISTSECTION(Obsolete lists)

  <center><b>(Archive only)</b></center>
  <p>

  <ul>
OLDLIST(amiga)
  This list was for discussing NetBSD/amiga issues.<br>
  <em>It has been obsoleted by <a href="#port-amiga">port-amiga</a>.</em>
ENDLIST
OLDLIST(amiga-dev)
  This list was for issues related to the further development of
  NetBSD/amiga.<br>
  <em>It has been obsoleted by <a href="#port-amiga">port-amiga</a>.</em>
ENDLIST
OLDLIST(amiga-x)
  This list was for those running X under NetBSD/amiga.<br>
  <em>It has been obsoleted by <a href="#port-amiga">port-amiga</a>.</em>
ENDLIST
OLDLIST(m68k)
  This list was for those interested in issues relevant to all 
  m68k-family CPU based ports.<br>
  <em>It has been obsoleted by <a href="#port-m68k">port-m68k</a>.</em>
ENDLIST
OLDLIST(macbsd-development)
  This list was for issues related to the further development of MacBSD.<br>
  <em>It has been obsoleted by <a href="#port-mac68k">port-mac68k</a>.</em>
ENDLIST
OLDLIST(macbsd-general)
  This list was for discussing MacBSD (NetBSD/mac68k) issues.<br>
  <em>It has been obsoleted by <a href="#port-mac68k">port-mac68k</a>.</em>
ENDLIST
  </ul>

</td></tr></table>
divert(4)
<h2><a name="descriptions">List descriptions</a></h2>
divert(9)
<hr>

<table><tr><td>
    <a href="../"><img
	src="../images/NetBSD-flag.gif" border=0
	width="91" height="42" alt=""></a>
  </td><td>
    <a href="../"><img
	src="../images/empty.gif" border=0
	width="1" height="1" alt="NetBSD ">Home Page</a>
</td></tr></table>

<hr> 
<address>
  <small>
  <a href="http://www.netbsd.org/cgi-bin/feedback.cgi">(Contact us)</a>
  $NetBSD: index.m4,v 1.138 2003/07/01 13:38:58 lukem Exp $<br>
  <a href="../Misc/disclaimer.html">Copyright &copy; 1994-2003
  The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED.</a>
  </small>
</address>

</body>
</html>
