<?xml version="1.0" encoding="ISO-8859-1"?> <!-- -*- html -*- -->
<!DOCTYPE xsl:stylesheet
  PUBLIC "-//NetBSD/DTD NetBSD XSLT 1.0 DTD//EN"
	 "http://www.NetBSD.org/XML/htdocs/share/xml/xslt10-netbsd.dtd">

<!-- $NetBSD: pkgsrc-home.xsl,v 1.4 2008/03/19 16:13:04 mishka Exp $ -->
<!-- Based on english version: -->
<!-- NetBSD: pkgsrc-home.xsl,v 1.4 2008/03/19 16:13:04 mishka Exp   -->

<!-- Copyright (c) 1994-2005
	The NetBSD Foundation, Inc.  ALL RIGHTS RESERVED. -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:html="http://www.w3.org/1999/xhtml"
                version="1.0">

  <xsl:include href="../../../share/xsl/netbsd-webpage-ja.xsl"/>

<!-- Define how the top part of packages.html will look like -->
  <xsl:template match="/webpage/sect1[@id='pkgsrc-head']">

    <xsl:apply-templates select="inlinemediaobject" />
    <xsl:variable name="maxnewsitems">4</xsl:variable>

    <table cellspacing="10" cellpadding="10" width="100%">
      <tr>
	<td valign="top">
	  <xsl:apply-templates select="sect2[@id='pkgsrc-about']" />

	  <div class="webtoc">
	  <ul>
	    <xsl:for-each select="/webpage/sect1[not(@id='pkgsrc-head')]">
	      <li> <a href="#{@id}"><xsl:value-of select="title"/></a>
	      </li>
	    </xsl:for-each>
	  </ul>
	  </div>
	</td>

	<td width="40%" valign="top" bgcolor="#f5f5f5">
	
	<!-- latest pkgsrc branch -->
	  <span class="subhead">
	    <xsl:value-of select="sect2[@id='pkgsrc-latest-branch']/title" />
	  </span>

	  <br />
	  <br />

	<!-- news about pkgsrc, no more than $maxnewsitems -->
	  <span class="subhead">
	    <xsl:value-of select="sect2[@id='pkgsrc-news']/title" />
	  </span>

	  <table cellspacing="5" cellpadding="5"><tr><td>
	  <div class="newsindex">
	    <xsl:apply-templates select="sect2[@id='pkgsrc-news']/sect3[position()&lt;=$maxnewsitems]"/>
	  </div>
	  </td></tr></table>

	  <br />

	<!-- list of binary bootstrap kits, copied from the verbose
	     table in the document -->
          <span class="subhead">
 	    <xsl:value-of select="sect2[@id='pkgsrc-precompiled-bootstrap']/title" />
          </span>

	  <xsl:variable name="bootstrapkit-nodes" select="/webpage/sect1/table[@id='binary-kits']/tgroup/tbody/row"/>

	  <xsl:variable name="numbootstrapkits">
	    <xsl:value-of select="count($bootstrapkit-nodes)"/>
	  </xsl:variable>

	  <xsl:if test="$numbootstrapkits &gt; 0">
          <table cellspacing="5" cellpadding="5">
	    <tr><td>
	      <div class="newsindex">
		<ul>
		  <xsl:for-each select="$bootstrapkit-nodes[position()&lt;=($numbootstrapkits div 2)]">
		    <li><a href="{entry[@role='kit-url']/ulink/@url}"><xsl:value-of select="entry[@role='osname']"/></a>
		    </li>
		  </xsl:for-each>
		</ul>
              </div>
	    </td><td>
	      <div class="newsindex">
		<ul>
		  <xsl:for-each select="$bootstrapkit-nodes[position()&gt;($numbootstrapkits div 2)]">
		    <li><a href="{entry[@role='kit-url']/ulink/@url}"><xsl:value-of select="entry[@role='osname']"/></a>
		    </li>
		  </xsl:for-each>
		</ul>
	      </div>
	    </td></tr>
          </table>
	  </xsl:if>

	<!-- other download items of interest -->
          <span class="subhead">
 	    <xsl:value-of select="sect2[@id='pkgsrc-other-downloads']/title" />
          </span>
	  <table cellspacing="5" cellpadding="5">
            <tr><td>
              <div class="newsindex">
	        <xsl:apply-templates select="descendant::itemizedlist[@id='other-downloads']"/>
              </div>
	    </td></tr>
          </table>
        </td>
      </tr>
    </table>

  </xsl:template>

</xsl:stylesheet>
