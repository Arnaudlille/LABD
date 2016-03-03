<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/championnat">
		<clubs xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:for-each select="//club">
				<xsl:variable name="nom_court">
					<xsl:value-of select="./@id"/>
				</xsl:variable>
				<club id="{$nom_court}">
					<xsl:copy-of select="./nom"/>
					<xsl:copy-of select="./ville"/>
					<rencontres>
						<domicile>
							<xsl:for-each select="//rencontre[receveur=$nom_court]">
								<xsl:variable name="id_journee" select="./../@num"/>
								<rencontre id="{$id_journee}">
									<club>
										<xsl:variable name="invite" select="./invite"/>
										<xsl:value-of select="//club[@id=$invite]/nom"/>
									</club>
									<xsl:copy-of select="./score"/>
								</rencontre>
							</xsl:for-each>
						</domicile>
						<exterieur>
							<xsl:for-each select="//rencontre[invite=$nom_court]">
								<xsl:variable name="id_journee" select="./../@num"/>
								<rencontre id="{$id_journee}">
									<club>
										<xsl:variable name="receveur" select="./receveur"/>
										<xsl:value-of select="//club[@id=$receveur]/nom"/>
									</club>
									<xsl:copy-of select="./score"/>
								</rencontre>
							</xsl:for-each>
						</exterieur>
					</rencontres>
				</club>
			</xsl:for-each>
		</clubs>
	</xsl:template>
</xsl:stylesheet>
