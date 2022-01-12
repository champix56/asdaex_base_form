<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns="http://www.w3.org/1999/xhtml" version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<!--inclusion d'un fichier de librairie de presentation comprenant les templates generique a utilisé pour toutes les transfo (pour tous les formulaires)-->
	<xsl:include href="lib.xslt"/>
	<!--template specifique pour cette feuille XSL(données formulaire)-->
	<xsl:template match="@rsets">voici le nom de l'ets</xsl:template>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title></title>
			</head>
			<body>
				<h1>Facture en date du :
					<!--recup. de la valeur dans le xml-->				
					<xsl:value-of select="/factures/@dateeditionXML"/>
				</h1>
				<!--mise en oeuvre des templates en fonction des noeuds selectionnés par Exp. XPath-->
				<xsl:apply-templates select="//*"/>
				<xsl:apply-templates select="//@*"/>
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>
