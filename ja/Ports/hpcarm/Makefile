#	$NetBSD: Makefile,v 1.2 2002/08/01 20:25:05 jschauma Exp $
#	Process .list files into .html files

all::	howto-use.list

#all::
#	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
#	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
#	done

.SUFFIXES:	.list .html

.list.html:
	perl ../../list2html.pl $< $@
