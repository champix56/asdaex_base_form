<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="libs/defaults_templates.xsl"/>
	<xsl:include href="libs/debug.xsl"/>
	<!--traitements specifique pour ce formulaire uniquement-->
	<!--redefinition d'un composant generique pour ce form-->
	<xsl:template match="*[@style='lbl']" priority="1">
		traitement specifique d'un label lambda pour ce formulaire
	</xsl:template>
	<!--
		definition de présentation specifique d'un noeud existant pour ce formulaire
		match avec niveau de priority + haut qu'un match * donc l'attrib priority est pas necessaire
		il sera implicitement priotitaire face aux gestions generique match *
	-->
	<xsl:template match="lbl_attprop_medinstau">
		traitement specifique d'un label de nom de balise lbl_attprop_medinstau pour ce formulaire
	</xsl:template>
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<!--layouts par default pour tous les formulaire du site-->
				<xsl:call-template name="default-layouts"/>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4_portrait_head_foot">
				<xsl:call-template name="default-region-before"/>
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<fo:block>
							<xsl:apply-templates select="/*/@patFirstName | /*/@patLastName"/>
						</fo:block>
						<xsl:apply-templates select="/*/dessin">
							<xsl:with-param name="width">17cm</xsl:with-param>
						</xsl:apply-templates>
						<xsl:apply-templates select="/*/*"/>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
