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
	<xsl:template match="del">
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
	<xsl:template match="br">
		<fo:block/>
	</xsl:template>
	<xsl:template match="hr">
		<fo:block border-bottom="0.2mm solid grey"/>
	</xsl:template>
</xsl:stylesheet>
