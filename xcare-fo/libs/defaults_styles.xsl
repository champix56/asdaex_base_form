<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:attribute-set name="site-title">
		<xsl:attribute name="color">#0f5a93</xsl:attribute>
		<xsl:attribute name="font-weight">900</xsl:attribute>
		<xsl:attribute name="text-decoration">underline</xsl:attribute>
	</xsl:attribute-set>
	<!--section de style pour les richetext-->
	<xsl:attribute-set name="richetext-bold">
		<xsl:attribute name="font-weight">900</xsl:attribute>
	</xsl:attribute-set>
		<xsl:attribute-set name="richetext-underline">
		<xsl:attribute name="text-decoration">underline</xsl:attribute>
	</xsl:attribute-set>		
	<xsl:attribute-set name="richetext-barre">
		<xsl:attribute name="text-decoration">line-through</xsl:attribute>
	</xsl:attribute-set>
		<xsl:attribute-set name="richetext-italic">
		<xsl:attribute name="font-style">italic</xsl:attribute>
	</xsl:attribute-set>
</xsl:stylesheet>
