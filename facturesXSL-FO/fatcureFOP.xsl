<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--def. grossiere de l'existance d'un format d'ecriture de devise euro-->
	<xsl:decimal-format name="devise-euro" grouping-separator=" " decimal-separator="," NaN="INVALID"/>
	<!--inclusion des styles xsl sous forme attribute set -->
	<xsl:include href="styles.xsl"/>
	<!--
		un template ne se declenchant pas seul c'est a nous de l'APPELER EXPLICITEMENT PAR SONT NOM
		
		ATTENTION : Appel par XSL:CALL-TEMPLATE et non apply-templates

		ATTENTION contrairement au template match, le template NAME n'effectue pas de placement dans un noued
	-->
	<xsl:template name="lignes-total">
		<!--  
			equivalent a une variable mais a porté template et possibilité de fournir la valeur lors de l'appel
		-->
		<xsl:param name="mesLignesDeFactures"/>
		<fo:table-row>
			<fo:table-cell number-columns-spanned="4" background-color="rgb(144,238,244)">
				<fo:block text-align="right">Montant ttc :<xsl:value-of select="format-number(sum($mesLignesDeFactures//stotligne),'0.00€')"/></fo:block>
				<!--
					positionnement non relatif au placement courrant mais 
					a partir d'un (ou plusieurs) noeuds fournit en parametre
				-->
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell number-columns-spanned="4">
				<fo:block>Une ligne de total -- <xsl:value-of select="name()"/></fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<!--
		template poubelle d'echapement pour annuler 
		le traitement automituqe ne possedant pas de template 
		de traitement explicite
	-->
	<xsl:template match="*|@*"/>
	<!--
		un template generique pour un noeuds 
		quel quil soit tant qu'il est enfant de ligne
		
		Avec exclusion des balises portant le nom de balise 'surface'
	-->
	<xsl:template match="ligne/*[name()!='surface']">
		<fo:table-cell border-top="0.5mm solid black">
			<fo:block><xsl:value-of select="."/></fo:block>
		</fo:table-cell>	
	</xsl:template>
	<!--templae pour un enfant de ligne specifique necessitant un traitement d'arondi et expression de la devise-->
	<xsl:template match="ligne/phtByUnit | ligne/stotligne">
		<fo:table-cell border-top="0.5mm solid black">
			<!--
				mise en oeuvre d'une constante reutilisable 
				(uniquement de la balise parent ou elle est déclaré)
			-->
			<xsl:variable name="arrondiValeur" select="round( . *100) div 100"/>
			<!--
				usage de la "variable" le nom de la variable est prefixée avec '$' 
				pour que XPATH prenne bien la variable et non un noeud du fichier XML

				Ajout du format du nombre
			-->
			<fo:block><xsl:value-of select="format-number($arrondiValeur,'0.00€')"/></fo:block>
		</fo:table-cell>	
	</xsl:template>
	<xsl:template match="lignes/ligne">
		<fo:table-row>
			<xsl:apply-templates select="*"/>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="lignes">
	<!--structure de table-->
	<fo:table margin-top="2cm">
	<!--header facultatif-->
		<fo:table-header>
			<fo:table-row background-color="rgb(200,200,235)">
				<fo:table-cell><fo:block>Ref</fo:block></fo:table-cell>
				<fo:table-cell><fo:block>Designation</fo:block></fo:table-cell>
				<fo:table-cell><fo:block>€/Unit.</fo:block></fo:table-cell>
				<fo:table-cell><fo:block>Quant.</fo:block></fo:table-cell>
				<fo:table-cell background-color="orange"><fo:block>Stotligne</fo:block></fo:table-cell>
			</fo:table-row>
		</fo:table-header>
		<fo:table-body>
			<xsl:apply-templates select="ligne"/>
			<!--APPEL DU TEMPLATE NAME-->
			<xsl:call-template name="lignes-total">
				<!--appel avec une valeur pour le parametre ici lignes issue de cette facture-->
				<xsl:with-param name="mesLignesDeFactures" select="."/>
			</xsl:call-template>
			<!--meme opération mais total de toutes les factures-->
			<xsl:call-template name="lignes-total">
				<!--appel avec une valeur pour le parametre ici lignes issue de cette facture-->
				<xsl:with-param name="mesLignesDeFactures" select="//lignes"/>
			</xsl:call-template>
		</fo:table-body>
	</fo:table>
	</xsl:template>
	<xsl:template match="@numfacture">
		<fo:block xsl:use-attribute-sets="block-numfacture underline">
		<!--block conditionnel avec plusieurs possibilités (pas de if si lusieurs possibilités)-->
			<xsl:choose>
				<xsl:when test="contains(../@type,'evis')">Devis </xsl:when>
				<xsl:otherwise>Facture </xsl:otherwise>
			</xsl:choose> N° <fo:inline xsl:use-attribute-sets="underline"><xsl:value-of select="."/></fo:inline><fo:block/>
			En date du : <fo:inline xsl:use-attribute-sets="bold blue" text-decoration="normal"><xsl:value-of select="../@datefacture"/></fo:inline>
			<!--
				block conditionnel sans usage en cas de valeur fausse 
				(test uniquement si vrai et pas d'execution contraire si faux)
				ATTENTION si cas le cas contraire doit lui aussi executer du code on utilise le choose/when/otherwise
			-->
			<xsl:if test="../@refdevis"><fo:block/>En ref. du devis N° <xsl:value-of select="../@refdevis"/></xsl:if>
		</fo:block>
	</xsl:template>
<!--template pour un noeud facture-->
	<xsl:template match="facture">
		<!--gen. d'un nouvel ensemble de page pour ce template-->
			<fo:page-sequence master-reference="A4_Portrait_head_foot_nomargins">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<xsl:apply-templates select="@numfacture"/>
						<xsl:apply-templates select="lignes"/>
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
