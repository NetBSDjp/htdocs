<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>

<!-- $NetBSD: index.xsl,v 1.4 2010/02/20 17:28:15 hubertf Exp $ -->
<!-- Based on english version: -->
<!-- NetBSD: index.xsl,v 1.4 2010/02/20 17:28:15 hubertf Exp   -->

<!-- Copyright (c) 1994-2006
	The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED. -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:html="http://www.w3.org/1999/xhtml"
                version="1.0">

  <xsl:include href="../../share/xsl/netbsd-webpage-ja.xsl"/>

  <xsl:template match="developer">
    <xsl:variable name="email"><xsl:value-of select="email"/></xsl:variable>
    <xsl:variable name="url"><xsl:value-of select="url"/></xsl:variable>
    <xsl:variable name="area"><xsl:value-of select="area"/></xsl:variable>
    <xsl:variable name="note"><xsl:value-of select="note"/></xsl:variable>
    <xsl:variable name="key"><xsl:value-of select="key"/></xsl:variable>
    <tr>
      <xsl:if test="not(contains($email, '@'))">
       <xsl:attribute name="id">
         <xsl:value-of select="email"/>
       </xsl:attribute>
      </xsl:if>
      <td>
        <xsl:attribute name="bgcolor">#f1f1f1</xsl:attribute>
	<xsl:attribute name="class">developerslist</xsl:attribute>
        <xsl:choose>
          <xsl:when test="$url != ''">
            <a>
              <xsl:attribute name="href"><xsl:value-of select="url"/></xsl:attribute>
              <xsl:value-of select="name"/> 
            </a>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="name"/>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
      <xsl:attribute name="bgcolor">#e8e8e8</xsl:attribute>
      <xsl:attribute name="class">developerslist</xsl:attribute>
        <xsl:apply-templates select="email"/>
      </td>
      <td>
      <xsl:attribute name="class">developerslistwrap</xsl:attribute>
      <xsl:attribute name="bgcolor">#eeeeee</xsl:attribute>
      <xsl:choose>
	<xsl:when test="note">
	  <xsl:value-of select="note"/>
	</xsl:when>
	<xsl:otherwise>	  
	  <xsl:for-each select="group">
	    <xsl:value-of select="." />
	    <xsl:if test="position() != count(../group) or ../area">, </xsl:if>
	  </xsl:for-each>
	  <xsl:value-of select="area"/>
	</xsl:otherwise>
      </xsl:choose>
      </td>
      <td>
        <xsl:attribute name="bgcolor">#e8e8e8</xsl:attribute>
        <xsl:if test="$key = 'yes'">
        <a>
          <xsl:attribute name="href">
            <xsl:text>http://pgp.mit.edu:11371/pks/lookup?search=%3C</xsl:text>
            <xsl:value-of select="email"/>
            <xsl:text>%40NetBSD.org%3E&amp;op=index&amp;exact=on</xsl:text>
          </xsl:attribute>
          <xsl:text>PGP 鍵</xsl:text>
        </a>
        </xsl:if>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="people">
    <table border="0" class="developerslist">
      <xsl:apply-templates/>
    </table>
  </xsl:template>

</xsl:stylesheet>
