#	$NetBSD: Makefile,v 1.20 2002/11/09 16:05:22 darcy Exp $
#       Process .list files into .html files

all::  articles.html consultants.html devotionalia.html \
	groups.html hardware.html logos.html preinstalled.html \
	products.html research.html resources.html sites.html \
	software.html testimonial.html events sitemap

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

events: events.html
	cd ..; make index; cd gallery;

sitemap: sitemap.html sitemap.links

sitemap.html: sitemap.head sitemap.links sitemap.tail 
	cat sitemap.head sitemap.links sitemap.tail > sitemap.html

sitemap.links:
	./makesitemap.sh .. > sitemap.links


.SUFFIXES:	.data .list .html

.list.html:
	perl ../list2html.pl $< $@

.data.html:
	perl ./makesites.pl $< $@
