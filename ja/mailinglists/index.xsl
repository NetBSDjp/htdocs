<?xml version="1.0" encoding="UTF-8"?> <!-- -*- html -*- -->
<!DOCTYPE xsl:stylesheet
  PUBLIC "-//NetBSD/DTD NetBSD XSLT 1.0 DTD//EN"
	 "http://www.NetBSD.org/XML/htdocs/share/xml/xslt10-netbsd.dtd">

<!-- $NetBSD: index.xsl,v 1.2 2007/06/09 19:05:16 dsieger Exp $ -->
<!-- Based on english version: -->
<!-- NetBSD: index.xsl,v 1.2 2007/06/09 19:05:16 dsieger Exp   -->

<!-- Copyright (c) 2005-2006
	The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED. -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:import href="../../share/xsl/netbsd-webpage-ja.xsl"/>

<xsl:template match="sect1[@id='list-of-mailing-lists']/title |
		sect1[@id='descriptions-of-mailing-lists']/title">
  <h2 class="title"><xsl:apply-templates /></h2>
</xsl:template>

<xsl:template match="itemizedlist[@role='netbsd-lists']/title">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="formalpara[@role='netbsd-mailinglist']/title">
  <div><strong><xsl:apply-templates />:</strong></div>
</xsl:template>

<xsl:template match="formalpara[@role='netbsd-mailinglist']">
  <xsl:apply-templates />
</xsl:template>

<!-- mailing list index with hyperlinks to descriptions -->
<xsl:template match="sect1[@id='list-of-mailing-lists']">
  <xsl:variable name="description.node" select="parent::*/sect1[@id='descriptions-of-mailing-lists']" />
  <a name="{@id}"></a>
  <xsl:apply-templates select="$description.node/title" />

  <table>
    <colgroup span="3" valign="top" />
    <tr valign="top">
      <th><xsl:apply-templates select="$description.node/itemizedlist[@id='general-lists']/title" /></th>
      <th><xsl:apply-templates select="$description.node/itemizedlist[@id='port-specific-lists']/title" /></th>
      <th><xsl:apply-templates select="$description.node/itemizedlist[@id='obsolete-lists']/title" /></th>
    </tr>
    <tr valign="top">
      <td>
        <xsl:apply-templates select="$description.node/itemizedlist[@id='general-lists']" mode="titles.only" />
      </td>
      <td>
        <xsl:apply-templates select="$description.node/itemizedlist[@id='port-specific-lists']" mode="titles.only" />
      </td>
      <td>
        <xsl:apply-templates select="$description.node/itemizedlist[@id='obsolete-lists']" mode="titles.only" />
      </td>
    </tr>
  </table>
</xsl:template>

<!-- List the titles of different types of mailing lists -->
<xsl:template match="sect1/itemizedlist[@id='general-lists'] |
		sect1/itemizedlist[@id='port-specific-lists'] |
		sect1/itemizedlist[@id='obsolete-lists']"
		mode="titles.only">
  <ul>
    <xsl:for-each select="listitem/formalpara">
      <li>
      <xsl:apply-templates select="." mode="titles.only" />
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>

<!-- List the title of this list -->
<xsl:template match="formalpara[@role='netbsd-mailinglist']" mode="titles.only">
  <xsl:variable name="listname" select="@id" />
      <xsl:choose>
        <xsl:when test="$listname">
	  <xsl:element name="a">
	    <xsl:attribute name="href">
	      #<xsl:value-of select="$listname" />
	    </xsl:attribute>
	    <xsl:apply-templates select="title" mode="titles.only" />
	  </xsl:element>
        </xsl:when>
	<xsl:otherwise>
	  <xsl:apply-templates select="title"  mode="titles.only" />
	</xsl:otherwise>
      </xsl:choose>
</xsl:template>

<!-- descriptions of mailing lists -->
<xsl:template match="sect1[@id='descriptions-of-mailing-lists']">
  <a name="{@id}"></a>
  <xsl:apply-templates />
</xsl:template>

<!-- List the descriptions of the different mailing list types -->
<xsl:template match="sect1/itemizedlist[@id='general-lists'] |
		sect1/itemizedlist[@id='port-specific-lists'] |
		sect1/itemizedlist[@id='obsolete-lists']">

  <h3 class="title"><xsl:apply-templates select="title" /></h3>
  <xsl:variable name="listtype" select="@id"/>

  <table>
    <colgroup span="4" valign="top" />
    <!-- each formalpara describes a list -->
    <xsl:for-each select="listitem/formalpara">
      <xsl:variable name="listname" select="@id" />
      <!-- map listname to groupname -->
      <xsl:variable
	name="groupname"
	xmlns:newsgroups="http://www.NetBSD.org/mailinglists/list2group.xsl"
	select="document('../../mailinglists/list2group.xsl')/*/newsgroups:group[@list=$listname]/text()" />

      <tr valign="top">
	<!-- subscribe link -->
        <td>
          <!-- obsolete lists cannot be subscribed -->
          <xsl:if test="$listtype!='obsolete-lists'">
          <a>
            <xsl:attribute name="href"><xsl:text>http://www.NetBSD.org/cgi-bin/subscribe_list.pl?list=</xsl:text><xsl:value-of select="$listname" /></xsl:attribute>
            <img src="../../images/misc/envelope.gif" border="0" alt="[subscribe]"/>
          </a>
          </xsl:if>
        </td>

	<!-- archive link -->
        <td>
          <a>
            <xsl:attribute name="href">http://mail-index.NetBSD.org/<xsl:value-of select="$listname" />/</xsl:attribute>
            <img src="../../images/misc/tape.gif" border="0" alt="[view archive]"/>
          </a>
        </td>

	<!-- newsgroup link -->
        <td>
          <!-- If Gmane knows the list, the groupname should not be empty -->
          <xsl:if test="boolean($groupname)">
	    <a>
              <xsl:attribute name="href">http://dir.gmane.org/<xsl:value-of select="$groupname" />/</xsl:attribute>
	      <img src="../../images/misc/news.gif" border="0" alt="[newsgroup]"/>
	    </a>
          </xsl:if>
        </td>

	<!-- description -->
        <td>
	  <xsl:if test="$listname">
	    <xsl:element name="a">
	      <xsl:attribute name="name">
	        <xsl:value-of select="$listname" />
	      </xsl:attribute>
	    </xsl:element>
	  </xsl:if>
          <xsl:apply-templates select="." />
        </td>
      </tr>
    </xsl:for-each>
  </table>
</xsl:template>


</xsl:stylesheet>


