<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title></title>
			</head>
			<body>
				<h1>Facture en date du :<xsl:value-of select="/factures/@dateeditionXML"/></h1>
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>
