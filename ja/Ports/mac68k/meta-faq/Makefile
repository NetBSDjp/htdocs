#	$NetBSD: Makefile,v 1.2 2001/02/04 13:11:29 dent Exp $
#	Process .list files into .html files

all:	meta-faq-1.html meta-faq-2.html meta-faq-3.html meta-faq-4.html \
	meta-faq-5.html meta-faq-6.html meta-faq-7.html meta-faq-8.html

.SUFFIXES:	.list .html

.list.html:
	../../../list2html.pl $< $@
