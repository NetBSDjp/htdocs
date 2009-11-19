#	$NetBSD: README.txt,v 1.1.1.1 2009/11/19 14:28:09 kano Exp $

Simple changes can be submitted by email to www@NetBSD.org

Instructions on how to edit and update the web pages directly are in:

    http://www.NetBSD.org/developers/htdocs.html

(In the CVS repository, this file is in htdocs/developers/htdocs.html)

=== Implementation details ===

All Makefile.inc files on the way from the current directory upto
WEB_PREFIX (usually this htdocs/ directory) are included automatically
by the web.site.mk file, in this order. That is, you should not include
them yourself.

When you add new XML files you must add an entry to htdocs/layout.xml.
