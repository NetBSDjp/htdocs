#!/usr/bin/env perl
#
# $Id: comment2ja.pl,v 1.19 1999/12/08 03:57:47 sakamoto Exp $
#

$|=1;
my (%category, %packages,%nodata);
my ($pkgsrc) = shift;
my ($wwwdir) = shift;
my ($mode) = 0755;
my (%diff);
my ($tmpfile) = "/tmp/comment2ja_$$";
my ($patch) = "patch -s -o $tmpfile";

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
# reject handler
#
sub rej {
	my ($file) = @_;
	if (-f "$tmpfile.rej") {
		print STDERR "\t$file\n";
		unlink("$tmpfile.rej");
	}
}

#
# topdir README.html
#
open(SRC, "|$patch $pkgsrc/README.html|") || die "src:$pkgsrc/README.html\n";
print SRC "$diff{'top'}\n";
close(SRC);
&rej("README.html");
open(SRC, "$tmpfile") || die "src:$tmpfile\n";
if (! -d $wwwdir) {mkdir($wwwdir, $mode) || die "dst:$wwwdir\n";}
open(DST, "|nkf -j > $wwwdir/README.html") || die "dst:$wwwsrc/README.html\n";
while (<SRC>) {
	s/\"(templates\/pkg-daemon.gif)\"/\"ftp:\/\/ftp.jp.netbsd.org\/pub\/NetBSD-current\/pkgsrc\/$1\"/;
	if (/^<TR><TD VALIGN=TOP><a href=\"([^\/]+)/) {
		my ($p) = $1;
		my ($cat) = $category{$p};
		if (defined($cat)) {
			s/(: <TD>).*/$1$cat/;
		} else {
			/: <TD>(.*)/;
			$nodata{$p} = $1;
		}
	}
	print DST $_;
}
close(SRC);
close(DST);

#
# topdir README-all.html
#
open(SRC, "|$patch $pkgsrc/README-all.html|") || die "src:$pkgsrc/README-all.html\n";
print SRC "$diff{'all'}";
close(SRC);
&rej("README-all.html");
open(SRC, "$tmpfile") || die "src:$tmpfile\n";
open(DST, "|nkf -j > $wwwdir/README-all.html") || die "dst:$wwwsrc/README-all.html\n";
while (<SRC>) {
	s/\"(templates\/pkg-daemon.gif)\"/\"ftp:\/\/ftp.jp.netbsd.org\/pub\/NetBSD-current\/pkgsrc\/$1\"/;
	if (/^<TR VALIGN=TOP><TD><a href=\"([^\/]+\/[^\/]+)\/README.html/) {
		my ($p) = $1;
		my ($pkg) = $packages{$p};
		if (defined($pkg)) {
			s/(\) <TD>).*/$1$pkg/;
		} else {
			/\) <TD>(.*)/;
			$nodata{$p} = $1;
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
	if ($dir =~ /^\.$/ || $dir =~ /^\.\.$/ ||
	    ! -d "$pkgsrc/$dir" || ! -f "$pkgsrc/$dir/pkg/COMMENT" ||
	    $dir eq "pkg" || $dir eq "distfiles" || $dir eq "packages" ||
	    $dir eq "mk" || $dir eq "templates") {next;}

	open(SRC, "|$patch $pkgsrc/$dir/README.html|") ||
		die "src:$pkgsrc/$dir/README.html\n";
	print SRC "$diff{'category'}";
	close(SRC);
	&rej("$dir/README.html");
	open(SRC, "$tmpfile") || die "src:$tmpfile\n";
	if (! -d "$wwwdir/$dir")
		{mkdir("$wwwdir/$dir", $mode) || die "dst:$wwwdir/$dir\n";}
	open(DST, "|nkf -j >$wwwdir/$dir/README.html") ||
		die "dst:$wwwsrc/$dir/README.html\n";

	while (<SRC>) {
		s/You are now in the directory (".*")./$1 ディレクトリー/;
		s/\"..\/(templates\/pkg-daemon.gif)\"/\"ftp:\/\/ftp.jp.netbsd.org\/pub\/NetBSD-current\/pkgsrc\/$1\"/;
		s/Here are the one-line descriptions for each of the items (/このカテゴリーに含まれるパッケージ (/;
		s/) in this directory:/) の一行コメント/;

		if (/^<TR><TD VALIGN=TOP><a href=\"([^\/]+)/) {
			my ($p) = "$dir/$1";
			my ($pkg) = $packages{$p};
			if (defined($pkg)) {
				s/(: <TD>).*/$1$pkg/;
			} else {
				/: <TD>(.*)/;
				$nodata{$p} = $1;
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
		    ! -f "$pkgsrc/$dir/$pkgdir/pkg/COMMENT" ||
		    ! -f "$pkgsrc/$dir/$pkgdir/README.html" ||
		    $pkgdir eq "pkg") {next;}

		open(SRC, "|$patch $pkgsrc/$dir/$pkgdir/README.html|") ||
			die "src:$pkgsrc/$dir/$pkgdir/README.html\n";
		print SRC "$diff{'pkg'}";
		close(SRC);
		&rej("$dir/$pkgdir/README.html");
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
			s/\"(pkg\/DESCR)\"/\"ftp:\/\/ftp.jp.netbsd.org\/pub\/NetBSD-current\/pkgsrc\/$dir\/$pkgdir\/$1\"/;
			s/>history<\/A>\./>歴史<\/A>をご覧ください。/;
			s/<A HREF=\"\.\">/<A HREF=\"ftp:\/\/ftp.jp.netbsd.org\/pub\/NetBSD-current\/pkgsrc\/$dir\/$pkgdir\/\">/;
			s/no precompiled binaries available/コンパイル済みのパッケージは現在用意されていません/;
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
unlink("$tmpfile", "$tmpfile.orig");

#
# nodata pkgs
#
open(DST, ">$wwwdir/nodata.html") || die "dst:$wwwsrc/nodata.html\n";
my (@pkgs) = keys %nodata;
if ($#pkgs > 0) {
	print "NODATA:\n";
	print DST <<EOF;
<html>
<head><title>NetBSD Packages</title></head>
<body>
<pre>
EOF

	my ($pkg);
	foreach $pkg (sort keys %nodata) {
		print DST "$pkg|$nodata{$pkg}\n";
		print "$pkg|$nodata{$pkg}\n";
	}

	print DST <<EOF;
</pre>
</body>
</html>
EOF
} else {
	print DST "<html><body>OK</body></html>\n";
}
close(DST);

0;
