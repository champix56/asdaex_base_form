<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template match="@*">
			<fo:block/><xsl:value-of select="name()"/>:<xsl:value-of select="."/>*
	</xsl:template>
	<xsl:template match="*">
		<fo:block color="red" border="0.5mm solid red" padding="7mm" margin-top="5mm">
			<xsl:value-of select="."/>:<xsl:value-of select="name()"/>
			<xsl:if test="@*">
				<xsl:apply-templates select="@*"/>
			</xsl:if>
			<xsl:apply-templates select="*"/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
