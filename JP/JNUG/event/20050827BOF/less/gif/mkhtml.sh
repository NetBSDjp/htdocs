#! /bin/sh

for page in `jot 83`; do
    file=`printf "%s%03d.html" "$prefix" $page`
    exec > $file
    echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN"'
    echo ' "http://www.w3.org/TR/REC-html40/strict.dtd">'
    printf '<html>\n<head>\n'
    printf '<link rel="stylesheet" href="../presen.css" />\n'
    printf '<title>less presen meets takahashi method page %3d</title>\n' $page
    printf '</head>\n<body>\n'
    printf '<div class="bar">\n'
    if [ $page != 1 ]; then
        printf '<span class="prev">[<a href="%03d.html">&lt;&lt;</a>]</span>' \
            $(($page - 1))
    else
        printf '<span class="prev">[&lt;&lt;]</span>'
    fi
    if [ $page != 83 ]; then
        printf '<span class="next">[<a href="%03d.html">&gt;&gt;</a>]</span>' \
            $(($page + 1))
    else
        printf '<span class="next">[&gt;&gt;]</span>'
    fi
    printf '<span class="top">[<a href="001.html">top</a>]</span>'
    printf '<span class="anim">[<a href="anim.html">animation</a>]</span>'
    echo
    echo '</div>'
    printf '<img class="cap" src="%03d.gif" />\n' $page
    printf '</body>\n</html>\n'
done
