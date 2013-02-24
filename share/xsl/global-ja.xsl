<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>

<!-- NetBSD: global.xsl,v 1.9 2007/07/29 11:14:22 pavel Exp  -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:html="http://www.w3.org/1999/xhtml"
		exclude-result-prefixes="html"
		version="1.0">

  <!-- global settings -->
  <xsl:output method="html" indent="yes"/>

  <xsl:param name="feedback.href">http://www.NetBSD.org/cgi-bin/feedback.cgi</xsl:param>
  <xsl:param name="feedback.link.text">(連絡先)</xsl:param>
  <xsl:param name="foothome.text">ホームページ</xsl:param>
  <xsl:param name="footer.hr">1</xsl:param>
  <xsl:param name="header.hr">0</xsl:param>
  <xsl:param name="top.link.text">トップ</xsl:param>

</xsl:stylesheet>
