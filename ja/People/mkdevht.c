/*	$NetBSD: mkdevht.c,v 1.8 2000/06/03 15:30:31 mason Exp $	*/

char *copyright =
	"Copyright (c) 2000 Mason Loring Bliss";

/*
 * Copyright (c) 2000 Mason Loring Bliss.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdio.h>
#include <string.h>

#define SHORTLEN 256
#define LONGLEN 4096

void
fail(tempfile, tempfilename)
	FILE *tempfile;
	char *tempfilename;
{
	fclose(tempfile);
	unlink(tempfilename);
	fprintf(stderr, "Error: Please check file supporting-cast.data for" \
	    " corruption or\nincorrect formatting.\n");
	exit(1);
}

int
collectline(line, silent, source, field, space, length, tempfile, tempfilename)
	char *field, *space, *tempfilename;
	FILE *tempfile, *source;
	int silent, length;
{
	char trash[9];

	if (fgets(trash, 8, source) == NULL)
		if (silent)
			return(1);
		else
			fail(tempfile, tempfilename);

	if (fgets(space, length, source) == NULL)
		if (silent)
			return(1);
		else
			fail(tempfile, tempfilename);

	space[strlen(space) - 1] = '\0';
	if (strncmp(trash, field, 7)) {
		fprintf(stderr, "Line %d: Expected \"%s\", found \"%s\".\n", \
		    line, field, trash);
		fail(tempfile, tempfilename);
	}

	return(0);
}

int
main()
{
	FILE *source, *dest;
	int c, u, shade, line;
	char trash[LONGLEN + 3], name[SHORTLEN], email[SHORTLEN],
	    url[SHORTLEN], work[LONGLEN];
	char *t;

	shade = 0;
	line = 0;

	/* make temporary file */
	t = strdup("supporting-cast.html.XXXXXX");
	if (mkstemp(t) == NULL) {
		fprintf(stderr, "Error creating temporary file.\n", t);
		exit(1);
	}
	dest = fopen(t, "w");
	if (dest == NULL) {
		fprintf(stderr, "Error opening %s.\n", t);
		exit(1);
	}

	/* head */
	source = fopen("supporting-cast.head", "r");
	if (source == NULL) {
		fprintf(stderr, "Error opening supporting-cast.head.\n");
		exit(1);
	}
	while ((c = fgetc(source)) != EOF)
		fputc(c, dest);
	if (source != NULL)
		fclose(source);

	source = fopen("supporting-cast.data", "r");
	if (source == NULL) {
		fprintf(stderr, "Error opening supporting-cast.data.\n");
		exit(1);
	}

	/* Eat NetBSD tag in data file */
	fgets(trash, LONGLEN - 1, source);


/* XXX - Do something with overflows...? */

	/* data */
	for (;;) {

		shade = (shade == 1 ? 0 : 1);

		if (collectline(++line, 1, source, "Name : ", name, \
		    SHORTLEN - 1, dest, t))
			break;

		if (collectline(++line, 0, source, "Email: ", email, \
		    SHORTLEN - 1, dest, t))
			break;

		if (collectline(++line, 0, source, "URL  : ", url, \
		    SHORTLEN - 1, dest, t))
			break;

		if (collectline(++line, 0, source, "Work : ", work, \
		    LONGLEN - 1, dest, t))
			break;
		u = strlen(work);
		if (work[--u] == '\n')
			work[u] = '\0';

		/* output */
		fprintf(dest, "<tr>\n<td valign=top", dest);
		if (shade)
			fprintf(dest, " bgcolor=\"#cccccc\"", dest);
		fprintf(dest, ">", dest);

		if (u = strlen(url))
			fprintf(dest, "<a href=\"%s\">", url);

		fputs(name, dest);

		if (u)
			fputs("</a>", dest);

		trash[0]='\0';
		if (strlen(work) > 0) {
			strcat(trash, " - \0");
			strcat(trash, work);
		}

		fprintf(dest, " <a href=\"mailto:%s\">&lt;%s&gt;</a>\n<br>\n" \
		    "</td>\n<td valign=top", email, email);
		if (shade)
			fprintf(dest, " bgcolor=\"#cccccc\"", dest);
		fprintf(dest, ">\n%s\n<br>\n</td>\n</tr>\n\n", trash);

	}

	if (source != NULL)
		fclose(source);


	/* tail */
	source = fopen("supporting-cast.tail", "r");
	if (source == NULL) {
		fprintf(stderr, "Error opening supporting-cast.tail.\n");
		exit(1);
	}
	while ((c = fgetc(source)) != EOF)
		fputc(c, dest);
	if (source != NULL)
		fclose(source);

	if (dest != NULL)
		fclose(dest);

	rename(t, "supporting-cast.html");

	return(0);
}

