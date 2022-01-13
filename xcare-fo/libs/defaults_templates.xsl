<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="./defaults_styles.xsl"/>

	<xsl:template name="default-layouts">
	<!--def. des formats de apier courrant utilisable par tous les formulaires-->
		<fo:simple-page-master master-name="A4_portrait_head_foot" page-height="297mm" page-width="210mm">
			<fo:region-body margin-bottom="5mm" margin-top="2cm"/>
			<fo:region-before extent="2cm"/>
			<fo:region-after extent="5mm"/>
		</fo:simple-page-master>
		<fo:simple-page-master master-name="A4_portrait_nohead_nofoot" page-height="297mm" page-width="210mm">
			<fo:region-body/>
		</fo:simple-page-master>
	</xsl:template>
	<xsl:template name="default-region-before">
		<fo:static-content flow-name="xsl-region-before">
					<fo:block>
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
											Belgique
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
				</fo:static-content>
				
	</xsl:template>
</xsl:stylesheet>
