<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--def. d'un ensemble dattribs de propriete css pour FO-->
	<xsl:attribute-set name="block-numfacture">
		<xsl:attribute name="border">0.5mm solid black</xsl:attribute>
		<xsl:attribute name="margin-top">2cm</xsl:attribute>
		<xsl:attribute name="margin-left">25%</xsl:attribute>
		<xsl:attribute name="margin-right">25%</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="bold">
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="italic">
		<xsl:attribute name="font-style">italic</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="underline">
		<xsl:attribute name="text-decoration">underline</xsl:attribute>
	</xsl:attribute-set>
		<xsl:attribute-set name="no-underline">
		<xsl:attribute name="text-decoration">normal</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="blue">
		<xsl:attribute name="color">blue</xsl:attribute>
	</xsl:attribute-set>	
	<xsl:attribute-set name="red">
		<xsl:attribute name="color">red</xsl:attribute>
	</xsl:attribute-set>	
</xsl:stylesheet>
