#!/usr/bin/env perl
#
# $Id: comment2ja.pl,v 1.3 1999/08/23 11:02:26 sakamoto Exp $
#

$|=1;
my (%category, %packages);
my ($pkgsrc) = shift;
my ($wwwdir) = shift;
my ($mode) = 0755;
my (%diff);
my ($tmpfile) = "/tmp/comment2ja_$$";

if (! $pkgsrc || ! $wwwdir) {die "comment2ja.pl pkgsrcdir wwwdir\n";}

open(COMMENT, "COMMENT.ja") || die "COMMENT.ja\n";
while (<COMMENT>) {
	if (/^$/ || /^#/) {next;}
	chop;

	my (@data) = split(/\|/);
	if ($data[0] =~ /\//) {
		$packages{$data[0]} = $data[1];
	} else {
		$category{$data[0]} = $data[1];
	}
}
close(COMMENT);

#
# make diff
#
foreach my $file ("all", "category", "pkg", "top") {
	if (! -f "README.$file") {die "README.$file\n";}
	open(DIFF, "diff $pkgsrc/templates/README.$file README.$file|") || die "diff:README.$file";
	while (<DIFF>) {
		$diff{$file} .= $_;
	}
	close(DIFF);
}

#
# topdir README.html
#
open(SRC, "|patch -s -o $tmpfile $pkgsrc/README.html|") || die "src:$pkgsrc/README.html\n";
print SRC "$diff{'top'}\n";
close(SRC);
open(SRC, "$tmpfile") || die "src:$tmpfile\n";
if (! -d $wwwdir) {mkdir($wwwdir, $mode) || die "dst:$wwwdir\n";}
open(DST, "|nkf -j > $wwwdir/README.html") || die "dst:$wwwsrc/README.html\n";
while (<SRC>) {
	s/\"(templates\/pkg-daemon.gif)\"/\"ftp:\/\/ftp.jp.netbsd.org\/pub\/NetBSD-current\/pkgsrc\/$1\"/;
	if (/^<TR><TD VALIGN=TOP><a href=\"([^\/]+)/) {
		my ($cat) = $category{$1};
		if (defined($cat)) {
			s/(: <TD>).*/$1$cat/;
		} else {
			print "NODATA: $1\n";
		}
	}
	print DST $_;
}
close(SRC);
close(DST);

#
# topdir README-all.html
#
open(SRC, "|patch -s -o $tmpfile $pkgsrc/README-all.html|") || die "src:$pkgsrc/README-all.html\n";
print SRC "$diff{'all'}";
close(SRC);
open(SRC, "$tmpfile") || die "src:$tmpfile\n";
open(DST, "|nkf -j > $wwwdir/README-all.html") || die "dst:$wwwsrc/README-all.html\n";
while (<SRC>) {
	s/\"(templates\/pkg-daemon.gif)\"/\"ftp:\/\/ftp.jp.netbsd.org\/pub\/NetBSD-current\/pkgsrc\/$1\"/;
	if (/^<TR VALIGN=TOP><TD VALIGN=TOP><a href=\"([^\/]+\/[^\/]+)\/README.html/) {
		my ($pkg) = $packages{$1};
		if (defined($pkg)) {
			s/(\) <TD>).*/$1$pkg/;
		} else {
			print "NODATA: $1\n";
		}
	}
	print DST $_;
}
close(SRC);
close(DST);

#
# category README.html
#
my ($dir);
opendir(TOPDIR, "$pkgsrc") || die "$pkgsrc";
foreach $dir (readdir(TOPDIR)) {
	if ($dir =~ /^\.$/ || $dir =~ /^\.\.$/ || ! -d "$pkgsrc/$dir" ||
	    $dir eq "pkg" || $dir eq "distfiles" || $dir eq "packages" ||
	    $dir eq "mk" || $dir eq "templates") {next;}

	open(SRC, "|patch -s -o $tmpfile $pkgsrc/$dir/README.html|") ||
		die "src:$pkgsrc/$dir/README.html\n";
	print SRC "$diff{'category'}";
	close(SRC);
	open(SRC, "$tmpfile") || die "src:$tmpfile\n";
	if (! -d "$wwwdir/$dir")
		{mkdir("$wwwdir/$dir", $mode) || die "dst:$wwwdir/$dir\n";}
	open(DST, "|nkf -j >$wwwdir/$dir/README.html") ||
		die "dst:$wwwsrc/$dir/README.html\n";

	while (<SRC>) {
		s/You are now in the directory (".*")./$1 ディレクトリー/;
		s/\"..\/(templates\/pkg-daemon.gif)\"/\"ftp:\/\/ftp.jp.netbsd.org\/pub\/NetBSD-current\/pkgsrc\/$1\"/;
		if (/^<TR><TD VALIGN=TOP><a href=\"([^\/]+)/) {
			my ($pkg) = $packages{"$dir/$1"};
			if (defined($pkg)) {
				s/(: <TD>).*/$1$pkg/;
			} else {
				print "NODATA: $dir/$1\n";
			}
		}
		print DST $_;
	}
	close(SRC);
	close(DST);

#
# Package README.html
#
	opendir(CATEGORY, "$pkgsrc/$dir") || die "$pkgsrc/$dir";
	foreach $pkgdir (readdir(CATEGORY)) {
		if ($pkgdir =~ /^\.$/ || $pkgdir =~ /^\.\.$/ ||
		    ! -d "$pkgsrc/$dir/$pkgdir" ||
		    ! -f "$pkgsrc/$dir/$pkgdir/README.html" ||
		    $pkgdir eq "pkg") {next;}

		open(SRC, "|patch -s -o $tmpfile $pkgsrc/$dir/$pkgdir/README.html|") ||
			die "src:$pkgsrc/$dir/$pkgdir/README.html\n";
		print SRC "$diff{'pkg'}";
		close(SRC);
		open(SRC, "$tmpfile") || die "src:$tmpfile\n";
		if (! -d "$wwwdir/$dir/$pkgdir")
			{mkdir("$wwwdir/$dir/$pkgdir", $mode) ||
			    die "dst:$wwwdir/$dir/$pkgdir\n";}
		open(DST, "|nkf -j >$wwwdir/$dir/$pkgdir/README.html") ||
			die "dst:$wwwsrc/$dir/$pkgdir/README.html\n";

		my ($com) = 0;
		while (<SRC>) {
			s/\"..\/..\/(templates\/pkg-daemon.gif)\"/\"ftp:\/\/ftp.jp.netbsd.org\/pub\/NetBSD-current\/pkgsrc\/$1\"/;
			s/This package has a home page at/ホームページ:/;
			s/Please note that this package has a (.*) license./このパッケージは $1 ライセンスであることに注意してください。/;
			s/ftp:\/\/ftp.netbsd/ftp:\/\/ftp.jp.netbsd/;
			s/>(pkg/DESCR)</>ftp:\/\/ftp.jp.netbsd.org\/pub\/NetBSD-current\/pkgsrc\/$dir\/$pkgdir/$1</;
			if (/<p>.*:<br>/) {
				$com++;
				# s///;
			} elsif ($com == 1 && /<I>/) {
				$com++;
			} elsif ($com == 2) {
				$com = 0;
				my ($pkg) = $packages{"$dir/$pkgdir"};
				if (defined($pkg)) {
					s/.*/$pkg/;
				}
			}
			print DST $_;
		}
		close(SRC);
		close(DST);
	}
	closedir(CATEGORY);
}
closedir(TOPDIR);
unlink("$tmpfile", "$tmpfile.orig", "$tmpdile.rej");

0;
