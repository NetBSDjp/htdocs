#!/usr/bin/env perl
#	$NetBSD $
#
# Reads index.act-template, and inserts and entries of the form
# @@@ENTRY: whatever            # comments are possible
# html files containing <IMG> tags are expected as $entry-img.html
# html files containing descriptions are expected as $entry-txt.html


$pic_left=0; 
$debug=0;

sub printfile {
    local($file)=@_;
    open(F, "$file") or die "Cannot open $file for reading: $!\n";
    while(<F>) {
	s/<!--.*//g;
	print "$_";
    }
    close(F);
}

while(<>) {

    if (/\@\@\@ENTRY: (\S*)\s+(\S*)/) {
	$entry=$1;
	$type=$2;

	print "\n<tr>\n";

        print "<td bgcolor=\"#000000\"><img src=\"../../images/empty.gif\"";
        print " width=\"1\" height=\"1\" alt=\" \"></td>\n";
	print "<td bgcolor=\"#e8e8e8\" align=\"center\">$type</td>\n";
        print "<td bgcolor=\"#000000\"><img src=\"../../images/empty.gif\"";
        print " width=\"1\" height=\"1\" alt=\" \"></td>\n";
	print "<td>\n";
	print "<tt>$entry:</tt><BR>\n"
	    if $debug;
	print ("\n<table cellpadding=\"5\"><tr>");
	
	if ($pic_left) {
	    print "<td>";
			  printfile "$entry-img.html"; print "</td>";
	    print "<td><a name=\"$entry\"></a>"; 
			  printfile "$entry-txt.html"; print "</td>";
	    
	    $pic_left=0;
	} else {
	    print "<td><a name=\"$entry\"></a>";
			  printfile "$entry-txt.html"; print "</td>";
	    print "<td>"; printfile "$entry-img.html"; print "</td>";
	    
	    $pic_left=1;
	}

	print ("</tr></table>\n\n</td>" .
	       "\n"
	       );

        print "<td bgcolor=\"#d8d8d8\"><img src=\"../../images/empty.gif\"";
        print " width=\"1\" height=\"1\" alt=\" \"></td>\n";

        print ("</tr>\n\n");
        print "<tr>\n";
        print "<td bgcolor=\"#000000\"><img src=\"../../images/empty.gif\"";
        print " width=\"1\" height=\"1\" alt=\" \"></td>\n";
        print "<td bgcolor=\"#000000\"><img src=\"../../images/empty.gif\"";
        print " width=\"1\" height=\"1\" alt=\" \"></td>\n";
        print "<td bgcolor=\"#000000\"><img src=\"../../images/empty.gif\"";
        print " width=\"1\" height=\"1\" alt=\" \"></td>\n";
        print "<td bgcolor=\"#d8d8d8\"><img src=\"../../images/empty.gif\"";
	print " width=\"1\" height=\"1\" alt=\" \"></td>\n";
        print "<td bgcolor=\"#d8d8d8\"><img src=\"../../images/empty.gif\"";
	print " width=\"1\" height=\"1\" alt=\" \"></td>\n</tr>\n";

    } else {
	print "$_";
    }
}
