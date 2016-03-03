<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    >
<xsl:output method="html" indent="yes" encoding="UTF-8"
omit-xml-declaration="no"/>
  
  <xsl:template match="/">    
    <html xmlns="http://www.w3.org/1999/xhtml">
      <body>
        <h3>Les clubs de Ligue 1   </h3>
        <p/>
        <xsl:copy-of select="//clubs"/>
    </body>
   </html>
  </xsl:template>
  
</xsl:stylesheet>
