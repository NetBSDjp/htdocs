#!/bin/sh
#
# $NetBSD: makeindex.sh,v 1.1 2002/02/14 03:22:23 jschauma Exp $
#
# update index.html with NEWS and EVENTS from /htdocs/Changes/index.html and
# /htdocs/gallery/events.html

# insert the head
sed -e '/<!-- NEWS::START -->/q' index.html > index.tmp

# links to anchors on that page are new, trim grep's separator and only print
# the first 8 links (each links is two lines)
grep -B 1 'href="#' Changes/index.html | sed -e 's/<font face="helvetica, arial, sans-serif">/<font face="helvetica, arial" size="-1">/' -e 's/href="#/href="Changes\/#/' -e '/^--/d' | sed -e '17,$d' >> index.tmp

# insert the middle part
sed -e '/<!-- NEWS::END -->/!d' -e '/<!-- NEWS::END -->/bt
:t
/<!-- NEWS::END -->/,/<!-- EVENTS::START -->/ {
	/<!-- EVENTS::START -->/! {
		$! {
			N;
			bt
		}
	}
}
' index.html >> index.tmp

# links to anchors on that page are events, if we encounter "--" it means that
# Upcoming Events is over (grep had to jump) and we can stop.  Only add at
# most 6 events (each event is two lines)
grep -B1 'href="#' gallery/events.html | sed -e 's/<font face="helvetica, arial, sans-serif">/<font face="helvetica, arial" size="-1">/' -e 's/href="#/href="gallery\/events.html#/' -e '/^--/q' | sed -e '/^--/d' -e '13,$d' >> index.tmp

# insert the tail
sed -e '/<!-- EVENTS::END -->/!d' -e '/<!-- EVENTS::END -->/bt
:t
/<!-- EVENTS::END -->/,$ {
	$! {
		N;
		bt
	}
}' index.html >>index.tmp

# put in place
mv -f index.tmp index.html
