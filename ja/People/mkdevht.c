/*	$NetBSD: mkdevht.c,v 1.12 2002/06/15 04:16:23 mason Exp $	*/

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
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

void fail(FILE *, char *);
int collectline(int, int, FILE *, char *, char **, FILE *, char *);
void usage(void);
int main(int, char *[]);

void
fail(FILE *tempfile, char *tempfilename)
{
	fclose(tempfile);
	unlink(tempfilename);
	fprintf(stderr, "Error: Please check file supporting-cast.data for" \
	    " corruption or\nincorrect formatting.\n");
	exit(1);
}

int
collectline(int line, int silent, FILE *source, char *field, char **space,
    FILE *tempfile, char *tempfilename)
{
	char *inputline;
	int length, taglen;

	length = 0;

	/* Loop until we have a non-empty line. */
	while (length == 0) {
		if ((inputline = fgetln(source, (size_t *) &length)) == NULL) {
			if (silent)
				return(1);
			else
				fail(tempfile, tempfilename);
		}
		if (inputline[length - 1] == '\n')
			--length;
	}

	/* See if the desired field is here. */
	taglen = strlen(field);
	if (strncmp(inputline, field, taglen)) {
		if (length >= taglen)
			inputline[taglen - 1] = '\0';
		fprintf(stderr, "Line %d: Expected \"%s\", found \"%s\".\n", \
		    line, field, inputline);
		fail(tempfile, tempfilename);
	}

	/* Eat whitespace. */
	while (inputline[taglen] == ' ' || inputline[taglen] == '\t')
		++taglen;

	/* If we have a line with content, pass it back. */
	if (*space)
		free(*space);
	if (length - taglen > 0) {
		*space = (char *) calloc(sizeof(char) 
		    * (length - taglen + 1), 1);
		(void) strncpy(*space, inputline + taglen, length - taglen);
		(*space)[length - taglen] = '\0';
	} else
		*space = NULL;

	return(0);
}

void
usage(void)
{
	fputs("usage: mkdevht <path-to-data-directory>\n", stderr);
	exit(1);
}

int
main(int argc, char *argv[])
{
	FILE *source, *dest;
	int c, shade, line, trash;
	char *name, *email, *url, *work, *tpath;

	if (argc != 2)
		usage();

	name = email = url = work = (char *) NULL;
	trash = shade = line = 0;

	/* make temporary file */
	tpath = strdup("supporting-cast.html.XXXXXX");
	if (mkstemp(tpath) == NULL) {
		fprintf(stderr, "Error creating temporary file.\n", tpath);
		exit(1);
	}
	dest = fopen(tpath, "w");
	if (dest == NULL) {
		fprintf(stderr, "Error opening %s.\n", tpath);
		exit(1);
	}

	/* head */
	source = fopen("supporting-cast.head", "r");
	if (source == NULL) {
		fprintf(stderr, "Error opening %s.\n", "supporting-cast.head");
		exit(1);
	}
	while ((c = fgetc(source)) != EOF)
		fputc(c, dest);
	if (source)
		fclose(source);

	source = fopen(argv[1], "r");
	if (source == NULL) {
		fprintf(stderr, "Error opening %s.\n", argv[1]);
		exit(1);
	}

	/* Eat NetBSD tag in data file */
	(void) fgetln(source, (size_t *) &trash);

	/* data */
	for (;;) {

		shade = (shade == 1 ? 0 : 1);

		if (collectline(++line, 1, source, "Name:", &name, dest, tpath))
			break;

		if (collectline(++line, 0, source, "Email:", &email, dest,
		    tpath))
			break;

		if (collectline(++line, 0, source, "URL:", &url, dest, tpath))
			break;

		if (collectline(++line, 0, source, "Work:", &work, dest, tpath))
			break;

		/* output */
		fprintf(dest, "<tr>\n  <td valign=top");
		if (shade)
			fprintf(dest, " bgcolor=\"#f1f1f1\"");
		else
			fprintf(dest, " bgcolor=\"#ffffff\"");
		fprintf(dest, ">");

		if (url)
			fprintf(dest, "<a href=\"%s\">", url);

		fputs(name, dest);

		if (url)
			fputs("</a>", dest);

		fprintf(dest, "\n    <a href=\"mailto:%s\">&lt;%s&gt;</a>"
		    "</td>\n  <td valign=top", email, email);
		if (shade)
			fprintf(dest, " bgcolor=\"#eeeeee\"");
		else
			fprintf(dest, " bgcolor=\"#ffffff\"");
	
		if (work)
			fprintf(dest, ">\n     - %s<br>\n  </td>\n</tr>\n\n",
			    work);
		else
			fprintf(dest, ">\n    <br>\n  </td>\n</tr>\n\n");
	}

	if (source)
		fclose(source);


	/* tail */
	source = fopen("supporting-cast.tail", "r");
	if (source == NULL) {
		fprintf(stderr, "Error opening %s.\n", "supporting-cast.tail");
		exit(1);
	}
	while ((c = fgetc(source)) != EOF)
		fputc(c, dest);
	if (source)
		fclose(source);

	if (dest)
		fclose(dest);

	chmod(tpath, 0644);
	rename(tpath, "supporting-cast.html");

	return(0);
}

