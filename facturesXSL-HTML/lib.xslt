<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--decl. d'un model de presentation global pour une balise facture-->
	<xsl:template match="facture">
		une facture par template <br/>
	</xsl:template>
	<!--decl. d'un model de presentation global pour une balise facture de type devis ne generrant rien mais de nom de balise facture qui est matché sur un template match facture-->
	<xsl:template match="facture[contains(@type,'evis')]"></xsl:template>
	<!--mise en oeuvre d'un template "poubelle" ne faisant rien pour tous les noeuds recus ne possèdant pas de noeuds de presentation-->
	<xsl:template match="*|@*"/>	
</xsl:stylesheet>
