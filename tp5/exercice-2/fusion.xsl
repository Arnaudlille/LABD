<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xpath-default-namespace="http://labd/art" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://labd/art">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<art>
			<artistes>
				<xsl:for-each select=".//artiste">
					<artiste>
						<xsl:variable name="nom" select="./nom"/>
						<xsl:variable name="prenom" select="./prénom"/>
						<xsl:copy-of select="./nom" copy-namespaces="no"/>
						<xsl:copy-of select="./prénom" copy-namespaces="no"/>
						<xsl:copy-of select="./naissance" copy-namespaces="no"/>
						<xsl:copy-of select="./décès" copy-namespaces="no"/>
						<xsl:copy-of select="./période" copy-namespaces="no"/>
						<oeuvres>
							<xsl:for-each select="document('catalogue-1.xml')//oeuvre[.//nom = $nom and .//prénom =$prenom]">
							<xsl:sort select="date" order="ascending" data-type="number"/>
								<oeuvre>
									<xsl:attribute name="genre">
										<xsl:value-of select="./@genre"/>
									</xsl:attribute>
									<xsl:copy-of select="./titre" copy-namespaces="no"/>
									<xsl:copy-of select="./date" copy-namespaces="no"/>
								</oeuvre>
							</xsl:for-each>
						</oeuvres>
					</artiste>
				</xsl:for-each>
			</artistes>
			<xsl:copy-of select="//mouvements" copy-namespaces="no"/>
		</art>
	</xsl:template>
</xsl:stylesheet>
