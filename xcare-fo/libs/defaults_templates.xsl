<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
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
</xsl:stylesheet>
