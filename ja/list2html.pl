#!/usr/bin/env perl
#
# NetBSD Id: list2html.pl,v 1.19 1999/07/18 07:21:14 abs Exp $
# Process *.list files into indexed *.html files. (abs)
#  $Id$
#  Japanese support (sakamoto)
# Looks for these compulsary tags:
#	<LIST>			Include generated list of entries here.
#	<SECTION>Text		Introduces new section, before DATE or ENTRY
#	<ENDLIST>		Optional tag for end of all special entries
#
# Plus these optional tags: (You will probably want to use <DATE> or <ENTRY>)
#	<DATE>tag date Text	Change entry, expanded to title & added to list
#	<ENTRY>tag Text		New entry, expanded to title and added to list
#	<ENTRYLINK>url Text	Link added to list, removed from main text
#	<HEADING>Text		Standard heading at top of document
#	<BASELINKS>		Standard links at base of document
#	<TROW>Text: Text	Table row, with two text fields
#
# Continuation lines are understood (useful for the special tags)
#
# Additional links:
#	([\w.+]+)\((\d)\) -> manpages		eg: ls(1)
#	<([-\w.]+@[-\w.]+)> -> email address	eg: <user@host>
#
# (c) 1999 DKBrownlee. All rights reserved. This file may be used to update
# the information on the NetBSD website. If you want to use it for any other
# purpose, ask me first.. abs@mono.org
#
# Should probably 'remember' '$NetBSD' tags from output files

use strict;
require 'getopts.pl';
$^W=1;
use vars('$opt_a','$opt_h','$opt_m');
my($verbose,%extras,$months_previous);

$months_previous=9;	# previous months to display for DATE entries

if (!&Getopts('a:m:h') || $opt_h || @ARGV != 2 )

    {
    print "list2html.pl [opts] infile outfile
[opts]	-a xxx	Define 'arch=xxx' when linking to manpages
	-m xxx	Set months to display for <DATE> (default $months_previous)
	-h	This help.

list2html.pl processes .list files into .html, parsing various special tags. 
.list files are intended to reduce the effort required to maintain files such
as FAQs, and change logs. More details given at the start of list2html.pl.
";
    exit;
    }

$verbose=1;
if ($opt_m)
    { $months_previous=$opt_m; }
$months_previous=&get_minmonth($months_previous);

%extras=(
	'<HEADING>\s*(.*)','
<table><tr><td>
<a href="$HOME/Misc/daemon-copy.html">
<img align="center" src="$HOME/images/BSD-demon.gif" border=0
width=146 height=129 alt="BSD demon"></a>
</td><td align=center>
<h1>NetBSD ドキュメンテーション:</h1>
<h1>$TITLE</h1>
</td></tr></table>
<p>
',	'<BASELINKS>','
<table width="100%"><tr>
  <td>
    <table><tr>
      <td>
	<a href="$HOME/index.html">
        <img src="$HOME/images/NetBSD-banner.gif" width=91 height=42
	    alt="NetBSD&nbsp;Home"></a>
      </td><td>
	<a href="$HOME/index.html">ホームページ</a>
      </td>
    </tr></table>
  </td><td>
    <table><tr>
      <td>
	<a href="$DOCUMENTATION/index.html"> <img
	    src="$HOME/images/NetBSD-banner.gif" width=91 height=42
	    alt="NetBSD&nbsp;Documentation"></a>
      </td><td>
	<a href="$DOCUMENTATION/index.html">ドキュメントと FAQ</a>
      </td>
    </tr></table>
  </td>
</tr></table>
'
);

# XXX Should DTRT with faqs not under Documentation

&makelist(@ARGV,&extras_generate(%extras));
exit;

sub check_date
    {
    my($date)=@_;
    my($month,$when);
    my(%months)=('Jan' => 1,	'Feb' => 2,	'Mar' => 3,
		 'Apr' => 4,	'May' => 5,	'Jun' => 6,
		 'Jul' => 7,	'Aug' => 8,	'Sep' => 9,
		 'Oct' => 10,	'Nov' => 11,	'Dec' => 12 );

    if ($date !~ /(\S+)\s*(\d+)/)
	{ &fail("Unable to parse date '$date'"); }
    if (!defined($month=$months{$1}))
	{
	&warn("Unable to parse month '$1'");
	$month=12;
	}
    $when=sprintf("%04d%02d",$2,$month);
    ( $when>$months_previous );
    }

sub extras_generate
    {
    my(%extras)=@_;
    my($pathtodoc,$str);

    if( $0 !~ m#(.*)/[^/]+.pl# )
	{ &fail("Unable to extract path from '$0'"); }
    $pathtodoc="$1/Documentation";
    foreach $str ( keys %extras )
	{
	$extras{$str} =~ s#\$HOME#$pathtodoc/..#g;
	$extras{$str} =~ s#\$DOCUMENTATION#$pathtodoc#g;
	}
    (%extras);
    }

sub extras_process
    {
    my($data,%extras)=@_;
    my($key,$title,$value);

    foreach $key ( keys %extras )
	{
	$value=$extras{$key};
	if( $data =~ /$key/ )
	    {
	    if( defined($1) )
		{
		$title=$1;
		$value=~s#\$TITLE#$title#g;
		}
	    $data=~s/$key.*/$value/;
	    }
	}
    $data;
    }

sub fail
    {
    print STDERR "ABORTING: ",@_,"\n";
    exit 3
    }

sub get_minmonth
    {
    my($monthsback)=@_;
    my($year,$month);

    ($month,$year)=(localtime(time))[4,5];

    ++$month;
    $month-=$monthsback;
    while( $month<1 )
	{
	$month+=12;
	--$year;
	}
    sprintf("%04d%02d",$year+1900,$month);
    }

# Collect $list containing forward links as we go. In general each entry will
# generate something in $list and some expanded data in the main $data.
#
sub makelist
    {
    my($infile,$outfile,%extras)=@_;
    my($data,$section,$href,$header,$list,$pre,%tags,$date_month);
    my($date_num,$date_num_used,$entry_num,$ignore,$in_entry,$endlist);
    my($title_font) = "<font face=\"helvetica, arial, sans-serif\">";
    my($end_title_font) = "</font>";

    $list='';

    $data=$date_month='';
    $entry_num=$date_num=$date_num_used=0;
    open(FILE,"nkf -e $infile|") || die("Unable to open '$infile': $!");
    foreach( <FILE> )
	{
	if( defined($pre) )		# Handle continuation lines
	    { $_=$pre.$_; $pre=undef; }

	if( substr($_,-2) eq "\\\n" )	# Handle continuation lines
	    {
	    s/\\\n$//;
	    $pre=$_;
	    next;
	    }

	if( m#^<DATE>\s*(.+\S)# )	# Changes
	    {
	    my($year,$month,$link);

	    if ($in_entry)
		{
		$data.="</dd></dl></p>\n";
		$in_entry=undef;
		}
	    $ignore=undef;
	    ++$date_num;
	    $header=$1;
	    if( $header !~ /^([-a-z0-9_.+]+)\s+(\d+) (\S+) (\d+) - (\S.*)/ )
		{ &fail("'$header' not in expected 'date - event' format"); }
	    $href=$1;
	    $header="$5 ($2 $3)";
	    $month="$3 $4";
	    $link=$5;
	    if( defined($tags{$href}) )
		{ &fail("Duplicate name tag '$href'"); }
	    $tags{$href}=1;
	    if (!&check_date($month))
		{ $ignore=1; }
	    else
		{
		$_='';
		++$date_num_used;
		if( $month ne $date_month )
		    {
		    if( $date_month ne '' )
			{ $list.="</ul>$end_title_font\n"; }
		    $list.="<h3>$month</h3>\n$title_font<ul>\n";
		    $_.="<hr><h2>$month</h2><hr>\n";
		    $date_month=$month;
		    }

		$_.= "<p><dl><dt>\n$title_font".
			"<h3><a name=\"$href\">$header</a> <font size=\"-1\">".
			"(<a href=\"#top\">top</a>)</font></h3>\n".
			"$end_title_font\n</dt><dd>";
		$list.="<li><a href=\"#$href\">$link</a></li>\n";
		$in_entry=1;
		}
	    }

	elsif( m#^<ENTRY>\s*(.+\S)# )
	    {
	    if ($in_entry)
		{
		$data.="</dd></dl></p>\n";
		$in_entry=undef;
		}
	    
	    $ignore=undef;
	    ++$entry_num;
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

	    $_ = "<p><dl><dt>\n$title_font".
		    "<h3><a name=\"$href\">$header</a>\n<font size=\"-1\">".
		    "(<a href=\"#top\">top</a>)</font></h3>$end_title_font\n".
		    "</dt><dd>\n";
	    $list.="<li><a href=\"#$href\">".
		    "$header".
		    "</a></li>\n";
	    $in_entry=1;
	    &verbose("\t$href\n");
	    }

	elsif( m#^<ENTRYLINK>\s*(.+\S)# )
	    {
	    $ignore=undef;
	    ++$entry_num;
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

	elsif( m#^<SECTION>\s*(.+\S)# )
	    {
	    if ($in_entry)
		{
		$data.="</dd></dl></p>\n";
		$in_entry=undef;
		}
	    else # In case no entries
		{ $data =~ s#<hr>\n<h2>.*</h2><hr>\n*$##; }
	    $ignore=undef;
	    if( defined($section) )
		{
		$list.="</ul>$end_title_font\n";
		$section=$1;
		$list.="<h2>$section</h2>\n$title_font<ul>\n";
		}
	    else
		{	# If we have never seen <SECTION> remember top link!
		$section=$1;
		$list.="<h2><a name=\"top\">$section</a></h2>\n".
			"$title_font<ul>\n";
		}
	    $_="<hr>\n<h2>$section</h2><hr>";
	    &verbose("    $section\n");
	    }
	elsif( m#^<TROW>\s*(.*)# )
	    {
	    $_=$1;
	    if( ! m#^([^:]+:)\s+(.*)# )
		{ &fail("<TROW> should match ([^:]+:)\s+(.*)"); }
	    $ignore=undef;
	    $_ = "<tr><th valign=top align=right>$1</th>\n    <td>$2</td></tr>";
	    }

	elsif( m#^<ENDLIST># )
	    {
	    if ($in_entry)
		{
		$data.="</dd></dl></p>\n";
		$in_entry=undef;
		}
	    if ($endlist)
		{ &fail("Duplicate <ENDLIST>"); }
	    $endlist=1;
	    $ignore=undef;
	    $_="<hr>\n";
	    }

	# Foul hack to avoid incorrect installboot(8) references
	# May fail valid links also. Only until i386 vs alpha manpage resolved.
	if( ! $ignore )
	    { $data.=&sub_external_links($_); }
	}

    close(FILE);
    $list.="</ul>$end_title_font\n";
    if (!$endlist)
	{ &fail("Missing <ENDLIST> tag"); }
    if ($data !~ s/<LIST>/$list/)
	{ &fail("Unable to locate <LIST> tag"); }
    $_="\n\n<!-- DO NOT EDIT THIS FILE. EDIT '$infile' AND RUN 'make' -->\n";
    if ($data !~ s/(<head[^>]*>)/$1$_/i)
	{ &fail("Unable to locate <head> tag"); }

    open(FILE,"|nkf -j > $outfile") || die("Unable to write '$outfile': $!");
    print FILE &extras_process($data,%extras);
    close(FILE);
    if( $date_num )
	{
	print "$date_num date entr",($date_num==1)?'y':'ies';
	if ($date_num_used != $date_num)
	    { print " ($date_num_used used)"; }
	print ".\n";
	}
    if( $entry_num )
	{ print "$entry_num entr",($entry_num==1)?'y':'ies',".\n"; }
    }

sub sub_external_links
    {
    my($text)=@_;
    my($link);

    $link='http://www.flame.org/cgi-bin/uncgi/hman?';

    if ($opt_a)
	{ $link.="arch=$opt_a&amp;"; }

    # Man page references. As of 1.4 matches every page except '[' and 'w'.
    #
    $text =~
	s#([a-zA-Z_][-\w.+]*[\w+])\((\d)\)#<a href="${link}page=$1&amp;sect=$2">$1($2)</a>#g;
    
    # Expand <user@host> email addresses
    #
    $text =~ s#<([-\w.]+@[-\w.]+)>#<a href="mailto:$1">&lt;$1&gt;</a>#g;
    $text;
    }

sub verbose
    { $verbose && print @_; }

sub warn
    { print "WARNING: ",@_; }
