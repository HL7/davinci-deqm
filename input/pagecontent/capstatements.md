
The format of the CapabilityStatement resources are using the standard FHIR Publisher tooling. They may display differently from prior versions of this Implementation Guide.

{% include list-simple-capabilitystatements.xhtml %}

<br />

<!--
```
Steps for adding this narrative to CapStatements  - if you don't want to generate it

1) Create narrative in markdown
2) View Page source in Browser and copy the html content and save as .xhtml file

3) Edit xhtml content  ( I use xml spy since can view in browser mode )

1) Change title

2)  Edit  or remove TOC  ( contains both client and server links)

3) Remove any relative links to build (e.g., xml / json views)  since these will break if not viewed inside of IG

4) Remove or replace any unsupported xhtml characters:  You can catch these using the w3 validator or by trying to view in browser
   e.g., replace ";&nbsp" with "&#160;"

4) Insert in CapabilityStatement.text.div as xhtml
    Make CapabilityStatement.text.status = "additional"

e.g.
 <text>
    <status value="additional"/>
    <div xmlns="http://www.w3.org/1999/xhtml">
...(inserted xhtml here)...
   </div>

save CapabilityStatement file

-->
