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
$r_meeting = '�������';
$r_bof = 'BOF';
$r_ok = '��Ͽ';
$r_change = '�ѹ�';
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
    $input{$key} = Jcode->new($input{$key}, $rje)->tr('��-����-�ڣ�-������������', '0-9A-Za-z. @_-')->euc;
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
    &PrintMessages("<h1>����ޤ��������˾������</h1>\n");
    if ($name eq '') {
	$nerror++;
	&PrintMessages("��̾�������Ϥ���Ƥ��ޤ���<br>\n");
    }
    if ($mail eq '') {
	$nerror++;
	&PrintMessages("E-Mail���ɥ쥹�����Ϥ���Ƥ��ޤ���<br>\n");
    }
    $message = "��̾��: $name
E-Mail: $mail
JNUG�����Ͽ: " . ($kaiin eq 'yes' ? "����ޤ��Ϲ�������" : "��񤹤�") . " ($kaiin)
������: " . ($soukai eq 'yes' ? "���ʤ���" : "���ʡ���Ĺ�˰�Ǥ����") . " ($soukai)
NetBSD BoF: " . ($bof eq 'yes' ? "���ʤ���" : "���ʤ���") . " ($bof)";
} else {
    &PrintMessages("<h1>NetBSD BoF�Τ߻��ä�����</h1>\n");
    if ($name eq '') {
	$nerror++;
	&PrintMessages("��̾�������Ϥ���Ƥ��ޤ���<br>\n");
    }
    if ($mail eq '') {
	$nerror++;
	&PrintMessages("E-Mail���ɥ쥹�����Ϥ���Ƥ��ޤ���<br>\n");
    }
    $message = "��̾��: $name
E-Mail: $mail
NetBSD BoF: " . ($bof eq 'yes' ? "���ʤ���" : "���ʤ��� (���ü��)") . " ($bof)";
}

if ($nerror) {
    &PrintMessages("WWW�֥饦�����Ρ�BACK�פޤ��ϡ����פǡ�
��Ͽ�ե�����Υڡ�������ä����������Ϥ��Ƥ���������\n");
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
    $message = "�����ֹ�: $entryno\n$message";
}

&PrintMessages("<p>
�ʲ������Ƥǻ��á��ѹ�����Ͽ������դ��ޤ�����
���꤬�Ȥ��������ޤ�����
</p>

<p>
��Ͽ���Ƥ��ѹ�������������Ͽ����ä��������ϡ��ѹ����������ƤǤ⤦������Ͽ�򤪴ꤤ���ޤ���
�������꤬ȯ���������ˤϡ�<a href=\"mailto:$admin\">$admin</a>�ޤ�Ϣ��򤪴ꤤ���ޤ���
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
    print MAIL Jcode->new("�ʲ������Ƥǻ��á��ѹ�����Ͽ������դ��ޤ�����
���꤬�Ȥ��������ޤ�����")->jis, "\n\n";
    print MAIL Jcode->new($message)->jis, "\n\n";
    print MAIL Jcode->new("��Ͽ���Ƥ��ѹ�������������Ͽ����ä��������ϡ�
�ѹ����������ƤǤ⤦������Ͽ�򤪴ꤤ���ޤ���
�������꤬ȯ���������ˤϡ�
JNUG-meeting\@jp.netbsd.org
�ޤ�Ϣ��򤪴ꤤ���ޤ���
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
