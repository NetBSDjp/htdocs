.SUFFIXES:      .data .list .html

.list.html:
	../../list2html.pl $< $@

###########################################################################

all: index.html update

index.html: index.list

update: check-setup
	sh update-images

check-setup:
	@[ -f /usr/X11R6/bin/Xnest ] || ( echo "need Xnest" ; exit 1 )
	@pkg_info -qe ImageMagick || ( echo "install pkgsrc/graphics/ImageMagick for convert" ; exit 1 ) 
	@pkg_info -qe xearth || ( echo "install pkgsrc/x11/xearth" ; exit 1 )
	@pkg_info -qe netpbm || ( echo "install pkgsrc/graphics/netpbm" ; exit 1 )
