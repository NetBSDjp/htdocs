<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;"> <!ENTITY lf "&#10;">]>

<!-- $NetBSD: group.xsl,v 1.1 2007/06/17 15:20:02 pavel Exp $ -->
<!-- Based on english version: -->
<!-- NetBSD: group.xsl,v 1.1 2007/06/17 15:20:02 pavel Exp   -->

<!-- Copyright (c) 1994-2006
	The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED. -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:vendor="http://exslt.org/common"
                version="1.0">
  <xsl:import href="../../share/xsl/selgrp.xsl"/>
  <xsl:output method="xml"/>


<!-- <xsl:strip-space elements="people" /> -->

<xsl:template match="groupmembers">
  <xsl:variable name="members">
    <xsl:call-template name="selgrp">
      <xsl:with-param name="groupname" select="@group"/>
      <xsl:with-param name="srcfile" select="document('developerdb.xml')"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="endlist" select="@endlist"/>
  <xsl:variable name="jmena">
    <xsl:call-template name="getnames">
      <xsl:with-param name="members" select="$members" />
    </xsl:call-template>
  </xsl:variable>
  
  <xsl:for-each select="vendor:node-set($jmena)/name">
    <xsl:value-of select="."/>
    <xsl:choose>
      <xsl:when  test="$endlist='no'">,&lf;</xsl:when>
      <xsl:otherwise>
	<xsl:choose>
	  <xsl:when test="position()=last()-1">,&lf;</xsl:when>
	  <xsl:when test="position()=last()">.&lf;</xsl:when>
	  <xsl:otherwise>,&lf;</xsl:otherwise>
	</xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
