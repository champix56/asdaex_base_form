# asdaex_base_form

## Formation XSL pour Xperthis X-care

### XML

- règles syntaxiques
- well formdness

### XPATH

- syntaxe de navigation
- fonction (string, number, ...)

### XSL

- xsl:value-of
- xsl:if
- xsl:choose
- xsl:for-each
- xsl:template
  - match
    - spécifiques (nom de noeud)
    - génériques (*)
    - garbage collector pour template (\*|@\*)
  - name
  - params
  - sort
  - decimal-number / format-number
  - xsl:attribute-set / @xsl:use-attribute-sets

### FO

- fo:root
- fo:layout-master-set
- fo:simple-page-master
  - fo:regions (region-body, region-before, ...)
- fo:page-sequence
  - fo:flow
  - fo:static-content
  - fo:block / fo:inline
