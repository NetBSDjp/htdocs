#!/usr/bin/env perl

#	$NetBSD: data2html.pl,v 1.6 2001/11/06 17:39:37 abs Exp $
#
# Copyright (c) 1997 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This code is derived from software contributed to The NetBSD Foundation
# by David Brownlee / absolute <abs@mono.org>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. All advertising materials mentioning features or use of this software
#    must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
# 4. Neither the name of The NetBSD Foundation nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
# ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

# Generate split & all in one information files from 'vax-data'.
# Could be adapted to other data quite easily.
# Documentation would help...		<abs>
# Dynamically determining links from the text is going to get _really_ slow
# with large amounts of data, but just too convenient for now...

# use strict;
use Getopt::Std;

my(%opt);
&getopts('vq',\%opt);

$^W=1;
my(%file, $maxcol,$datafile,$start, %title2name, %title2section, %secdata);
my($head,$tail,$intro,@fhs,@sections,%name2title,%data);
$| = 1;
$maxcol = 80;
if( ! @ARGV )
    {
    print "Need data file\n";
    exit 3 ;
    }
$datafile = $ARGV[0];

$start = time;
&verbose("Read data\n");
$head = &read_file('head.txt') .
"\n<!-- Automatically generated by data2html.pl. DO NOT EDIT DIRECTLY -->\n\n";
$tail = &read_file('tail.txt');
$intro = &read_file('intro.txt');
&read_datafile($datafile);

&verbose("Output header and index to all files\n");
&output_all;
exit(0);

sub fail
    {
    print STDERR "\a",@_,"\n";
    exit(3);
    }

sub key2title
    {
    my($key) = @_;

    $key =~ s/-/ /g;
    $key =~ s/(.)/\U$1/;
    $key =~ s/ /&nbsp;/g;
    $key;
    }

sub output_all
    {
    my($section, $loop, $elapsed);

    $_ = $head;
    $_ =~ s/\$title/All in one page/g;
    $file{'full'} = $_;

    $_ = $head;
    $_ =~ s/\$title/Sections Index/g;
    $file{'sections'} = $_;

    $_ = $head;
    $_ =~ s/\$title/Introduction/g;
    $file{'index'} = $_;

    $file{'index'} .= qq#
<h2>This information is available in three forms</h2>
<ul>
  <li><a href="sections.html">Index page, with a separate page for each
							    section</a><br>
      Useful if you only want specific information and do not want to
      wait for everything to download.
  <li><a href="full.html">All in one page</a><br>
      Recommended if you want to use the inline links to flip between sections.
  <li><a href="$datafile">Plain text table</a><br>
      The text database used to generate the above two forms
</ul>
#;
    $file{'index'} .= $intro;

    foreach $section ( @sections )
	{
	$_ = $head;
	$_ =~ s/\$title/$secdata{$section}{'title'}/g;
	$file{$section} = $_;
	}

    foreach $section ( 'full', 'sections', @sections ) # Exclude index
	{ $file{$section} .= output_main_index($section); }

    &verbose("Output entries\n");
    for( $loop=0 ; $loop<@sections ; ++$loop )
	{
	$section = $sections[$loop];
	output_section_index($section, $loop?$sections[$loop-1]:undef,
					    $sections[$loop+1]);
	output_section_entries($section);
	$file{$section} .= $tail;
	}
    $file{'full'} .= $tail;
    $file{'sections'} .= $tail;

    my($file);
    foreach $file (keys %file)
	{
	print "$file: ";
	if (open(FILE, "$file.html"))
	    {
	    my($tag, $olddata);
	    while (<FILE>)
		{
		if (/(\$NetBSD[^\$]*\$)/)
		    {
		    $tag = $1;
		    last;
		    }
		}
	    seek(FILE, 0, 0);
	    read(FILE, $olddata, -s FILE);
	    close(FILE);
	    if ($tag) # substitute in existing CVS tag to reduce diffs
		{ $file{$file} =~ s/\$NetBSD[^\$]*\$/$tag/g; }
	    if ($file{$file} eq $olddata)
		{
		if (open(FILE, ">>$file.html")) # Update timestamp
		    { close(FILE); }
		print "Unchanged\n";
		next;
		}
	    }
	open(FILE, ">$file.html") || &fail("Cannot write $file.html: $!");
	print FILE $file{$file};
	close(FILE);
	print "Written\n";
	}

    if ($opt{'v'})
	{
	$elapsed = time-$start;
	print "Elapsed: ",int($elapsed/60)," min, ",$elapsed%60," sec.\n";
	}
    }

sub output_main_index
    {
    my($section) = @_;
    my($ref, $data, $secloop);

    if ($section eq 'full' || $section eq 'sections' )
	{
	$data = qq{<font size="+3"><a name="main_index">Main Index</a></font>\n};
	}
    else
	{ $data = qq{<font size="+3"><a name="main_index">Index</a></font>\n}; }
    $data .= qq{<ul>\n  <li><a href=".">Introduction page</a>\n};
    foreach $secloop ( @sections )
	{
	if ($section eq 'full')
	    { $ref = "#section:$secloop"; }
	else
	    { $ref = "$secloop.html#section:$secloop"; }
	$data .= qq#  <li><a href="$ref">$secdata{$secloop}{'title'}</a>\n#;
	}
    $data .= "</ul>\n\n";
    $data;
    }

sub output_section_entries
    {
    my($section,$fh)=@_;
    my($name,$entry,$text,$all,$right,$double,@double);

    &verbose("$secdata{$section}{'title'}\n");
    foreach $name (@{$secdata{$section}{'entries'}})
	{
	&verbose("    $name2title{$name}\n");
	$all = "\n\n<p><b><big><a name=\"$section:$name\">\n".
	     "$name2title{$name}</a></big></b>\n<small>".
	     "<a href=\"#section:$section\">".
	     "($secdata{$section}{'title'} index)</a></small>\n<table border=1>\n";
	$file{'full'} .= $all;
	$file{$section} .= $all;
	$all='';
	$right=0;
	foreach $entry (@{$entries{$name}})
	    {
	    $_ = $data{$name}{$entry};
	    s/<[^>]*>//g;
	    $double=length($_)>$maxcol;
	    push(@double,$double);
	    if( $double )
		{
		if( $right )
		    {
		    $double[$#double-1]=1;
		    $right=0;
		    }
		}
	    else
		{ $right^=1; }
	    }
	if( $right )
	    {
	    $double[$#double]=1;
	    $right=0;
	    }
	foreach $entry (@{$entries{$name}})
	    {
	    $text=$data{$name}{$entry};
	    $double=shift(@double);
	    if( ! $opt{'q'} )
		{
		foreach( keys %title2name )
		    {
		    if( $title2name{$_} ne $name )
			{
			$text =~ s+\b($_(|s|es))([,\.\?\)\s\n]|$)+<a href="#$title2section{$_}:$title2name{$_}">$1</a>$3+g;
			}
		    }
		}
	    if( ! $right || $double )
		{ $all.='<tr>'; }
	    $all.='<th width="1%" align=right>'.&key2title($entry).":</th>\n";
	    if( $double )
		{ $all.='<td colspan=3>'; }
	    else
		{ $all.='<td>'; }
	    $all.="$text</td>";
	    if( $right || $double)
		{ $all.='</tr>'; }
	    if( $double )
		{ $right=0; }
	    else
		{ $right^=1; }
	    $all.="\n";
	    }
	$all .="</table>";
	$file{'full'} .= $all;
	$all =~ s/(#)([^:]+)/$2.html#$2/g;
	$all =~ s/section\.html#section:([^"]+)/$1.html#section:$1/g;
	$file{$section} .= $all;
	}
    $file{'full'} .= "\n\n";
    $file{$section} .= "\n\n";
    }

sub output_section_index
    {
    my($section, $prev_section, $next_section)=@_;
    my($entry, $secloop, $ref, $name);

    foreach $secloop ('sections', 'full', @sections)
	{
	if ($secloop eq 'full')
	    { $ref = "#$section"; }
	elsif ($secloop eq $section || $secloop eq 'sections')
	    { $ref = "$section.html#$section"; }
	else
	    { next; }
	$file{$secloop} .= qq#<hr><table width="100%">
  <tr>
    <td><font size="+3"><a name="section:$section">$secdata{$section}{'title'}</a></font></td><td align=right valign=top>\n
    <table border=0><tr>\n#;

	if ($prev_section)
	    {
	    $file{$secloop} .= "    <td valign=top><small><a href=\"".
		    &section_url($prev_section, $secloop).
		    "\">(Previous - $secdata{$prev_section}{'title'})</a>".
		    "</small></td>\n";
	    }
	if ($next_section)
	    {
	    $file{$secloop} .= "    <td valign=top><small><a href=\"".
		    &section_url($next_section, $secloop).
		    "\">(Next - $secdata{$next_section}{'title'})</a>".
		    "</small></td>\n";
	    }
	$file{$secloop} .= "    <td valign=top><small>".
		    "<a href=\"#main_index\">(Main Index)".
		    "</a></small></td>\n";
	if ($secloop ne 'full' && $secloop ne 'sections' )
	    {
	    $file{$secloop} .= 
		"    <td valign=top><small>".
		"<a href=\"sections.html#main_index\">".
			"(All Indexes)</a></small></td>\n";
	    }
	$file{$secloop} .= "    </tr></table>\n\n".
		"  </td></tr>\n".
		"</table>\n\n<ul>\n";
	foreach $name (@{$secdata{$section}{'entries'}})
	    {
	    $file{$secloop} .= "  <li><a href=\"$ref:$name\">".
	    	$name2title{$name}."</a>\n";
	    }
	$file{$secloop} .= "</ul>\n\n";
	}
    }

sub read_datafile
    {
    my($file)=@_;
    my($key,$value,$name,$last_key);
    my(%sectioncount);

    open(DATA,$file) || &fail("Unable to open '$file': $!");
    while( <DATA> )
	{
	s/#.*//;
	if( ( ($key,$value) = /^([\S]+):\s*(\S.*)/ ) == 2 )
	    {
	    if( $key eq 'title' )
		{
		if( $value =~ /^(\S+)\s+(.*)$/ )
		    {
		    push(@sections, $1);
		    $secdata{$1}{'title'} = $2;
		    $title2section{$2} = 'section';
		    $title2name{$2} = $1;
		    $sectioncount{$1} = 0;
		    }
		else
		    { &fail("Cannot parse 'title:' at line $.\n"); }
		}
	    elsif ($key eq 'name')
		{
		$name=&safename($value);
		if( defined( $name2title{$name} ) )
		    { &fail("Duplicate name '$name' at line $.\n"); }
		$name2title{$name}=$value;
		$title2name{$value}=$name;
		}
	    elsif (defined $name)
		{
		if ($key eq 'section')
		    {
		    ++$sectioncount{$value};
		    if (!defined $secdata{$value})
			{ &fail("Unknown section '$value' at line $.\n"); }
		    push (@{$secdata{$value}{'entries'}}, $name);
		    $title2section{$name2title{$name}} = $value;
		    }
		else
		    { push (@{$entries{$name}}, $key); }
		$last_key = $key;
		$data{$name}{$key} = $value;
		}
	    else
		{ &fail("'name:' must be first data at line $.\n"); }
	    }
	elsif( /^\s+(\S.*)/ )
	    { $data{$name}{$last_key}.=" $1"; }
	}
    if( $opt{'v'} )
	{
	foreach( @sections )
	    { print "    $_ : $sectioncount{$_} entries\n"; }
	}
    close(DATA);
    }

sub read_file
    {
    my($file)=@_;
    my($data);

    $data='';
    open(FILE,$file) || &fail("Unable to read '$file': $!");
    read(FILE,$data,-s $file);
    close(FILE);
    $data =~ s/\$NetBSD[^\$]+\$/\$NetBSD\$/g;
    $data;
    }

sub safename
    {
    my($name)=@_;

    $name =~ y/A-Z/a-z/;
    $name =~ s/[^_a-z0-9]/_/g;
    $name;
    }

sub section_url
    {
    my($section, $secfrom)=@_;
    my($ref);

    if ($secfrom eq 'full')
	{ $ref = "#section:$section"; }
    else
	{ $ref = "$section.html#section:$section"; }
    $ref;
    }

sub verbose
    {
    $opt{'v'} && print @_;
    }