<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
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
				<xsl:call-template name="cartouche-service"/>
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<!--<xsl:copy-of select="$serviceInfos/service"/>-->
					</fo:block>
					<xsl:call-template name="finDePagination"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template name="cartouche-service">
		<fo:static-content flow-name="xsl-region-start">
			<fo:block text-align="center">
				<fo:external-graphic src="{$donneesHospi/logo}" scaling="uniform" content-height="2cm" content-width="2cm"/>
				<fo:block xsl:use-attribute-sets="richetext-bold" font-size="13pt" color="blue">
					<xsl:value-of select="$serviceInfos/service/nom"/>
				</fo:block>
				Tel:<xsl:value-of select="$serviceInfos/service/tel"/>
				<fo:block/>
				Mail:<xsl:value-of select="$serviceInfos/service/mail"/>
				<fo:block xsl:use-attribute-sets="richetext-bold" margin-top="1cm">
					<xsl:value-of select="$serviceInfos/service/chefService/nom"/>
				</fo:block>
				<fo:block font-size="9pt">
					<xsl:value-of select="$serviceInfos/service/chefService/role"/>
				</fo:block>
				<xsl:apply-templates select="$serviceInfos/service/sections/section"/>
			</fo:block>
		</fo:static-content>
	</xsl:template>
	<xsl:template match="sections/section">
		<fo:block margin-top="1cm">
			<fo:block color="skyblue" text-decoration="underline" font-style="italic">
				<xsl:value-of select="nom"/>
			</fo:block>
			<xsl:apply-templates select="personnels/personnel"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="section/personnels/personnel">
		<fo:block>
			<xsl:value-of select="nom/@civ"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<xsl:value-of select="nom"/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
