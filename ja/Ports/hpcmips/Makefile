#	$NetBSD: Makefile,v 1.2 2002/09/19 14:18:46 kawamoto Exp $
#	Process .list files into .html files

all::	howto-develop.html howto-use.html compat-pmax.html pocketv6.html faq.html

#all::
#	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
#	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
#	done

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl $< $@
