#!/usr/bin/env perl
#
# $Id: makefaq.pl,v 1.9 1999/03/01 08:58:14 abs Exp $
# Process *.faq files into indexed *.html files. (abs)
# 日本語サポート(sakamoto)
# Looks for these compulsary tags:
#	<SECTION>Text		Introduces a new section (before first <ENTRY>)
#	<ENTRY>tag Text		New entry, expanded to title and added to list
#	<ENTRYLINK>url Text	Link added to list, removed from main text
#	<LIST>			Include generated list of entries here.
#
# Plus these optional tags:
#	<HEADING>Text		Standard heading at top of document
#	<BASELINKS>		Standard links at base of document
#
# Continuation lines are understood (useful for the special tags)

use strict;
require("jcode.pl");
$^W=1;
my($verbose,$baselinks,$heading,$pathtodoc);

$verbose=1;

@ARGV == 2 || die("Usage: makefaq.pl infile outfile");

$baselinks='
<hr>
<table width="100%"><tr>
  <td>
    <table><tr>
      <td>
	<a href="$HOME/index.html">
	<img src="$HOME/images/NetBSD-banner.gif" alt="NetBSD&nbsp;Home"></a>
      </td><td>
	<a href="$HOME/index.html">ホームページ</a>
      </td>
    </tr></table>
  </td><td>
    <table><tr>
      <td>
	<a href="$DOCUMENTATION/index.html">
	<img src="$HOME/images/NetBSD-banner.gif"
	alt="NetBSD&nbsp;Documentation"></a>
      </td><td>
	<a href="$DOCUMENTATION/index.html">ドキュメントとFAQ</a>
      </td>
    </tr></table>
  </td>
</tr></table>
';

$heading='
<table><tr><td>
<a href="$HOME/Misc/daemon-copy.html">
<img align="center" src="$HOME/images/BSD-demon.gif" alt="BSD demon"></a>
</td><td align=center>
<h1>NetBSD ドキュメント:</h1>
<h1>$TITLE</h1>
</td></tr></table>
<p>
';

# XXX Should DTRT with faqs not under Documentation
if( $0 !~ m#(.*)/makefaq.pl# )
    { &fail("Unable to extract path to makefaq.pl from '$0'"); }
$pathtodoc=$1;
$heading   =~ s#\$HOME#$pathtodoc/..#g;
$baselinks =~ s#\$HOME#$pathtodoc/..#g;
$baselinks =~ s#\$DOCUMENTATION#$pathtodoc#g;
$baselinks = &jcode'to('jis', $baselinks);
$heading = &jcode'to('jis', $heading);

&makefaq(@ARGV);
exit;

sub makefaq
    {
    my($infile,$outfile)=@_;
    my($data,$entries,$section,$href,$header,$list,$pre,%tags);

    $list="
<!-- THIS FILE GENERATED FROM '$infile'.
     DO _NOT_ EDIT THIS FILE DIRECTLY - EDIT '$infile' AND RUN 'make'.
     -->
";

    $data='';
    $entries=0;
    open(FILE,$infile) || die("Unable to open '$infile': $!");
    foreach( <FILE> )
	{
	if( defined($pre) )
	    { $_=$pre.$_; $pre=undef; }
	if( substr($_,-2) eq "\\\n" )
	    {
	    s/\\\n$//;
	    $pre=$_;
	    next;
	    }

	if( m#^<ENTRYLINK>\s*(.+\S)# )
	    {
	    ++$entries;
	    if( !defined($section) )
		{ &fail("<ENTRYLINK> before <SECTION> tag"); }
	    $_=$1;
	    if( ! m#^(\S+)\s+(.*)# )
		{ &fail("Invalid <ENTRYLINK> ($_), not (\S+)\s+(.*)"); }
	    $href=$1;
	    $header=$2;

	    $_ = '';
	    $list.="<li><a href=\"$href\">$header</a></li>\n";
	    &verbose("\t$href\n");
	    }
	elsif( m#^<ENTRY>\s*(.+\S)# )
	    {
	    ++$entries;
	    if( !defined($section) )
		{ &fail("<ENTRY> before <SECTION> tag"); }
	    $_=$1;
	    if( ! /^([-a-z0-9_.+]+)\s+(.*)/ )
		{ &fail("Invalid <ENTRY> ($_), not ([-a-z0-9_.+]+)\s+(.*)"); }
	    $href=$1;
	    $header=$2;
	    if( defined($tags{$href}) )
		{ &fail("Duplicate name tag '$href'"); }
	    $tags{$href}=1;

	    $_ = "<hr><h3><a name=\"$href\">$header</a>\n<font size=\"-1\">".
				    "(<a href=\"#top\">top</a>)</font></h3>\n";
	    $list.="<li><a href=\"#$href\">$header</a></li>\n";
	    &verbose("\t$href\n");
	    }
	elsif( m#^<SECTION>\s*(.+\S)# )
	    {
	    if( defined($section) )
		{ $list.="</ul>\n"; }
	    $section=$1;
	    $list.="<h2>$section</h2>\n<ul>\n";
	    $_="<hr>\n<h2>$section</h2>";
	    &verbose("    $section\n");
	    }
	s#([\w.+]+)\((\d)\)#<a href="http://www.flame.org/cgi-bin/uncgi/hman/$1;$2">$1($2)</a>#g;
	$data.=$_;
	}
    close(FILE);
    $list.="</ul>\n";
    if( $data !~ s/<LIST>/$list/ )
	{ &fail("Unable to locate <LIST> tag"); }
    $data !~ s/<BASELINKS>/$baselinks/;
    if( $data =~ /<HEADING>\s*(.*)/ )
	{
	my($title);
	$title=$1;
	$heading=~s#\$TITLE#$title#g;
	$data=~s/<HEADING>.*/$heading/;
	}
    open(FILE,">$outfile") || die("Unable to write '$outfile': $!");
    print FILE $data;
    close(FILE);
    print "$entries entr",($entries==1)?'y':'ies',"\n";
    }

sub fail
    {
    print STDERR "ABORTING: ",@_,"\n";
    exit 3
    }

sub verbose
    { $verbose && print @_; }
