#	$NetBSD: Makefile,v 1.14 2002/02/14 03:22:24 jschauma Exp $
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
	../list2html.pl $< $@

.data.html:
	./makesites.pl $< $@
