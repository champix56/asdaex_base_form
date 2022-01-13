<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4_portrait_head_foot" page-height="297mm" page-width="210mm">
					<fo:region-body margin-bottom="5mm" margin-top="2cm"/>
					<fo:region-before extent="2cm"/>
					<fo:region-after extent="5mm"/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="A4_portrait_nohead_nofoot" page-height="297mm" page-width="210mm">
					<fo:region-body/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4_portrait_head_foot">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>Hello</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
