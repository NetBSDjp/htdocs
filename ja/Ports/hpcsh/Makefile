#	$NetBSD: Makefile,v 1.1 2001/01/20 13:44:42 itojun Exp $
#	Process .list files into .html files

all::	howto-use.html

#all::
#	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
#	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
#	done

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
