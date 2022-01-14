<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="./defaults_styles.xsl"/>
	<xsl:include href="./defaults_components.xsl"/>
	<xsl:template match="*|@*"/>
	<!--
		variable global de configuration 

		les params eux peuvent etre modifier depuis l'execution de la commande fop pour chaque transformations
	-->
	<xsl:variable name="paperWidth" select="'8in'"/>
	<xsl:param name="paperHeight" select="'11in'"/>

	<xsl:template name="default-layouts">
	<!--def. des formats de apier courrant utilisable par tous les formulaires-->
		<fo:simple-page-master master-name="A4_portrait_head_foot" page-height="{$paperHeight}" page-width="{$paperWidth}">
			<fo:region-body margin-bottom="5mm" margin-top="2cm" column-count="2"/>
			<fo:region-before extent="2cm"/>
			<fo:region-after extent="5mm"/>
		</fo:simple-page-master>
		<fo:simple-page-master master-name="A4_portrait_nohead_nofoot" page-height="{$paperHeight}" page-width="{$paperWidth}">
			<fo:region-body/>
		</fo:simple-page-master>
	</xsl:template>
	<xsl:template name="default-region-before">
		<fo:static-content flow-name="xsl-region-before">
					<fo:block border-bottom="0.2mm solid #0f5a93">
						<fo:table>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell width="4cm" text-align="right">
										<fo:block>
											<!--
												mise en place d'une image externe(jpg)
	
												ATTENTION AUX CHEMINS DE L'IMAGE
														TOUJOURS PRIVILEGIER LES CHEMINS "PROTOCOLE" toutes versions FOP
													ex :	ftp://chemin/image.jpg
															http://chemin/img.png
															file:///c:/chemin/img.tif

													PAS UTILISE DES VERSION 2.0
															./chemin/img.jpg
											-->
											<fo:external-graphic src="https://github.com/champix56/asdaex_base_form/raw/master/xml/asdaex_logo.jpg" scaling="uniform" content-height="2cm" content-width="2cm"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center">
											<fo:block xsl:use-attribute-sets="site-title">ASDAEX</fo:block>
											Av. de l'Industrie 13 Bis<fo:block/>
											1420 Braine-l'Alleud<fo:block/>
											Belgique - format papier <xsl:value-of select="$paperHeight"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
				</fo:static-content>
	</xsl:template>
	<xsl:template name="default-region-after">
		<!--*************************************************************************************-->
		<!-- REGION FOOTER -->
		<!--*************************************************************************************-->
		<fo:static-content flow-name="xsl-region-after">
			<!--*************************************************************************************-->
			<!-- Numéro et nombre de page(s) -->
			<!--*************************************************************************************-->
			<fo:block border-top="0.05cm solid #ccc" color="#666" text-align="center" font-size="9pt"/>
			<!--*************************************************************************************-->
			<!--Personne qui a édité le document-->
			<!--*************************************************************************************-->
			<fo:table width="190mm">
				<fo:table-column column-width="80mm"/>
				<fo:table-column column-width="20mm"/>
				<fo:table-column column-width="90mm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block font-size="8pt" text-align="left">
								<fo:inline>Auteur du document :
												<xsl:value-of select="*/@doctorFirstName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="*/@doctorLastName"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block font-size="8pt" text-align="center">
								<fo:page-number/> / 
											<fo:page-number-citation ref-id="NbPageTotal"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block font-size="8pt" text-align="right">
								<fo:inline>Edité par
												<xsl:value-of select="*/@userFirstName"/>&#160;
												<xsl:value-of select="*/@userLastName"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>
	<xsl:template name="default-header-and-footer">
		<xsl:call-template name="default-region-before"/>
		<xsl:call-template name="default-region-after"/>
	</xsl:template>
	<!--repere de fin pour la pagination page total-->
	<xsl:template name="finDePagination"><fo:block id="NbPageTotal"/></xsl:template>
</xsl:stylesheet>
