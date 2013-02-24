<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet
  PUBLIC "-//NetBSD//DTD NetBSD XSLT 1.0 DTD//EN"
         "http://www.NetBSD.org/XML/htdocs/share/xml/xslt10-netbsd.dtd">

<!-- NetBSD: netbsd.xsl,v 1.25 2011/05/28 14:50:39 jmmv Exp  -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:html="http://www.w3.org/1999/xhtml"
                xmlns:suwl="http://nwalsh.com/xslt/ext/com.nwalsh.saxon.UnwrapLinks"
                xmlns:exsl="http://exslt.org/common"
                exclude-result-prefixes="html suwl exsl"
		version="1.0">

  <!-- beautify blocks of code -->
  <xsl:template match="programlisting|screen">
    <pre class="programlisting"><xsl:apply-templates/></pre>
  </xsl:template>

  <!-- just beautiful box -->
  <xsl:template match="notebox">
    <div class="note"><xsl:apply-templates/></div>
  </xsl:template>

  <!-- link to a mailing list -->
  <xsl:template match="mlist">
    <xsl:param name="name" select="." />
    <xsl:param name="role" select="@role" />

    <xsl:choose>
      <xsl:when test="$role = 'archive'">
        <a href="http://mail-index.NetBSD.org/{$name}/"><xsl:apply-templates />
        メーリングリスト</a>
      </xsl:when>
      <xsl:when test="$role = 'email'">
        <a href="mailto:{$name} AT NetBSD.org"><xsl:apply-templates />
        メーリングリスト</a>
      </xsl:when>
      <xsl:otherwise>
        <a href="http://www.NetBSD.org/mailinglists/#{$name}"><xsl:apply-templates />
        mailing list</a>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- link to port index -->
  <xsl:template match="port">
    <a>
      <xsl:attribute name="href">
        <xsl:text>/ports/</xsl:text><xsl:value-of select="."/>
        <xsl:text>/</xsl:text>
      </xsl:attribute>
      <xsl:value-of select="."/>
    </a>
  </xsl:template>

  <!-- link to gnats PR -->
  <xsl:template match="gnatspr">
    <a>
      <xsl:attribute name="href">
        <xsl:text>http://www.NetBSD.org/cgi-bin/query-pr-single.pl?number=</xsl:text>
        <xsl:value-of select="number"/>
      </xsl:attribute>
      <xsl:attribute name="class"><xsl:text>gnatspr</xsl:text></xsl:attribute>
      <xsl:value-of select="category"/><xsl:text>/</xsl:text>
      <xsl:value-of select="number"/>
    </a>
  </xsl:template>

  <!-- link to daily snapshot -->
  <xsl:template match="snapshot">
    <xsl:variable name="snapshot.label" select="." />
    <xsl:variable name="ulink.url">
      <xsl:choose>
	<xsl:when test="@proto = 'ftp'">
	  <xsl:value-of select="concat('&url.snap.ftp;', '/')" />
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="concat('&url.snap.http;', '/')" />
	</xsl:otherwise>
      </xsl:choose>
      <xsl:if test="@branch != ''">
	<xsl:value-of select="concat(@branch, '/')" />
      </xsl:if>
    </xsl:variable>
    <a>
      <xsl:attribute name="class">ulink</xsl:attribute>
      <xsl:attribute name="href"><xsl:value-of select="$ulink.url"/></xsl:attribute>
      <xsl:choose>
	<xsl:when test="$snapshot.label = ''">
          <xsl:value-of select="$ulink.url"/>
        </xsl:when>
	<xsl:otherwise>
	  <xsl:apply-templates/>
	</xsl:otherwise>
      </xsl:choose>
    </a>
  </xsl:template>

  <xsl:template match="filename">
    <xsl:variable name="filename.label" select="." />

    <xsl:variable name="ulink.url">
      <xsl:choose>
	<xsl:when test="@role = 'cvsweb'">
	  <xsl:value-of select="concat('&url.cvsweb;', '/')" />
	  <xsl:if test="@path">
	    <xsl:value-of select="concat(@path, '/')" />
	  </xsl:if>
	  <xsl:value-of select="concat('', $filename.label)" />
	  <xsl:choose>
	    <xsl:when test="@revision != ''">
	      <xsl:value-of select="concat('?', 'rev=', @revision)" />
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:value-of select="concat('?', 'rev=', 'HEAD')" />
	    </xsl:otherwise>
	  </xsl:choose>
	  <xsl:value-of select="concat('&amp;', 'content-type=text/x-cvsweb-markup')" />
	</xsl:when>
	<xsl:when test="@role = 'pkg'">
	  <xsl:value-of select="concat('&url.pkg;', '/')" />
	  <xsl:value-of select="concat(normalize-space(.),
	                               '/&url.pkg.readme;')" />
	</xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="link">
      <xsl:choose>
	<xsl:when test="@role = 'cvsweb' or @role = 'pkg'">
	  <a>
	    <xsl:if test="@id">
	      <xsl:attribute name="name">
		<xsl:value-of select="@id"/>
	      </xsl:attribute>
	    </xsl:if>
	    <xsl:attribute name="href"><xsl:value-of select="$ulink.url"/></xsl:attribute>
	    <xsl:if test="$ulink.target != ''">
	      <xsl:attribute name="target">
		<xsl:value-of select="$ulink.target"/>
	      </xsl:attribute>
	    </xsl:if>
	    <xsl:call-template name="inline.monoseq" />
	  </a>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:call-template name="inline.monoseq" />
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="function-available('suwl:unwrapLinks')">
	<xsl:copy-of select="suwl:unwrapLinks($link)"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:copy-of select="$link"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Formats a date -->
  <xsl:template match="date">
    <xsl:choose>
      <xsl:when test="@format = 'cvs'">
      	<xsl:variable name="text" select="substring-after(., '$Date: ')" />

      	<xsl:variable name="year" select="substring-before($text, '/')" />
      	<xsl:variable name="text2" select="substring-after($text, '/')" />

      	<xsl:variable name="month" select="substring-before($text2, '/')" />
      	<xsl:variable name="text3" select="substring-after($text2, '/')" />

      	<xsl:variable name="day" select="substring-before($text3, ' ')" />
      	<xsl:variable name="text4" select="substring-after($text2, ' ')" />

      	<xsl:variable name="time" select="substring-before($text4, ' ')" />

	<xsl:variable name="month.name">
	  <xsl:choose>
            <xsl:when test="$month = 1">1月</xsl:when>
            <xsl:when test="$month = 2">2月</xsl:when>
            <xsl:when test="$month = 3">3月</xsl:when>
            <xsl:when test="$month = 4">4月</xsl:when>
            <xsl:when test="$month = 5">5月</xsl:when>
            <xsl:when test="$month = 6">6月</xsl:when>
            <xsl:when test="$month = 7">7月</xsl:when>
            <xsl:when test="$month = 8">8月</xsl:when>
            <xsl:when test="$month = 9">9月</xsl:when>
            <xsl:when test="$month = 10">10月</xsl:when>
            <xsl:when test="$month = 11">11月</xsl:when>
            <xsl:when test="$month = 12">12月</xsl:when>
	  </xsl:choose>
	</xsl:variable>

	<xsl:value-of select="$month.name" />
	<xsl:text> </xsl:text>
	<xsl:value-of select="$day" />
	<xsl:text>, </xsl:text>
	<xsl:value-of select="$year" />
	<xsl:text> at </xsl:text>
	<xsl:value-of select="$time" />
	<xsl:text> GMT</xsl:text>
      </xsl:when>

      <xsl:otherwise>
        <xsl:apply-templates mode="plaintext" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Generates a table of contents for the sections that appear as
       sibling elements to this one -->
  <xsl:template match="toc">
    <xsl:if test="count(../sect1) != 0">
      <ul>
        <xsl:for-each select="../sect1">
	  <li>
          <h2 class="title"><a href="#{@id}"><xsl:value-of select="title" /></a></h2>

          <xsl:if test="count(sect2) != 0">
            <ol>
              <xsl:for-each select="sect2">
                <li><a href="#{@id}"><xsl:value-of select="title" /></a></li>
              </xsl:for-each>
            </ol>
          </xsl:if>
	  
	  <xsl:for-each select="projects">
	    <xsl:apply-templates select="projects-toc" />
	  </xsl:for-each>
	  </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
  </xsl:template>

  <!-- Generates a title for the beginning of a section -->
  <xsl:template match="title" mode="section">
    <xsl:param name="level"/>
    <xsl:param name="id"/>
    <xsl:choose>
      <xsl:when test="$level = 1">
        <h2 class="title"><a name="{$id}"><xsl:apply-templates /></a></h2>
      </xsl:when>
      <xsl:when test="$level = 2">
        <h3 class="title"><a name="{$id}"><xsl:apply-templates /></a></h3>
      </xsl:when>
      <xsl:when test="$level = 3">
        <h4 class="title"><a name="{$id}"><xsl:apply-templates /></a></h4>
      </xsl:when>
      <xsl:when test="$level = 4">
        <h5 class="title"><a name="{$id}"><xsl:apply-templates /></a></h5>
      </xsl:when>
      <xsl:otherwise>
        <h1><xsl:text>Unsupported title level value: </xsl:text>
        <xsl:value-of select="$level" /></h1>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Translates the given number (form 0 to 10) to a user-friendly
       string denoting a "level". -->
  <xsl:template name="format.level">
    <xsl:param name="value" />

    <xsl:choose>
      <xsl:when test="$value = 1 or $value = 2">Lowest</xsl:when>
      <xsl:when test="$value = 3 or $value = 4">Low</xsl:when>
      <xsl:when test="$value = 5 or $value = 6">Medium</xsl:when>
      <xsl:when test="$value = 7 or $value = 8">High</xsl:when>
      <xsl:when test="$value = 9 or $value = 10">Highest</xsl:when>
      <xsl:otherwise>-</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Groups a set of project definitions. -->
  <xsl:template match="projects">
    <xsl:param name="level">
      <xsl:choose>
        <xsl:when test="name(..) = 'sect1'">2</xsl:when>
        <xsl:when test="name(..) = 'sect2'">3</xsl:when>
        <xsl:when test="name(..) = 'sect3'">4</xsl:when>
        <xsl:when test="name(..) = 'sect4'">5</xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:param>

    <xsl:apply-templates select="*[name(.) != 'project']" />

    <xsl:apply-templates select="*[name(.) = 'project']">
      <xsl:sort select="title" />
      <xsl:with-param name="level" select="$level" />
    </xsl:apply-templates>
  </xsl:template>

  <!-- Generates a summary tables for all project elements sibling to
       this one. -->
  <xsl:template match="projects-toc">
    <table class="centered" border="1">
      <thead>
        <tr>
          <th>プロジェクト</th>
          <th>優先度</th>
          <th>難しさ</th>
        </tr>
      </thead>

      <tbody>
        <xsl:for-each select="../project">
          <xsl:sort select="title" />

          <tr>
            <td><a href="#{@id}"><xsl:value-of select="title" /></a></td>

            <td>
              <xsl:call-template name="format.level">
                <xsl:with-param name="value"
                                select="project-details/priority" />
              </xsl:call-template>
            </td>

            <td>
              <xsl:call-template name="format.level">
                <xsl:with-param name="value"
                                select="project-details/difficulty" />
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>

  <!-- Generates a summary tables for all project elements sibling to
       this one, just like projects-toc, but no "Status" column -->
  <xsl:template match="soc-projects-toc">
    <table class="centered" border="1">
      <thead>
        <tr>
          <th>プロジェクト</th>
          <th>難しさ</th>
        </tr>
      </thead>

      <tbody>
        <xsl:for-each select="../project">
          <xsl:sort select="title" />

          <tr>
            <td><a href="#{@id}"><xsl:value-of select="title" /></a></td>

            <td>
              <xsl:call-template name="format.level">
                <xsl:with-param name="value"
                select="project-details/difficulty" />
              </xsl:call-template>
            </td>

          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>

  <!-- Definition of a project. -->
  <xsl:template match="project">
    <xsl:param name="level"/>
    <xsl:apply-templates select="title" mode="section">
      <xsl:with-param name="id" select="@id" />
      <xsl:with-param name="level" select="$level" />
    </xsl:apply-templates>

    <xsl:apply-templates select="*[name(.) != 'title']"/>
  </xsl:template>

  <!-- General details of a project. -->
  <xsl:template match="project-details">
    <p>プロジェクト概要:</p>
    <ul>
      <xsl:apply-templates mode="project" />
    </ul>
  </xsl:template>

  <xsl:template match="priority" mode="project">
    <li>
      <i><xsl:text>Priority</xsl:text></i><xsl:text>: </xsl:text>
      <xsl:call-template name="format.level">
        <xsl:with-param name="value" select="." />
      </xsl:call-template>
    </li>
  </xsl:template>

  <xsl:template match="difficulty" mode="project">
    <li>
      <i><xsl:text>Estimated difficulty</xsl:text></i><xsl:text>: </xsl:text>
      <xsl:call-template name="format.level">
        <xsl:with-param name="value" select="." />
      </xsl:call-template>
    </li>
  </xsl:template>

  <xsl:template match="length" mode="project">
    <li>
      <i><xsl:text>予想される必要期間</xsl:text></i><xsl:text>: </xsl:text>
      <xsl:apply-templates />
    </li>
  </xsl:template>

  <xsl:template match="contact" mode="project">
    <li>
      <i><xsl:text>連絡先の個人またはグループ</xsl:text></i><xsl:text>: </xsl:text>
      <xsl:apply-templates />
    </li>
  </xsl:template>
</xsl:stylesheet>
