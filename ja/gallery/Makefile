#	$NetBSD: Makefile,v 1.3 2002/08/01 20:24:57 jschauma Exp $
#       Process .list files into .html files

all::  articles.html consultants.html devotionalia.html \
	groups.html hardware.html logos.html preinstalled.html \
	products.html research.html sites.html software.html \
	testimonial.html events

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done

events: events.html
	cd ..; make index; cd gallery;


.SUFFIXES:	.data .list .html

.list.html:
	perl ../list2html.pl $< $@

.data.html:
	perl ./makesites.pl $< $@
