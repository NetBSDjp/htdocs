#!/bin/sh
#
# $NetBSD: makeindex.sh,v 1.6 2003/12/07 17:44:11 jschauma Exp $
#
# update index.html with NEWS and EVENTS from /htdocs/ja/Changes/index.html and
# /htdocs/ja/gallery/events.html

# insert the head
DIR=${1:-.}
if [ "$DIR" = "." ] || [ -f ${DIR}/Changes/index.html ]; then
	ROOT="."
else
	ROOT=".."
fi;
cd $DIR
sed -e '/<!-- NEWS::START -->/q' index.html > index.tmp

# links to anchors on that page are new, trim grep's separator and only print
# the first 8 links
grep 'href="#' ${ROOT}/Changes/index.html | \
	sed -e "s:<!-- \(.*\) --><a href=\"#:<li><font size=\"-1\"><tt>\1</tt> <a href=\"${ROOT}/Changes/#:" -e 's/<\/li>$/<\/font><\/li>/' \
		-e '/^--/d' -e '9,$d' >> index.tmp

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

# Sed-options for EVENTS:
# -n 		Per default don't print anything
# -e <first> 	Stop when we encounter past events
# -e <second>	Create proper link
# -e <third>	Insert </font> tag
# -e <fourth>	If this line contains a link we need, print it
if [ ! -f ${ROOT}/gallery/events.html ]; then
	ROOT=".."
fi
sed -n -e "/Past Events/q" 						\
	-e "s:<a href=\"#:<li><font size=\"-1\"><a href=\"${ROOT}/gallery/events.html#:" \
	-e 's/<\/li>$/<\/font><\/li>/' 					\
	-e "/events.html#/p" 						\
	${ROOT}/gallery/events.html >> index.tmp

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

# return
cd ..
