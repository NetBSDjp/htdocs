#!/usr/bin/env perl
#
# $Id: list2html.pl,v 1.41 2000/01/24 15:23:35 soren Exp $
# Process *.list files into indexed *.html files. (abs)
# Looks for these compulsary tags:
#	<LIST>			Include generated list of entries here.
#	<SECTION>Text		Introduces new section
#	</LIST>			Mark end of all special entries
#
# Plus these optional tags: (You will probably want to use <DATE> or <ENTRY>)
#	<DATE>tag date Text	Change entry, expanded to title & added to list
#	<ENTRY>tag Text		New entry, expanded to title and added to list
#	<ENTRYLINK>url Text	Link added to list, removed from main text
#	<HEADING>Text		Standard heading at top of document
#	<TROW>Text: Text	Table row, with two text fields
#				NOTE: <TROW> will automatically continue
#				until a link containing </table>
#	<HOMELINK>		Add flag link to NetBSD home page
#	<DOCLINK>		Add flag links to NetBSD home page & docs top
#	<DEVLINK>		Add flag links to NetBSD home page & developers
#
# Continuation lines are understood (useful for the special tags)
#
# Additional links:
#	([\w.+]+)\((\d)\)	-> manpages		eg: ls(1)
#	<([-\w.]+@[-\w.]+)>	-> email address	eg: <user@host>
#	<PKGSRC>category/name	-> link to pkgsrc README.html
#	<CURRENTSRC>path	-> link to source file/dir in -current
#	<URL>[^\s<]+[^<\s.]	-> Insert link to URL
#
# NOTE: Update htdocs/developers/htdocs.list when adding features.
#
#   (c) 1999, 2000 DKBrownlee. All rights reserved. This file may be used to
#	update the information on the NetBSD website. If you want to use it
#	for any other purpose, ask me first.. abs@mono.org
#

use strict;
use Getopt::Std;
$^W=1;
my($verbose,%extras,$months_previous);
my($version,%opt,%pkgname);

# List of pkgsrc names to 'human preferred' forms
%pkgname = qw(kde KDE gimp GIMP gnome GNOME xsane XSane);

$months_previous=9;	# previous months to display for DATE entries

$version='$Revision: 1.41 $';
$version =~ /([\d.]+)/ && ($version=$1);

if (!&getopts('a:m:hV',\%opt) || $opt{'h'} || ( !$opt{'V'} && @ARGV != 2) )

    {
    print "list2html.pl [opts] infile outfile
[opts]	-a xxx	Define 'arch=xxx' when linking to manpages
	-m xxx	Set months to display for <DATE> (default $months_previous)
	-h	This help.
	-V	Display version and exit ($version - David Brownlee/abs)

list2html.pl processes .list files into .html, parsing various special tags.
.list files are intended to reduce the effort required to maintain files such
as FAQs, and change logs. More details given at the start of list2html.pl.
";
    exit;
    }
if ($opt{'V'})
    { print "$version\n"; exit; }

$verbose=1;
if ($opt{'m'})
    { $months_previous=$opt{'m'}; }
$months_previous=&get_minmonth($months_previous);

%extras=(

'<HEADING>\s*(.*)','
<table><tr><td>
<a href="$HOME/Misc/daemon-copy.html">
<img align="center" src="$HOME/images/BSD-demon.jpg" border=0
width=146 height=129 alt="BSD demon"></a>
</td><td align=center>
<h1>NetBSD Documentation:</h1>
<h1>$SUB1</h1>
</td></tr></table>
<p>
',

'<HOMELINK>', '
<table><tr>
  <td>
    <a href="$HOME/">
    <img src="$HOME/images/NetBSD-banner.gif" border=0 alt=""></a>
  </td><td>
    <font face="helvetica, arial">
    <a href="$HOME/">
    <img src="$HOME/images/empty.gif" border=0
	    alt="NetBSD ">Home Page</a>
    </font>
  </td>
</tr></table>
',

'<DEVLINK>', '
<table width="100%"><tr>
<td>
  <table><tr>
  <td>
    <a href="$HOME/">
    <img src="$HOME/images/NetBSD-banner.gif" border=0 alt=""></a>
  </td><td>
    <font face="helvetica, arial">
    <a href="$HOME/">
    <img src="$HOME/images/empty.gif" border=0
     alt="NetBSD ">Home Page</a>
    </font>
  </td>
  </tr></table>
</td><td>
  <table><tr>
  <td>
    <a href="$DEVELOPERS">
    <img src="$HOME/images/NetBSD-banner.gif" border=0 alt=""></a>
  </td><td>
    <font face="helvetica, arial">
    <a href="$DEVELOPERS">
    <img src="$HOME/images/empty.gif" border=0
     alt="NetBSD ">Developer Documentation</a>
    </font>
  </td>
  </tr></table>
</td>
</table>
',

'<DOCLINK>', '
<table width="100%"><tr>
<td>
  <table><tr>
  <td>
    <a href="$HOME/">
    <img src="$HOME/images/NetBSD-banner.gif" border=0 alt=""></a>
  </td><td>
    <font face="helvetica, arial">
    <a href="$HOME/">
    <img src="$HOME/images/empty.gif" border=0
     alt="NetBSD ">Home Page</a>
    </font>
  </td>
  </tr></table>
</td><td>
  <table><tr>
  <td>
    <a href="$DOCUMENTATION">
    <img src="$HOME/images/NetBSD-banner.gif" border=0 alt=""></a>
  </td><td>
    <font face="helvetica, arial">
    <a href="$DOCUMENTATION">
    <img src="$HOME/images/empty.gif" border=0
     alt="NetBSD ">Documentation top level</a>
    </font>
  </td>
  </tr></table>
</td>
</table>
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

sub extract_tags
    {
    my($file,@tags)=@_;
    my($tag,%map);

    if (!open(FILE,$file))
	{ return; }
    while (<FILE>)
	{
	foreach $tag (@tags)
	    {
	    if ( /($tag)/ )
		{ $map{$tag}=$1; }
	    }
	}
    close(FILE);
    %map;
    }

sub extras_generate
    {
    my(%extras)=@_;
    my($pathtodoc, $pathtodev, $str, $home);

    if ($0 !~ m#(.*)/[^/]+.pl#)
	{ &fail("Unable to extract path from '$0'"); }
    $home="$1";
    $pathtodoc="$home/Documentation";
    $pathtodev="$home/developers";
    foreach $str ( keys %extras )
	{
	$extras{$str} =~ s#\$HOME#$home#g;
	$extras{$str} =~ s#\$DEVELOPERS#$pathtodev#g;
	$extras{$str} =~ s#\$DOCUMENTATION#$pathtodoc#g;
	}
    (%extras);
    }

sub extras_process
    {
    my($data, %extras)=@_;
    my($key, $sub1, $sub2, $value);

    foreach $key ( keys %extras )
	{
	$value=$extras{$key};
	if ($data =~ /$key/)
	    {
	    ($sub1, $sub2) = ($1, $2);
	    if (defined($sub1))
		{ $value=~s#\$SUB1#$sub1#g; }
	    if (defined($sub2))
		{ $value=~s#\$SUB2#$sub2#g; }
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
    while ($month<1)
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
    my($date_num,$date_num_used,$entry_num,$ignore,$in_entry,$in_section);
    my($endlist);
    my($title_font) = "<font face=\"helvetica, arial, sans-serif\">";
    my($end_title_font) = "</font>";
    my(%rcsmap)=&extract_tags($outfile,'\$NetBSD.*\$');
    my($rcstag, $in_trow);

    $list='';

    $data=$date_month='';
    $entry_num=$date_num=$date_num_used=0;
    open(FILE,$infile) || die("Unable to open '$infile': $!");
    foreach( <FILE> )
	{
	foreach $rcstag (%rcsmap)
	    { s/$rcstag/$rcsmap{$rcstag}/; }
	if (defined($pre))		# Handle continuation lines
	    { $_=$pre.$_; $pre=undef; }

	if (substr($_,-2) eq "\\\n")	# Handle continuation lines
	    {
	    s/\\\n$//;
	    $pre=$_;
	    next;
	    }

	if (m#^<DATE>\s*(.+\S)#)	# Changes
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
	    if ($header !~ /^([-a-z0-9_.+]+)\s+(\d+) (\S+) (\d+) - (\S.*)/)
		{ &fail("'$header' not in expected 'date - event' format"); }
	    $href=$1;
	    $header="$5 ($2 $3)";
	    $month="$3 $4";
	    $link=$5;
	    if (defined($tags{$href}))
		{ &fail("Duplicate name tag '$href'"); }
	    $tags{$href}=1;
	    if (!&check_date($month))
		{ $ignore=1; }
	    else
		{
		$_='';
		++$date_num_used;
		if ($month ne $date_month)
		    {
		    if ($date_month ne '')
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

	if (m#^<ENTRY>\s*(.+\S)#)
	    {
	    if (! $in_section )
		{ $list.="$title_font<ul>\n"; }	# Start title list

	    if ($in_entry)
		{
		$data.="</dd></dl></p>\n";
		$in_entry=undef;
		}

	    $ignore=undef;
	    ++$entry_num;
	    $_=$1;
	    if (! /^([-a-z0-9_.+,]+)\s+(.*)/)
		{ &fail("Invalid <ENTRY> ($_), not ([-a-z0-9_.+,]+)\s+(.*)"); }
	    $href=$1;
	    $header=$2;
	    if (defined($tags{$href}))
		{ &fail("Duplicate name tag '$href'"); }
	    $tags{$href}=1;

	    $_ = "<p><dl><dt>\n$title_font".
		    "<h3><a name=\"$href\">$header</a>\n<font size=\"-1\">".
		    "(<a href=\"#top\">top</a>)</font></h3>$end_title_font\n".
		    "</dt><dd>\n";
	    $list.="<li><a href=\"#$href\">".
		    "$header".
		    "</a></li>\n";
	    $in_entry = $in_section = 1;
	    &verbose("\t$href\n");
	    }

	if (m#^<ENTRYLINK>\s*(.+\S)#)
	    {
	    if ( ! $in_section )
		{ $list.="$title_font<ul>\n"; }	# Start title list

	    $ignore=undef;
	    ++$entry_num;
	    $_=$1;
	    if (! m#^(\S+)\s+(.*)#)
		{ &fail("Invalid <ENTRYLINK> ($_), not (\S+)\s+(.*)"); }
	    $href=$1;
	    $header=$2;
	    $_ = '';
	    $list.="<li><a href=\"$href\">$header</a></li>\n";
	    $in_section = 1;
	    &verbose("\t$href\n");
	    }

	if (m#^<SECTION>\s*(.+\S)#)
	    {
	    if ($in_entry)
		{
		$data.="</dd></dl></p>\n";
		$in_entry=undef;
		}
	    else # In case no entries
		{ $data =~ s#<hr>\n<h2>.*</h2><hr>\n*$##; }
	    $ignore=undef;
	    if (defined($section))
		{
		$list.="</ul>$end_title_font\n";
		$section=$1;
		$list.="<h2>$section</h2>\n";
		$list.="$title_font<ul>\n";	# Start title list
		}
	    else
		{	# If we have never seen <SECTION> remember top link!
		$section=$1;
		$list.="<h2><a name=\"top\">$section</a></h2>\n".
			"$title_font<ul>\n";
		}
	    $_="<hr>\n<h2>$section</h2><hr>";
	    $in_section = 1;
	    &verbose("    $section\n");
	    }

	if (m#^<TROW>\s*(.*)#)
	    {
	    $_=$1;
	    if (! m#^([^:]+:)\s+(.*)#)
		{ &fail("<TROW> should match ([^:]+:)\s+(.*)"); }
	    $ignore=undef;
	    $_ = "<tr><th valign=top align=right>$1</th>\n  <td>$2</td></tr>\n";
	    $in_trow = 1;
	    }
	elsif ($in_trow)
	    {
	    if (m#</table>#i)
		{ $in_trow = 0; }
	    else
		{			# Append to last <TROW>
		substr($data, -11, 0) = ' '.&sub_external_links($_);
		$_ = '';
		}
	    }

	if (m#^</LIST>#)
	    {
	    if ($in_entry)
		{
		$data.="</dd></dl></p>\n";
		$in_entry=undef;
		}
	    if ($endlist)
		{ &fail("Duplicate </LIST>"); }
	    $endlist=1;
	    $ignore=undef;
	    $_="<hr>\n";
	    }

	if (! $ignore)
	    { $data.=&sub_external_links($_); }
	}

    close(FILE);
    $list.="</ul>$end_title_font\n";
    if (!$endlist)
	{ &fail("Missing </LIST> tag"); }
    if ($data !~ s/<LIST>/$list/)
	{ &fail("Unable to locate <LIST> tag"); }
    $_="\n\n<!-- DO NOT EDIT THIS FILE. EDIT '$infile' AND RUN 'make' -->\n";
    if ($data !~ s/(<head[^>]*>)/$1$_/i)
	{ &fail("Unable to locate <head> tag"); }

    open(FILE,">$outfile") || die("Unable to write '$outfile': $!");
    print FILE &extras_process($data,%extras);
    close(FILE);
    if ($date_num)
	{
	print "$date_num date entr",($date_num==1)?'y':'ies';
	if ($date_num_used != $date_num)
	    { print " ($date_num_used used)"; }
	print ".\n";
	}
    if ($entry_num)
	{ print "$entry_num entr",($entry_num==1)?'y':'ies',".\n"; }
    }

sub sub_external_links
    {
    my($text)=@_;
    my($link);

    $link='http://www.flame.org/cgi-bin/uncgi/hman?';

    if ($opt{'a'})
	{ $link.="arch=$opt{'a'}&amp;"; }

    # Man page references. As of 1.4 matches every page except '[' and 'w'.
    #
    $text =~
	s#([a-zA-Z_][-\w.+]*[\w+])\((\d)\)#<a href="${link}page=$1&amp;sect=$2">$1($2)</a>#g;

    # Expand <CURRENTSRC>path
    #
    if ($text =~ m#<CURRENTSRC>([^\s<>]+\w)#)
	{
        my($path);

	$path = $1;
	$path =~ s#^/##;
	$path =~ s#^usr/##;
	$path =~ s#^src/##;
	if ($path =~ m#^(sys|share|gnu)#)
	    { $path = $1."src/$path"; }
	elsif ($path !~ m#^(doc|xsrc)#)
	    { $path = "basesrc/$path"; }
	$text =~ s#<CURRENTSRC>([^\s<>]+\w)#<a href="http://cvsweb.netbsd.org/bsdweb.cgi/$path?rev=HEAD&content-type=text/x-cvsweb-markup">$1</a>#;
	}

    # Expand <URL>[^\s<]+[^<\s.]
    $text =~ s#<URL>([^\s<]+[^<\s.])#<a href="$1">$1</a>#g;

    # Expand <PKGSRC>category/name entries
    #
    while ( $text =~ m#<PKGSRC>((\w+/|)([^\s<>]+\w))#)
	{
        my($n) = $3;
	if (defined($pkgname{$n}))
	    { $n = $pkgname{$n}; }
        $text =~ s#<PKGSRC>((\w+/|)([^\s<>]+\w))#<a href="ftp://ftp.netbsd.org/pub/NetBSD/packages/pkgsrc/$1/README.html">$n</a>#;
	}

    # Expand <user@host> email addresses
    #
    $text =~ s#<([-\w.]+@[-\w.]+)>#<a href="mailto:$1">&lt;$1&gt;</a>#g;

    $text;
    }

sub verbose
    { $verbose && print @_; }

sub warn
    { print "WARNING: ",@_; }
