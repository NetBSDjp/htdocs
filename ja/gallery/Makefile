#	$NetBSD: Makefile,v 1.45 2005/10/14 09:00:03 rillig Exp $

XMLDOCS+=	addsite
XMLDOCS+=	articles
XMLDOCS+=	devotionalia
XMLDOCS+=	consultants
XMLDOCS+=	events
XMLDOCS+=	groups
XMLDOCS+=	hardware
XMLDOCS+=	index
XMLDOCS+=	logos
XMLDOCS+=	mobile-logos
XMLDOCS+=	other-logos
XMLDOCS+=	preinstalled
XMLDOCS+=	products
XMLDOCS+=	resources
XMLDOCS+=	research
XMLDOCS+=	sites
XMLDOCS+=	software
XMLDOCS+=	testimonial

SUBDIR=		advocacy
SUBDIR+=	events
SUBDIR+=	in-Action
SUBDIR+=	xearth

.SUFFIXES:	.data .html .xml

all: events sitemap

events: events.html
	cd ..; ${MAKE} index; cd gallery;

sitemap: sitemap.html sitemap.links

sitemap.html: sitemap.head sitemap.links sitemap.tail 
	cat sitemap.head sitemap.links sitemap.tail > sitemap.html

sitemap.links:
	./makesitemap.sh .. > sitemap.links

# This file is not in CVS!  We have a dependency on it in
# ${WEB_PREFIX}/share/mk/web.site.mk.
CLEANFILES+=	sites.xml

sites.xml:	sites.data sites.tail sites.head makesites.pl

.data.xml:
	perl ./makesites.pl $< $@

.include "../share/mk/web.site.mk"
