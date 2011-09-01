#! /usr/bin/awk -f
#
#	$NetBSD: gentab.awk,v 1.27 2007/07/21 09:03:30 kano Exp $
#	<!-- Based on english version: -->
#	<!-- NetBSD: gentab.awk,v 1.27 2007/07/21 09:03:30 kano Exp   -->
#
# Copyright (c) 1998 Tyler C. Sarna
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. All advertising materials mentioning features or use of this software
#    must display the following acknowledgement:
#      This product includes software developed by Tyler C. Sarna
# 4. The name of the author may not be used to endorse or promote products
#    derived from this software without specific prior written permission
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

BEGIN {
	nport = 0
	nfeature = 0

	collecting_feature = 0
}

collecting_feature && $1 == "featureend" {
	if ($2 != feature[nfeature]) {
		printf("feature start/end mismatch, lines %d/%d\n", \
		    feature_start_line, NR) > "/dev/stderr"
		exit 1
	}
	collecting_feature = 0
	nfeature++
	next
}

collecting_feature {
	feature_text[nfeature] = feature_text[nfeature]$0"\n"
	next
}

$1 == "port" {
	if (port_to_index[$2] != "") {
		printf("duplicate port \"%s\", line %d\n", $2, \
		    NR) > "/dev/stderr"
		exit 1
	}

	port[nport] = $2
	port_to_index[$2] = nport
	port_subdir[nport] = ($3 == "") ? $2 : $3;

	nport++

	next
}

$1 == "feature" {
	if (feature_to_index[$2] != "") {
		printf("duplicate feature \"%s\", line %d\n", $2, \
		    NR) > "/dev/stderr"
		exit 1
	}

	feature[nfeature] = $2
	feature_to_index[$2] = nfeature
	feature_always_in_table[$2] = $3

	collecting_feature = 1
	feature_start_line = NR
	next
}

$1 == "value" {
	if (vals[$2] != "") {
		printf("duplicate value \"%s\", line %d\n", $2, \
		    NR) > "/dev/stderr"
		exit 1
	}

	val = $3
	i = 4
	while ($i) {
		val = val " " $i
		i++
	}

	vals[$2] = val
	
	next
}

$1 == "class" {
	# check to see if a port of the same name exists.  If so,
	# the port won't be used, so the class must have a single entry
	# which must be named the same as the class itself (and therefore
	# port).
	if (port_to_index[$2] != "") {
		if (NF != 3 || $3 != $2) {
			printf("class \"%s\" duplicates port, line %d\n", $2, \
			    NR) > "/dev/stderr"
			exit 1
		}
	}

	for (i = 3; i <= NF; i++) {
		nclass[$2]++
		class[$2, nclass[$2]] = $i
	}
	next
}

$1 ~ "^#" || NF == 0 {
	next
}

{
	feature_ = $1
	val = $2
	if (vals[val])
		val = vals[val]

	for (port_i = 3; port_i <= NF; port_i++) {
		port_ = $port_i

		if (port_ == "*") {
			for (i = 0; i < nport; i++) {
				table[port[i], feature_] = val
			}
		} else if (nclass[port_]) {
			for (i = 1; i <= nclass[port_]; i++) {
				table[class[port_, i], feature_] = val
			}
		} else {
			table[port_, feature_] = val
		}
	}
	
	next
}

END {
	if (collecting_feature) {
		printf("unended feature, line %d\n", \
		    feature_start_line) > "/dev/stderr"
		exit 1
	}
	for (i = 0; i < nfeature; i++) {
		first = table[port[0], feature[i]]
		for (j = 0; j < nport; j++) {
			cur = table[port[j], feature[i]]
			if (cur != first)
				break
		}
		if (cur == first)
			feature_same_all[feature[i]] = 1
	}

	printf("<table border=\"1\">\n");

	printf("<thead>\n");
	printf("<tr><th>&nbsp;</th>\n")
	for (i = 0; i < nfeature; i++) {
		featname = feature[i]
		if (feature_same_all[featname] &&
		    !feature_always_in_table[featname])
			continue
		dfeatname = featname
		gsub("-", "<br>", dfeatname)

		printf("<th>")
		printf("<a href=\"#%s\">%s</a>", feature[i], dfeatname)
		printf("</th>\n")
	}

	printf("<th>&nbsp;</th></tr>\n")
	printf("</thead>\n");

	printf("<tfoot>\n");
	printf("<tr><th>&nbsp;</th>\n")

	for (i = 0; i < nfeature; i++) {
		featname = feature[i]
		if (feature_same_all[featname] &&
		    !feature_always_in_table[featname])
			continue
		dfeatname = featname
		gsub("-", "<br>", dfeatname)

		printf("<th>")
		printf("<a href=\"#%s\">%s</a>", feature[i], dfeatname)
		printf("</th>\n")
	}

	printf("<th>&nbsp;</th></tr>\n");
	printf("</tfoot>\n");

	printf("<tbody>\n");
	for (i = 0; i < nport; i++) {
		printf("<tr><th><a href=\"../../ports/%s/\">%s</a></th>\n", port_subdir[i], port[i])

		for (j = 0; j < nfeature; j++) {
			featname = feature[j]
			if (feature_same_all[featname] &&
			    !feature_always_in_table[featname])
				continue
			val = table[port[i], featname]
			if (!val) {
				val = vals["UNSPECIFIED"]
			}

			printf("<td>%s</td>\n", val)
		}

		printf("<th><a href=\"../../ports/%s/\">%s</a></th></tr>\n", port_subdir[i], port[i])
	}
	printf("</tbody>\n");

	printf("</table>\n")
	printf("\n<h2>各機能の説明</h2>\n")
	
	printf("<dl>\n")
	for (i = 0; i < nfeature; i++) {
		featname = feature[i]
		if (feature_same_all[featname] &&
		    !feature_always_in_table[featname])
			continue
		dfeatname = featname
		gsub("-", " ", dfeatname)

		printf("<dt>")
		printf("<b><a name=\"%s\">%s</a></b>", feature[i], dfeatname)
		printf("<dd>\n")
		printf("%s\n", feature_text[i])
	}
	printf("</dl>\n")


	printf("\n<hr>\n<h2>全ポートが対応している機能</h2>\n")

	printf("<dl>\n")

	z = 0

	for (i = 0; i < nfeature; i++) {
		featname = feature[i]
		if (!feature_same_all[featname] ||
		    feature_always_in_table[featname]) {
		 	z++
			if (z == nfeature) {
			printf("<dd>There are no currently listed features ")
			printf("that are supported by all ports\n")
			}
			continue
		}
		dfeatname = featname
		gsub("-", " ", dfeatname)

		printf("<dt>")
		printf("<b><a name=\"%s\">%s</a></b>", feature[i], dfeatname)
		printf("<dd>\n")
		printf("%s\n", feature_text[i])
		printf("<br>\n")
		printf("All: %s", table[port[0], featname])
	}

	printf("</dl>\n")
}
