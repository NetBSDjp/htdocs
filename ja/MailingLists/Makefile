#	$NetBSD: Makefile,v 1.2 1995/08/15 04:15:52 thorpej Exp $
#	XXX

index.html:	index.m4
	nkf -e < index.m4 | m4 | nkf -j > index.html
