#	$NetBSD: Makefile,v 1.13 2000/06/24 21:46:30 dent Exp $
#       Process .list files into .html files

all::  articles.html consultants.html devotionalia.html events.html \
	groups.html hardware.html logos.html preinstalled.html \
	products.html research.html sites.html software.html \
	testimonial.html

all::
	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
	done


.SUFFIXES:	.data .list .html

.list.html:
	../list2html.pl $< $@

.data.html:
	./makesites.pl $< $@
