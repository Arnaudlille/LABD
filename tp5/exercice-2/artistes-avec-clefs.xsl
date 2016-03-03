<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xpath-default-namespace="http://labd/art" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://labd/art">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<art>
			<artistes>
				<xsl:for-each select=".//artiste">
					<artiste>
						<xsl:attribute name="id">
							<xsl:value-of select="position()"/>
						</xsl:attribute>
						<xsl:copy-of select="./*" copy-namespaces="no"/>
					</artiste>
				</xsl:for-each>
			</artistes>
			
			<xsl:copy-of select="//mouvements" copy-namespaces="no"/>
		</art>
	</xsl:template>
</xsl:stylesheet>
