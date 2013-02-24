<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>

<!-- $NetBSD: netbsd-webpage-root-ja.xsl,v 1.1 2013/02/24 17:40:42 ryoon Exp $ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:html="http://www.w3.org/1999/xhtml"
		exclude-result-prefixes="html"
		version="1.0">

  <xsl:import href="http://docbook.sourceforge.net/release/website/current/xsl/website.xsl"/>

  <xsl:include href="global-ja.xsl"/>

  <!-- website-common overrides -->
  <xsl:include href="webpage-ja.xsl"/>

  <!-- local customizations -->
  <xsl:include href="netbsd-ja.xsl"/>

</xsl:stylesheet>
