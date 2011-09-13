<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet
  PUBLIC "-//NetBSD/DTD NetBSD XSLT 1.0 DTD//EN"
         "http://www.NetBSD.org/XML/htdocs/share/xml/xslt10-netbsd.dtd">

<!-- $NetBSD: netbsd-webpage-ja.xsl,v 1.11 2008/12/17 17:04:23 kano Exp $ -->
<!-- Based on english version: -->
<!-- NetBSD: netbsd-webpage-en.xsl,v 1.5 2007/07/29 11:14:22 pavel Exp   -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:html="http://www.w3.org/1999/xhtml"
		exclude-result-prefixes="html"
		version="1.0">

  <xsl:import href="netbsd-webpage.xsl" />

  <xsl:param name="locale.backto">に戻る</xsl:param>

  <xsl:output method="html" encoding="UTF-8"
	indent="yes"
	doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>


<!-- Based on english version: -->
<!-- NetBSD: netbsd.xsl,v 1.20 2007/08/29 08:30:14 dsieger Exp   -->

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
        <a href="http://www.NetBSD.org/ja/mailinglists/#{$name}"><xsl:apply-templates />
        メーリングリスト</a>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- link to port index -->
  <xsl:template match="port">
    <a>
      <xsl:attribute name="href">
        <xsl:text>/ja/ports/</xsl:text><xsl:value-of select="."/>
        <xsl:text>/</xsl:text>
      </xsl:attribute>
      <xsl:value-of select="."/>
    </a>
  </xsl:template>


<!-- Based on english version: -->
<!-- NetBSD: portpage.xsl,v 1.29 2008/08/29 23:24:09 tsutsui Exp   -->

<xsl:template match="portabout">
  <xsl:variable name="port" select="ancestor::webpage/@portpage"/>
  <h2><xsl:text>NetBSD/</xsl:text><xsl:value-of select="$port"/><xsl:text> について</xsl:text></h2>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="portsection">
  <xsl:variable name="title" select="./@title"/>
  <h2><xsl:value-of select="$title"/></h2>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="portnews">
  <xsl:variable name="port" select="ancestor::webpage/@portpage"/>
  <h2><xsl:text>NetBSD/</xsl:text><xsl:value-of select="$port"
  /><xsl:text> ニュース</xsl:text></h2>
  <xsl:for-each select="child::portnewsitem">
    <dl>
      <dt>
        <b>
          <xsl:value-of select="./@date"/>
          <xsl:text>:</xsl:text>
        </b>
        &nbsp;
        <xsl:value-of select="./@title"/>
      </dt>
      <dd>
        <xsl:apply-templates/>
      </dd>
    </dl>
  </xsl:for-each>
  <xsl:if test="child::portnewsarchive">
    <p><a href="news.html">
	<xsl:text>NetBSD/</xsl:text>
	<xsl:value-of select="$port"/>
	<xsl:text> ニュース記事のアーカイブ</xsl:text>
    </a></p>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="portinfo">
  <xsl:variable name="port" select="ancestor::webpage/@portpage"/>
  <xsl:variable name="currel">
    <xsl:choose>
      <xsl:when test="@currel = @currel"><xsl:value-of select="@currel" /></xsl:when>
      <xsl:otherwise><xsl:value-of select="'&release.latest;'"/></xsl:otherwise>

    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="currel.major" select="substring-before($currel, '.')"/>
  <xsl:variable name="currel.minor" select="substring-after($currel, '.')"/>
  <xsl:variable name="currel.previous.major" select="&release.previous.major;"/>
  <xsl:variable name="currel.next.major" select="&release.next.major;"/>

  <div class="portinfo">
    <xsl:if test="child::portinfoitem">
      <h2><xsl:text>NetBSD/</xsl:text><xsl:value-of select="$port"
      /><xsl:text> 情報</xsl:text></h2>

      <ul>
        <xsl:for-each select="child::portinfoitem">
          <li><xsl:apply-templates/></li>
        </xsl:for-each>
      </ul>
    </xsl:if>

    <xsl:if test="child::portml">
      <h2>メーリングリスト</h2>

      <ul>
        <xsl:for-each select="child::portml">
          <xsl:variable name="ml" select="./@name"/>
          <li><font size="-1">
            <xsl:text></xsl:text>
            <a>
              <xsl:attribute name="href">
                <xsl:text>../../mailinglists/#port-</xsl:text>
                <xsl:value-of select="$ml"/>
              </xsl:attribute>
              <xsl:text>NetBSD/</xsl:text>
              <xsl:value-of select="$ml"/>
              <xsl:text> メーリングリスト</xsl:text>
            </a>
            <xsl:text>、</xsl:text>
            <xsl:value-of select="./text()"/>
            <xsl:text>をカバーします:</xsl:text>
            <br/>
            <xsl:text>[</xsl:text>
            &nbsp;
            <a>
              <xsl:attribute name="href">
                <xsl:text>http://www.NetBSD.org/cgi-bin/subscribe_list.pl?list=port-</xsl:text>
                <xsl:value-of select="$ml"/>
              </xsl:attribute>
              <xsl:text>参加申込</xsl:text>
            </a>
            &nbsp;
            <xsl:text>|</xsl:text>
            &nbsp;
            <a>
              <xsl:attribute name="href">
                <xsl:text>http://mail-index.NetBSD.org/port-</xsl:text>
                <xsl:value-of select="$ml"/>
                <xsl:text>/</xsl:text>
              </xsl:attribute>
              <xsl:text>アーカイブ</xsl:text>
            </a>
            &nbsp;
            <xsl:text>]</xsl:text>
            <br/>
            &nbsp;
          </font></li>
        </xsl:for-each>
      </ul>
    </xsl:if>

    <xsl:if test="child::portcurrentitem">
      <h2>現在のリリース</h2>

      <ul>
        <xsl:for-each select="child::portcurrentitem">
          <li><font size="-1">
          <xsl:if test="@type='ftp'">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="concat('ftp://ftp.NetBSD.org/pub/NetBSD/NetBSD-', $currel, '/', $port, '/')" />
              </xsl:attribute>
              <xsl:value-of select="concat('NetBSD/', $port, ' ', $currel, ' の FTP 経由ダウンロード')"/>
            </a>
          </xsl:if>
          <xsl:if test="@type='installnotes'">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="concat('ftp://ftp.NetBSD.org/pub/NetBSD/NetBSD-', $currel, '/', $port, '/INSTALL.html')" />
              </xsl:attribute>
              <xsl:value-of select="concat('NetBSD/', $port, ' ', $currel, ' インストールノート')"/>
            </a>
          </xsl:if>
          <xsl:if test="@type='ra'">
            <a>
              <xsl:attribute name="href">
		<xsl:value-of select="concat('../../releases/formal-', $currel.major, '/NetBSD-', $currel, '.html')" />
              </xsl:attribute>
              <xsl:value-of select="concat('NetBSD ', $currel, ' リリース声明')" />
            </a>
          </xsl:if>
          <xsl:if test="@type='port-changes'">
            <a>
              <xsl:attribute name="href">
		<xsl:value-of select="concat('../../../changes/changes-', $currel.major, '.0.html#port-', $port)" />
              </xsl:attribute>
	      <xsl:value-of select="concat($currel.major, '.0 における NetBSD/', $port, ' の変更点')" />
            </a>
          </xsl:if>
          <xsl:if test="@type='netbsd-changes'">
            <a>
              <xsl:attribute name="href">
		<xsl:value-of select="concat('ftp://ftp.NetBSD.org/pub/NetBSD/NetBSD-', $currel.major, '.0/CHANGES')"/>
              </xsl:attribute>
	      <xsl:value-of select="concat('NetBSD ', $currel.previous.major, '.0 から NetBSD ', $currel.major, '.0 における変更点')" />
            </a>
          </xsl:if>
          <xsl:if test="@type='packages'">
            <xsl:text>NetBSD </xsl:text>
            <a>
              <xsl:attribute name="href">
                <xsl:text>../../docs/software/packages.html</xsl:text>
              </xsl:attribute>
              <xsl:text>パッケージコレクション</xsl:text>
            </a>
            <xsl:text>を利用した NetBSD/</xsl:text>
            <xsl:value-of select="$port"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@packages-for"/>
            <xsl:text> </xsl:text>
            <a>
              <xsl:attribute name="href">
                <xsl:text>ftp://ftp.NetBSD.org/pub/pkgsrc/packages/NetBSD/</xsl:text>
                <xsl:value-of select="$port"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="@packages-for"/>
                <xsl:text>/</xsl:text>
              </xsl:attribute>
              <xsl:text>コンパイル済みバイナリーパッケージ各種</xsl:text>
            </a>
          </xsl:if>
          <xsl:if test="@type='mirrors'">
            <a href="../../mirrors/">
              <xsl:text>NetBSD FTP ミラーサイト一覧</xsl:text>
            </a>
          </xsl:if>
          <xsl:if test="@type='cdroms'">
            <a href="../../sites/cdroms.html">
              <xsl:text>NetBSD の CD-ROM</xsl:text>
            </a>
          </xsl:if>
          <xsl:if test="not(@type)">
            <xsl:apply-templates/>
          </xsl:if>
          </font></li>
        </xsl:for-each>
      </ul>
    </xsl:if>

    <xsl:if test="child::portfutureitem">
      <h2>今後のリリース</h2>

      <ul>
        <xsl:for-each select="child::portfutureitem">
          <xsl:variable name="type" select="./@type"/>
          <li><font size="-1">
            <xsl:if test="@type='changes'">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="concat('../../../changes/changes-', $currel.next.major, '.0.html#port-', $port)" />
              </xsl:attribute>
              <xsl:value-of select="concat($currel.major, '.0 から ', $currel.next.major, '.0 における', 'NetBSD/', $port, ' の変更点')" />
            </a>
            </xsl:if>
            <xsl:if test="@type='snapshots'">
            <a>
              <xsl:attribute name="href">
                <xsl:text>http://releng.NetBSD.org/cgi-bin/builds.cgi</xsl:text>
              </xsl:attribute>
              <xsl:text>毎日作成されている</xsl:text>
            </a>
            <xsl:text>、</xsl:text>
            <a href="../../releases/release-map.html">
              <xsl:text>NetBSD-current</xsl:text>
            </a>
            <xsl:text> の</xsl:text>
            <a>
              <xsl:attribute name="href">
                <xsl:text>ftp://ftp.NetBSD.org/pub/NetBSD-daily/HEAD/</xsl:text>
              </xsl:attribute>
              <xsl:text>バイナリースナップショット</xsl:text>
            </a>
            </xsl:if>
          </font></li>
        </xsl:for-each>
      </ul>
    </xsl:if>

    <h2>関連リンク</h2>

    <ul>
      <xsl:for-each select="child::portlinkitem">
        <li><font size="-1"><xsl:apply-templates/></font></li>
      </xsl:for-each>
      <li><font size="-1">
        <a>
          <xsl:attribute name="href">
            <xsl:text>mailto:port-</xsl:text>
            <xsl:value-of select="$port"/>
            <xsl:text>-maintainer@NetBSD.org</xsl:text>
          </xsl:attribute>
          <xsl:text>NetBSD/</xsl:text>
          <xsl:value-of select="$port"/>
          <xsl:text> ポートメンテナーにメール</xsl:text>
        </a>
        </font>
      </li>
    </ul>
  </div>
</xsl:template>


<!-- Based on english version: -->
<!-- NetBSD: webpage.xsl,v 1.40 2008/12/08 14:10:56 hubertf Exp   -->

<xsl:template name="allpages.banner">
  <div id="top">
    <a href="#mainContent" class="doNotDisplay doNotPrint">本文へ飛ぶ。</a>
  </div>
    <div id="header">
      <div class="topNavigation">
	<span>&#187;&#160;</span>
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($reltopdir,'/docs/guide/en/')"/>
	  </xsl:attribute>
	  ガイド</a> |
	<a href="http://man.NetBSD.org/">マニュアルページ</a> |
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($reltopdir,'/ja/mailinglists/')"/>
	  </xsl:attribute>
	  メーリングリスト</a>と
	<a href="http://mail-index.NetBSD.org/">記事</a> |
	<a href="http://cvsweb.NetBSD.org/">CVS リポジトリー</a> |
	バグの<a href="http://www.NetBSD.org/cgi-bin/sendpr.cgi?gndb=netbsd">報告</a>
	と
	<a>
	 <xsl:attribute name="href">
	   <xsl:value-of select="concat($reltopdir,'/ja/support/query-pr.html')"/>
	 </xsl:attribute>
	 照会</a> |
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($reltopdir,'/ja/docs/software/packages.html')"/>
	  </xsl:attribute>
	  ソフトウェアパッケージ
	</a>
      </div>
      <div class="centralHeader">
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($reltopdir,'/ja/')"/>
	  </xsl:attribute>
	  <img alt="NetBSD プロジェクト &quot;Of course it runs NetBSD&quot;" width="506" height="90">
	    <xsl:attribute name="src">
	      <xsl:value-of select="concat($reltopdir,'/images/NetBSD-headerlogo.png')"/>
	    </xsl:attribute>
	  </img>
	</a>
	<div class="headerTools">
	  <div id="headerSearch">
	    <form method="get" action="http://www.google.com/custom">
	      <input class="whiteOnBlack" type="text" 
		     name="q"
		     onfocus="if(this.value==this.defaultValue ) this.value='';" 
		     size="12" maxlength="255" value="Search"/>
	      <input type="hidden" name="cof" 
		     value="L:http://www.NetBSD.org/images/NetBSD-smaller.png;LH:200;LW:200;AH:center;AWFID:4f6b0499f0f58d2c;"/>
	      <input type="hidden" name="domains" value="NetBSD.org"/>
	      <input type="hidden" name="sitesearch" value="www.NetBSD.org"/>
	      <input type="submit" value="検索"/>
	    </form>
	  </div>
	</div>
      </div>
      <div class="navBar">
	<span class="doNotDisplay">
	  案内:
	</span>
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($reltopdir,'/ja/')"/>
	  </xsl:attribute>
	  ホーム</a>&nbsp;|&nbsp;
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($reltopdir,'/ja/about/')"/>
	  </xsl:attribute>
	  概要</a>&nbsp;|&nbsp;
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($reltopdir,'/ja/gallery/')"/>
	  </xsl:attribute>
	  展示室</a>&nbsp;|&nbsp;
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($reltopdir,'/ja/releases/')"/>
	  </xsl:attribute>
	  ダウンロード</a>&nbsp;|&nbsp;
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($reltopdir,'/ja/docs/')"/>
	  </xsl:attribute>
	  ドキュメンテーション</a>&nbsp;|&nbsp;
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($reltopdir,'/ja/support/')"/>
	  </xsl:attribute>
	  サポート</a>&nbsp;|&nbsp;
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($reltopdir,'/ja/community/')"/>
	  </xsl:attribute>
	  コミュニティー</a>&nbsp;|&nbsp;
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($reltopdir,'/ja/ports/')"/>
	  </xsl:attribute>
	  機種</a>
      </div>
    </div>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template name="webpage.table.footer"/>

<xsl:template name="webpage.footer">
   <xsl:variable name="page" select="."/>
  <xsl:variable name="cvstag" select="$page/config[@param='cvstag']/@value"/>
  <xsl:variable name="footers" select="$page/config[@param='footer']
                                       |$page/config[@param='footlink']
                                       |$autolayout/autolayout/config[@param='footer']
                                       |$autolayout/autolayout/config[@param='footlink']"/>

  <xsl:variable name="tocentry" select="$autolayout//*[@id=$page/@id]"/>
  <xsl:variable name="toc" select="($tocentry/ancestor-or-self::toc[1]
                                   | $autolayout//toc[1])[last()]"/>

  <xsl:variable name="feedback">
    <xsl:choose>
      <xsl:when test="$page/config[@param='feedback.href']">
        <xsl:value-of select="($page/config[@param='feedback.href'])[1]/@value"/>
      </xsl:when>
      <xsl:when test="$autolayout/autolayout/config[@param='feedback.href']">
        <xsl:value-of select="($autolayout/autolayout/config[@param='feedback.href'])[1]/@value"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$feedback.href"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="not($toc)">
      <xsl:message>
        <xsl:text>Cannot determine TOC for </xsl:text>
        <xsl:value-of select="$page/@id"/>
      </xsl:message>
    </xsl:when>
    <xsl:when test="$toc/@id = $page/@id">
      <!-- nop; this is the home page -->
    </xsl:when>
    <xsl:otherwise>
      <div class="navfoot">
<!-- 	<div class="foothome"> -->
<!-- 	  <a> -->
<!-- 	    <xsl:attribute name="href"> -->
<!-- 	      <xsl:call-template name="homeuri"/> -->
<!-- 	    </xsl:attribute> -->
<!-- 	    <xsl:value-of select="$foothome.text"/> -->
<!-- 	  </a> -->
<!-- 	</div> -->
<!--         <table border="0" summary="Footer navigation"> -->
<!--           <tr> -->
<!--             <td class="foothome"> -->
<!--               <span class="foothome"> -->
<!--                 <a> -->
<!--                   <xsl:attribute name="href"> -->
<!--                     <xsl:call-template name="homeuri"/> -->
<!--                   </xsl:attribute> -->
<!--                   <img src="/images/NetBSD-flag.png" -->
<!--                     alt="[NetBSD flag]" border="0" width="90" height="90"/> -->
<!--                 </a> -->
<!--               </span> -->
<!--             </td> -->
<!--             <td class="foothome"> -->
<!--               <span class="foothome"> -->
<!--                 <a> -->
<!--                   <xsl:attribute name="href"> -->
<!--                     <xsl:call-template name="homeuri"/> -->
<!--                   </xsl:attribute> -->
<!--                   <xsl:value-of select="$foothome.text"/> -->
<!--                 </a> -->
<!--               </span> -->
<!--               <br/> -->
<!--             </td> -->
<!--           </tr> -->
<!--         </table> -->

      </div>
    </xsl:otherwise>
  </xsl:choose>

  <xsl:apply-templates select="$footers" mode="footer.link.mode"/>
  <div id="footer">
  <center>
  <xsl:choose>
    <xsl:when test="$feedback != ''">
      <span class="footfeed">
        <a>
          <xsl:choose>
            <xsl:when test="$feedback.with.ids != 0">
              <xsl:attribute name="href">
                <xsl:value-of select="$feedback"/>
                <xsl:value-of select="$page/@id"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="href">
                <xsl:value-of select="$feedback"/>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
	  連絡</a> |
      </span>
    </xsl:when>
  </xsl:choose>

  <span class="footcopy">
    <a>
      <xsl:attribute name="href">
	<xsl:value-of select="concat($reltopdir,'/ja/about/disclaimer.html')"/>
      </xsl:attribute>
      免責事項</a> |

      <xsl:choose>
        <xsl:when test="head/copyright">
          <xsl:apply-templates select="head/copyright" mode="footer.mode"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates mode="footer.mode"
                             select="$autolayout/autolayout/copyright"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>ALL RIGHTS RESERVED.</xsl:text>
      <br />
      <xsl:text>NetBSD</xsl:text>
	<sup><xsl:text>&reg;</xsl:text></sup>
	<xsl:text> は The NetBSD
	Foundation, Inc. の登録商標です。</xsl:text>
  </span>
  </center>

  <xsl:if test="$sequential.links != 0">
    <xsl:variable name="prev">
      <xsl:call-template name="prev.page"/>
    </xsl:variable>
    <xsl:variable name="next">
      <xsl:call-template name="next.page"/>
    </xsl:variable>
    <xsl:variable name="ptoc"
                  select="$autolayout/autolayout//*[$prev=@id]"/>
    <xsl:variable name="ntoc"
                  select="$autolayout/autolayout//*[$next=@id]"/>

    <xsl:choose>
      <xsl:when test="$prev != ''">
        <xsl:call-template name="link.to.page">
          <xsl:with-param name="frompage" select="$tocentry"/>
          <xsl:with-param name="page" select="$ptoc"/>
          <xsl:with-param name="linktext" select="'Prev'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>&#160;</xsl:otherwise>
    </xsl:choose>
    &#160;
    <xsl:choose>
      <xsl:when test="$next != ''">
        <xsl:call-template name="link.to.page">
          <xsl:with-param name="frompage" select="$tocentry"/>
          <xsl:with-param name="page" select="$ntoc"/>
          <xsl:with-param name="linktext" select="'Next'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>&#160;</xsl:otherwise>
    </xsl:choose>
  </xsl:if>
  </div>
</xsl:template>

<xsl:template match="parentsec">
  <xsl:variable name="parentsec" select="."/>
  <hr/>
  <em><a href="{$parentsec/@url}"><xsl:value-of select="$parentsec/@text"/></a></em>
  <xsl:text> </xsl:text>
  <xsl:value-of select="$locale.backto" />
</xsl:template>


</xsl:stylesheet>
