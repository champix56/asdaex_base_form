<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<!--template pour le demarrage de la transformation-->
	<xsl:template match="/">
	<!--balise principale du format de sortie FO-->
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!--
				def. des formats de papiers 
				utilisable pour ce pdf
			-->
			<fo:layout-master-set>
				<!--
					format metrique et accessoires (pieds tete, ...) 
					d'un type de papier utilisable
				-->
				<fo:simple-page-master master-name="A4_Portrait_nohead_nofoot_nomargins" page-height="297mm" page-width="21cm">
					<fo:region-body></fo:region-body>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!--
				def. des constructions des differents chapitres
				du document à produire
			-->
			<fo:page-sequence master-reference="A4_Portrait_nohead_nofoot_nomargins">
				<fo:flow flow-name="xsl-region-body">
					<fo:block></fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
