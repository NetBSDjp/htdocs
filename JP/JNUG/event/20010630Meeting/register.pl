#!/usr/local/bin/perl
#
# Event Registration CGI
#   authored by kawamoto@wide.ad.jp
#
$Id = ' $Id: register.pl,v 1.1 2001/05/22 07:52:53 kawamoto Exp $ ';
#
# Internal Japanese Encoding:
# This file must be saved by 'euc'.
#$ije = 'euc';
# Request Japanese Encoding:
# $rje will be set below

# set some constants
$r_meeting = '定例総会';
$r_bof = 'BOF';
$r_ok = '登録';
$r_change = '変更';
$e_success = 0;
$e_fail = 1;
$admin = 'webmaster@jp.netbsd.org';
$over = 1;

$| = 1;

use Fcntl ':flock';
use CGI;
use Jcode;

# read form request
CGI::ReadParse(*input);

# detect request(client) Japanese encoding
$rje = $input{'kanji'};
$rje = Jcode::getcode($rje);
$rje = 'sjis' if ($rje ne 'jis' && $rje ne 'euc' &&
		  $rje ne 'utf8' && $rje ne 'sjis');

# convert Japanese code from client code for server code
foreach $key (keys %input) {
    $input{$key} = Jcode->new($input{$key}, $rje)->tr('０-９Ａ-Ｚａ-ｚ．　＠＿−', '0-9A-Za-z. @_-')->euc;
}

# set variables from input
$meeting = "$input{'meeting'}";
$database = "$input{'database'}";
$name = "$input{'name'}";
$mail = "$input{'mail'}";
$kaiin = "$input{'kaiin'}";
$soukai = "$input{'soukai'}";
$bof = "$input{'bof'}";

# trim e-mail address
$mail = &CheckEmail($mail);

# trim database name
$database = &CheckDBName($database);

&PrintHeaderTitle("JNUG Registration");

$nerror = 0;

if ($meeting eq $r_meeting) {
    &PrintMessages("<h1>会員または入会希望の方へ</h1>\n");
    if ($name eq '') {
	$nerror++;
	&PrintMessages("お名前が入力されていません。<br>\n");
    }
    if ($mail eq '') {
	$nerror++;
	&PrintMessages("E-Mailアドレスが入力されていません。<br>\n");
    }
    $message = "お名前: $name
E-Mail: $mail
JNUG会員登録: " . ($kaiin eq 'yes' ? "入会または更新する" : "退会する") . " ($kaiin)
定期総会: " . ($soukai eq 'yes' ? "出席する" : "欠席、議長に委任する") . " ($soukai)
NetBSD BoF: " . ($bof eq 'yes' ? "出席する" : "欠席する") . " ($bof)";
} else {
    &PrintMessages("<h1>NetBSD BoFのみ参加の方へ</h1>\n");
    if ($name eq '') {
	$nerror++;
	&PrintMessages("お名前が入力されていません。<br>\n");
    }
    if ($mail eq '') {
	$nerror++;
	&PrintMessages("E-Mailアドレスが入力されていません。<br>\n");
    }
    $message = "お名前: $name
E-Mail: $mail
NetBSD BoF: " . ($bof eq 'yes' ? "出席する" : "欠席する (参加取消)") . " ($bof)";
}

if ($nerror) {
    &PrintMessages("WWWブラウザーの「BACK」または「戻る」で、
登録フォームのページに戻って正しく入力してください。\n");
    &PrintTail();
    exit(0);
}

# get entry number
$entryno = 0;
if ($database ne '' && open(EN, ">>/home/JNUG/$database/entryno")) {
    flock(EN, LOCK_EX);
    seek(EN, 0, 2);
    print EN ".";
    $entryno = tell(EN);
    close(EN);
}
if ($entryno > 0) {
    $message = "受付番号: $entryno\n$message";
}

&PrintMessages("<p>
以下の内容で参加・変更の登録を受け付けました。
ありがとうございました。
</p>

<p>
登録内容を変更したい場合や登録を取り消したい場合は、変更したい内容でもう一度登録をお願いします。
何か問題が発生した場合には、<a href=\"mailto:$admin\">$admin</a>まで連絡をお願いします。
</p>

<hr>

<pre>
$message
</pre>
");
if (open(MAIL, "|/usr/sbin/sendmail $mail JNUG-meeting\@jp.netbsd.org")) {
    print MAIL "From: JNUG meeting <JNUG-meeting\@jp.netbsd.org>
To: $mail
cc: JNUG-meeting\@jp.netbsd.org
Subject: JNUG Registeration Information
\n";
    print MAIL Jcode->new("以下の内容で参加・変更の登録を受け付けました。
ありがとうございました。")->jis, "\n\n";
    print MAIL Jcode->new($message)->jis, "\n\n";
    print MAIL Jcode->new("登録内容を変更したい場合や登録を取り消したい場合は、
変更したい内容でもう一度登録をお願いします。
何か問題が発生した場合には、
JNUG-meeting\@jp.netbsd.org
まで連絡をお願いします。
-- 
JNUG <JNUG-meeting\@jp.netbsd.org>")->jis, "\n";

    close(MAIL);
}

&PrintTail();
exit(0);

#
# End of main
#
# sub functions
#

sub CheckEmail {
    local($_) = $_[0];

    s/^.*<([^<>]+@[^<>]+)>.*$/$1/;
    s/<[^<>]*>//g;
    s/\([^()]*\)//g;
    tr/a-zA-Z0-9@%.+_-//cd;
    return ($_);
}

sub CheckDBName {
    local($_) = $_[0];

    tr/a-zA-Z0-9_-//cd;
    return ($_);
}

sub EncodeVariable {
    local($_) = $_[0];

    s/&/&amp;/g;
    s/</&lt;/g;
    s/>/&gt;/g;
    s/"/&quot;/g; #";
    return ($_);
}

sub DecodeVariable {
    local($_) = $_[0];

    s/&quot;/"/g; #";
    s/&gt;/>/g;
    s/&lt;/</g;
    s/&amp;/&/g;
    return ($_);
}

#
# message output functions
#

sub PrintHeaderTitle {
    local($title) = "$_[0]";

    &PrintMessages("Content-Type: text/html

<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
<html>
<head>
<title>$title</title>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-2022-jp\">
<link rev=\"made\" href=\"mailto:$admin\">
<style type=\"text/css\">
<!--
 BODY {background-color: white}
 h1 {text-align: center}
 DIV.c1 {text-align: center}
 P.c1 {text-align: right}
-->
</style>
</head>
<body>
");
}

sub PrintMessages {
    local(@messages) = @_;
    local($message);

    foreach $message (@messages) {
	print Jcode->new($message)->jis;
    }
}

sub PrintTail {
    &PrintMessages("
<hr>
<p class=\"c1\"><a href=\"mailto:$admin\">$admin</a>
</body>
</html>
");
}
