<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="./defaults_styles.xsl"/>
	<xsl:template match="table">
		<fo:table>
			<xsl:choose>
				<xsl:when test="not(tbody)">
					<xsl:call-template name="tbody"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="thead"/>
					<xsl:apply-templates select="tbody"/>
					<xsl:apply-templates select="tfoot"/>
				</xsl:otherwise>
			</xsl:choose>
		</fo:table>
	</xsl:template>
	<xsl:template match="thead">
		<fo:table-header>
			<xsl:apply-templates select="tr"/>
		</fo:table-header>
	</xsl:template>
	<xsl:template match="tfoot">
		<fo:table-footer>
			<xsl:apply-templates select="tr"/>
		</fo:table-footer>
	</xsl:template>
	<xsl:template match="tbody" name="tbody">
		<fo:table-body>
			<xsl:apply-templates select=".//tr"/>
		</fo:table-body>
	</xsl:template>
	<xsl:template match="tfoot">
		<fo:table-footer>
			<xsl:apply-templates select=".//tr"/>
		</fo:table-footer>
	</xsl:template>
	<xsl:template match="tr">
		<fo:table-row>
			<xsl:apply-templates select=".//td|.//th"/>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="td">
		<fo:table-cell>
			<fo:block>
				<xsl:apply-templates select="*|text()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="th">
		<fo:table-cell text-align="center" font-weight="900">
			<fo:block>
				<xsl:apply-templates select="*|text()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="s">
		<fo:inline xsl:use-attribute-sets="richetext-barre">
			<xsl:apply-templates select="*|text()"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="u">
		<fo:inline xsl:use-attribute-sets="richetext-underline">
			<xsl:apply-templates select="*|text()"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="em">
		<fo:inline xsl:use-attribute-sets="richetext-italic">
			<xsl:apply-templates select="*|text()"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="strong">
		<fo:inline xsl:use-attribute-sets="richetext-bold">
			<xsl:apply-templates select="*|text()"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="sup">
		<fo:inline xsl:use-attribute-sets="richetext-sup">
			<xsl:apply-templates select="*|text()"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="sub">
		<fo:inline xsl:use-attribute-sets="richetext-sub">
			<xsl:apply-templates select="*|text()"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="br">
		<fo:block/>
	</xsl:template>
	<xsl:template match="hr">
		<fo:block border-bottom="0.2mm solid grey"/>
	</xsl:template>
	<xsl:template match="div[starts-with(@style,'text-align:')]">
		<xsl:variable name="alignType" select="substring(@style,13)"/>
		<xsl:variable name="alignTypeNoEndLine" select="substring($alignType,1,string-length($alignType)-1)"/>
		<fo:block text-align="{$alignTypeNoEndLine}">
			<xsl:apply-templates select="*|text()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="span[starts-with(@style,'color:')]">
		<xsl:variable name="color" select="substring(@style,7)"/>
		<xsl:variable name="colorNoEndLine" select="substring($color,1,string-length($color)-1)"/>
		<fo:inline color="{$colorNoEndLine}">
			<xsl:apply-templates select="*|text()"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="div[starts-with(@style,'margin-left:')]">
		<xsl:variable name="margin" select="substring(@style,13)"/>
		<xsl:variable name="marginNoEndLine" select="substring($margin,1,string-length($margin)-1)"/>
		<fo:block margin-left="{$marginNoEndLine}">
			<xsl:apply-templates select="*|text()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="ol">
		<fo:list-block>
			<xsl:for-each select="li">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:value-of select="position()"/>.</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block>
							<xsl:apply-templates select="*|text()"/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</xsl:for-each>
		</fo:list-block>
	</xsl:template>
	<xsl:template match="ul">
		<fo:list-block>
			<xsl:apply-templates select="*"/>
		</fo:list-block>
		<!--<xsl:apply-templates select="*|text()"/>-->
	</xsl:template>
	<xsl:template match="li">
		<fo:list-item>
			<fo:list-item-label end-indent="label-end()">
				<fo:block>
					<fo:instream-foreign-object content-height="0.3cm" content-width="0.3cm">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 12">
							<circle cx="6" cy="6" r="5"/>
						</svg>
					</fo:instream-foreign-object>
				</fo:block>
			</fo:list-item-label>
			<fo:list-item-body start-indent="body-start()">
				<fo:block>
					<xsl:apply-templates select="*|text()"/>
				</fo:block>
			</fo:list-item-body>
		</fo:list-item>
	</xsl:template>
</xsl:stylesheet>
