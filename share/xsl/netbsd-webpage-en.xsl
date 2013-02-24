<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- $NetBSD: netbsd-webpage-en.xsl,v 1.1 2013/02/24 17:40:41 ryoon Exp $ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:html="http://www.w3.org/1999/xhtml"
		exclude-result-prefixes="html"
		version="1.0">

  <xsl:param name="locale.backto">Back to </xsl:param>

  <xsl:output method="html" encoding="ISO-8859-1"
	indent="yes"
	doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
	doctype-system="http://www.w3.org/TR/html4/loose.dtd" />

  <xsl:include href="netbsd-webpage.xsl" />

</xsl:stylesheet>
