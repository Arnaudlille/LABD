<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xpath-default-namespace="http://labd/art" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://labd/art">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<art>
			<xsl:copy-of select="document('artistes-avec-clefs.xml')//art/*" copy-namespaces="no"/>
			<oeuvres>
				<xsl:for-each select="document('catalogue-1.xml')//oeuvre">
					<xsl:variable name="nom" select="./auteur/nom"/>
					<xsl:variable name="prenom" select="./auteur/prénom"/>
					<oeuvre>
						<xsl:attribute name="id_auteur">
							<xsl:value-of select="document('artistes-avec-clefs.xml')//artiste[./nom=$nom and ./prénom=$prenom]/@id"/>
						</xsl:attribute>
						<xsl:copy-of select="./*" copy-namespaces="no"/>
					</oeuvre>
				</xsl:for-each>
			</oeuvres>
		</art>
	</xsl:template>
</xsl:stylesheet>
