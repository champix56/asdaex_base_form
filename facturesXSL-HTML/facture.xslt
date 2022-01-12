<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns="http://www.w3.org/1999/xhtml" version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<!--decl. d'un model de presentation global pour une balise facture-->
	<xsl:template match="facture">
		une facture par template <br/>
	</xsl:template>
	<!--decl. d'un model de presentation global pour une balise facture-->
	<xsl:template match="facture[contains(@type,'evis')]">
		un devis par template <br/>
	</xsl:template>
	<!--mise en oeuvre d'un template "poubelle" ne faisant rien pour tous les noeuds recus ne possèdant pas de noeuds de presentation-->
	<xsl:template match="*|@*"/>	
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
