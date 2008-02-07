<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE xsl:stylesheet>

<!-- $NetBSD: announcement.xsl,v 1.1 2008/02/05 09:35:33 jnemeth Exp $ -->

<!-- Copyright (c) 1994-2007
	The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED. -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:vendor="http://exslt.org/common"
                version="1.0">

  <xsl:template match="sum">
    <xsl:variable name="counts">
     <xsl:for-each select="*">
	<num>
	  <xsl:apply-templates select="."/>
 	</num>
      </xsl:for-each>
    </xsl:variable>
    <xsl:value-of select="sum(vendor:node-set($counts)/num)"/>
  </xsl:template>

  <xsl:template match="count">
    <xsl:variable name="table" select="@table"/>
    <xsl:value-of select="count(id($table)/tr)"/>
  </xsl:template>

  <xsl:include href="../../share/xsl/netbsd-webpage-en.xsl"/>

</xsl:stylesheet>
