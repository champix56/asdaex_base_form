<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--inclusion des styles xsl sous forme attribute set -->
	<xsl:include href="styles.xsl"/>
<!--template pour un noeud facture-->
	<xsl:template match="facture">
		<!--gen. d'un nouvel ensemble de page pour ce template-->
			<fo:page-sequence master-reference="A4_Portrait_head_foot_nomargins">
				<fo:flow flow-name="xsl-region-body">
					<fo:block color="blue" font-weight="700" font-size="12pt">
					<!--mise en place d'element contenu pour une facture-->
						Facture N°<xsl:value-of select="@numfacture"/>
						<fo:block font-style="oblique" text-decoration="underline" color="green" >
							émise le :<xsl:value-of select="@datefacture"/>
						</fo:block>
						<!--acces en profondeur uniquement A PARTIR DU NOEUD COURRANT-->
						Montant total :<xsl:value-of select="sum(.//stotligne)"/>€
						Montant total de toutes les factures :<xsl:value-of select="sum(//stotligne)"/>€
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
	</xsl:template>
<!--template pour le demarrage de la transformation-->
	<xsl:template match="/">
	<!--balise principale du format de sortie FO-->
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!--
				def. des formats de papiers 
				utilisable pour ce pdf
			-->
			<fo:layout-master-set>
				<!--
					format metrique et accessoires (pieds tete, ...) 
					d'un type de papier utilisable
				-->
				<fo:simple-page-master master-name="A4_Portrait_nohead_nofoot_nomargins" page-height="297mm" page-width="21cm">
					<fo:region-body></fo:region-body>
				</fo:simple-page-master>
				<!--2eme format simple avec regions disponibles-->
				<fo:simple-page-master master-name="A4_Portrait_head_foot_nomargins" page-height="297mm" page-width="21cm">
					<fo:region-body background-color="PINK" margin-top="2cm" margin-bottom="0.5cm"></fo:region-body>
					<fo:region-before background-color="#AFEEEE" extent="2cm"/>
					<fo:region-after background-color="#ACE0BA" extent="0.5cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!--
				def. des constructions des differents chapitres
				du document à produire
				
avec une page de garde sans declenchementtemplate et non reutilisable 

avec une suite de page-sequence generrer par le apply-templates //facture
			-->
			<fo:page-sequence master-reference="A4_Portrait_nohead_nofoot_nomargins">
				<fo:flow flow-name="xsl-region-body">
					<fo:block> UNE PAGE DE GARDE CONSTANTE avec <xsl:value-of select="count(//facture)"/> factures</fo:block>
				</fo:flow>
			</fo:page-sequence>
			<!--declenchement des pages sequence pour chacunes des balises //facture -->
			<xsl:apply-templates select="//facture"/>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
