#	$NetBSD: Makefile,v 1.3 2005/02/07 16:46:33 kano Exp $
#	<!-- based on english translation: -->
#	<!-- NetBSD: Makefile,v 1.3 2002/08/01 20:25:05 jschauma Exp   -->
#	Process .list files into .html files

all::	howto-develop.html howto-use.html compat-pmax.html pocketv6.html faq.html

#all::
#	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
#	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
#	done

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl $< $@
