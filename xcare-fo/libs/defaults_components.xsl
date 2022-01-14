<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--inclusion des modeles pour la transposition des balises html vers fo-->
	<xsl:include href="./html-transform.xsl"/>
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
	<xsl:template match="*[@style='txt'] | *[@style='txtArea']">
		<xsl:param name="color">black</xsl:param>
		<xsl:param name="underline">normal</xsl:param>
		<xsl:param name="bold">normal</xsl:param>
		<fo:block font-weight="{$bold}" text-decoration="{$underline}" color="{$color}">
			<xsl:value-of select="."/>
		</fo:block>
	</xsl:template>
	<!--traitement des contenu text simple sans balise de mise en forme uniquement contenu dans un richetxt-->
	<xsl:template match="*[@style='richetxt']/text()">
		<xsl:value-of select="."/>
	</xsl:template>
	<!--modele principal de declenchement en cascade des template pour les enfants-->
	<xsl:template match="*[@style='richetxt']">
		<fo:block>
		<!--declenchement en cascade du contenu text sans balise + declenchement des balises enfants-->
			<xsl:apply-templates select="*|text()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="*[@style='draw']">
		<!--
			Les 3 modes de decl de valeur par defaut
			<xsl:param name="width">15cm</xsl:param>
		-->
		<xsl:param name="width" select="'15cm'"></xsl:param>
		<xsl:param name="height"><xsl:value-of select="'15cm'"/></xsl:param>
		<fo:block text-align="center">
			<fo:external-graphic src="data:image/jpg;base64,{.}" scaling="uniform" content-height="{$height}" content-width="{$width}"/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
