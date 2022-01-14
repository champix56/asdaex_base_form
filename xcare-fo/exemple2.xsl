<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="libs/defaults_templates.xsl"/>
	<xsl:variable name="serviceInfos" select="document('dataServices/service2.xml')"/>
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
						<xsl:call-template name="pat-ident"/>
						<xsl:apply-templates select="//label21092204789045220233"/>
						<fo:block color="blue" margin-left="5cm">
							<xsl:apply-templates select="//label21092204789045220233"/>
						</fo:block>
						<xsl:apply-templates select="//*[@style='draw']"/>
						<fo:block border="0.3mm solid black" padding="0.3mm" margin-right="0.5mm">
							<xsl:apply-templates select="//conclusion"/>
							<xsl:apply-templates select="//richtext633252412205744509206"/>
						</fo:block>
					</fo:block>
					<xsl:call-template name="finDePagination"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
