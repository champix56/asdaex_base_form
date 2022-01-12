<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
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
				<!--
					une boucle local de parcous 
					des noeuds trouvés par la requete XPath
					(non reutilisable en dehors du template ou il est decl.)
				-->
				<xsl:for-each select="/factures/facture[contains(@type,'acture')]">
					Une facture<br/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>
