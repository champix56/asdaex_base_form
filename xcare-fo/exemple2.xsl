<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="libs/defaults_templates.xsl"/>
	<xsl:variable name="serviceInfos" select="document('dataServices/cardio.xml')"/>
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<xsl:call-template name="default-layouts"/>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4_default_first_header_all_footer">
				<xsl:call-template name="default-header-and-footer"/>
				<xsl:call-template name="cartouche-service">
					<xsl:with-param name="service" select="$serviceInfos"/>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<!--<xsl:copy-of select="$serviceInfos/service"/>-->
					</fo:block>
					<xsl:call-template name="finDePagination"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	
</xsl:stylesheet>
