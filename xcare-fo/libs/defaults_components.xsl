<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--inclusion des modeles pour la transposition des balises html vers fo-->
	<xsl:include href="./html-transform.xsl"/>
	<!-- cascade pour les sous rapports et les contenus de lists-->
	<xsl:template match="subreport|list">
		<fo:block>
			<xsl:apply-templates select="*"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="*[@style='treatment' and .//drug]">
		<fo:block>
			<xsl:apply-templates select="@label"/>
			<fo:block/>
			<xsl:apply-templates select="drug"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="*[@style='treatment']/drug">
		<!--<fo:block><xsl:value-of select="libel"/></fo:block>-->
		<fo:table>
			<fo:table-header>
				<fo:table-row>
					<fo:table-cell>
						<fo:block>Nom medicament</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>posology</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>commentaire</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block>
							<xsl:value-of select="libel"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:value-of select="posology"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:value-of select="comment"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<!--traitement et gestion du text @label de toutes balises sans exception-->
	<xsl:template match="@label">
		<xsl:choose>
		<!--corelation grace aux convention de nomage des champs et label ATTENTION AU REEXECUTION DES NOEUDS LABEL
			<xsl:when test="string-length(.)=0">
				<xsl:variable name="parentNode" select=".."/>
				<xsl:variable name="inputName" select="substring(name($parentNode),3)"/>
				<xsl:apply-templates select="//*[contains(name(),$inputName) and @style='lbl']/@label"/>
			</xsl:when>-->
			<!--acces direct au contenu de label lie a la balise-->
			<xsl:when test="(contains(.,'&lt;') and contains(.,'>')) and string-length(../@unformattedLabel)">
				<!--cas ou du html est present dans le label et jai bien du contenu dans unformated label-->
				<xsl:value-of select="@unformattedLabel"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*[@style='lbl']">
		<fo:block>
			<xsl:apply-templates select="@label"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="*[@style='txt'] | *[@style='txtArea']">
		<xsl:param name="color">black</xsl:param>
		<xsl:param name="underline">normal</xsl:param>
		<xsl:param name="bold">normal</xsl:param>
		<fo:block font-weight="{$bold}" text-decoration="{$underline}" color="{$color}">
		<xsl:apply-templates select="@label"/><fo:block/>
			<xsl:value-of select="."/>
		</fo:block>
	</xsl:template>
	<!--traitement des contenu text simple sans balise de mise en forme uniquement contenu dans un richetxt-->
	<xsl:template match="*[@style='richetxt']/text()">
		<xsl:value-of select="."/>
	</xsl:template>
	<!--modele principal de declenchement en cascade des template pour les enfants-->
	<xsl:template match="*[@style='richetxt']">
		<fo:block>
		<xsl:apply-templates select="@label"/><fo:block/>
			<!--declenchement en cascade du contenu text sans balise + declenchement des balises enfants-->
			<xsl:apply-templates select="*|text()"/>
		</fo:block>
	</xsl:template>
	<!--template pour les radiobutton-->
	<xsl:template name="radiobutton-svg">
		<xsl:param name="isChecked" select="."/>
		<!--balise d'integration pour fo du language SVG-->
		<fo:instream-foreign-object content-height="0.6cm" content-width="0.6cm" scaling="uniform">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 12">
				<circle r="5" cx="6" cy="6" fill="white" stroke="black"/>
				<xsl:if test="$isChecked='on'">
					<circle r="3" cx="6" cy="6" fill="blue"/>
				</xsl:if>
			</svg>
		</fo:instream-foreign-object>
	</xsl:template>
	<!--template pour les checkbox-->
	<xsl:template name="checkbox-svg">
		<xsl:param name="isChecked" select="."/>
		<!--balise d'integration pour fo du language SVG-->
		<fo:instream-foreign-object content-height="0.6cm" content-width="0.6cm" scaling="uniform">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -1 14 13">
				<rect x="1" y="1" height="10" width="10" fill="white" stroke="black"/>
				<xsl:if test="$isChecked='on'">
					<line x1="1" y1="5.9" x2="6.6" y2="9.8" stroke="blue"/>
					<line x1="6" y1="10" x2="12" y2="0" stroke="blue"/>
				</xsl:if>
			</svg>
		</fo:instream-foreign-object>
	</xsl:template>
	<xsl:template match="*[@style='chk']">
		<!--declenchement du label en @ttr-->
		<xsl:apply-templates select="@label"/>
		<xsl:call-template name="checkbox-svg"/>
	</xsl:template>
	<xsl:template match="*[@style='rad']">
		<!--declenchement du label en @ttr-->
		<xsl:apply-templates select="@label"/>
		<xsl:call-template name="radiobutton-svg"/>
	</xsl:template>
	<xsl:template match="*[@style='draw']">
		<!--
			Les 3 modes de decl de valeur par defaut
			<xsl:param name="width">15cm</xsl:param>
		-->
		<xsl:param name="width" select="'100%'"/>
		<xsl:param name="height">
			<xsl:value-of select="'100%'"/>
		</xsl:param>
		<fo:block text-align="center">
			<xsl:apply-templates select="@label"/><fo:block/>
			<fo:external-graphic src="data:image/jpg;base64,{.}" scaling="uniform" content-height="{$height}" content-width="{$width}"/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
