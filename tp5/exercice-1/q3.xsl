<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output method="html" indent="yes" encoding="UTF-8" omit-xml-declaration="no"/>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<body>
				<h2>Les clubs de Ligue 1<br/> saison 
        	<xsl:value-of select="(/championnat/@annee)-1"/>-<xsl:value-of select="/championnat/@annee"/> :</h2>
				<p/>
				<table border="1">
					<thead>
						<tr>
							<th>ville</th>
							<th>club</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="//club"><xsl:sort select="ville" order="ascending" data-type="text"/>
						<tr>
							<td>
								<xsl:value-of select="ville"/>
							</td>
							<td>
								<xsl:value-of select="nom"/>
							</td>
						</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
