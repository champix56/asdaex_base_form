<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="*[@style='lbl']">
		<fo:block>
			<xsl:choose>
			<!--test pour présence de html l'attr label et que le unformated label soit present et remplis-->
				<xsl:when test="(contains(@label,'&lt;') or contains(@label,'>') )and string-length(@unformattedLabel) > 0 ">
					<xsl:value-of select="@unformattedLabel"/>
				</xsl:when>
				<!--cas par default pas de html présent et/ou pas de @unformatedlabel rempli-->
				<xsl:otherwise><xsl:value-of select="@label"/></xsl:otherwise>
			</xsl:choose>
			
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
