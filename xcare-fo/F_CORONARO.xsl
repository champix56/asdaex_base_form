<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="libs/defaults_templates.xsl"/>
<!--	<xsl:include href="libs/debug.xsl"/>
-->	<!--traitements specifique pour ce formulaire uniquement-->
	<!--redefinition d'un composant generique pour ce form
	<xsl:template match="*[@style='lbl']" priority="1">
		traitement specifique d'un label lambda pour ce formulaire
	</xsl:template>-->
	<!--
		definition de présentation specifique d'un noeud existant pour ce formulaire
		match avec niveau de priority + haut qu'un match * donc l'attrib priority est pas necessaire
		il sera implicitement priotitaire face aux gestions generique match *

	<xsl:template match="lbl_attprop_medinstau">
		traitement specifique d'un label de nom de balise lbl_attprop_medinstau pour ce formulaire
	</xsl:template>
	-->
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<!--layouts par default pour tous les formulaire du site-->
				<xsl:call-template name="default-layouts"/>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4_portrait_head_foot">
				<xsl:call-template name="default-header-and-footer"/>
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
	<!--<xsl:apply-templates select="//*[@style='lbl']|//*[@style='txt']|//*[@style='chk']|//*[@style='richetxt']"/>					-->
<xsl:apply-templates select="/*/*"/>
					</fo:block>
					<!--installation du repere dederniere page pour le calucul de pagination complet-->
					<xsl:call-template name="finDePagination"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
