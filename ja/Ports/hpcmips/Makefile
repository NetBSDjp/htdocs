#	$NetBSD: Makefile,v 1.1 2000/02/16 09:22:39 jun Exp $
#	Process .list files into .html files

all::	howto-develop.html howto-use.html compat-pmax.html pocketv6.html faq.html

#all::
#	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
#	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
#	done

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
