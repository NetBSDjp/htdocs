#	$NetBSD: Makefile,v 1.1 2001/02/24 12:08:56 ichiro Exp $
#	Process .list files into .html files

all::	howto-use.list

#all::
#	@for dir in `echo */Makefile | sed 's:/Makefile::g'` ; do \
#	    echo "-> ${PDIR}$$dir";cd $$dir;${MAKE} PDIR=${PDIR}$$dir/; cd .. ;\
#	done

.SUFFIXES:	.list .html

.list.html:
	../../list2html.pl $< $@
