<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="libs/defaults_templates.xsl"/>
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<!--layouts par default pour tous les formulaire du site-->
				<xsl:call-template name="default-layouts"/>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4_portrait_head_foot">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>Hello</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
