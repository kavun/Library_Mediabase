<cfquery name="GetTypes" datasource="librarymedia">
	SELECT DISTINCT t.*
    FROM Types t, Media m
    WHERE t.TypeID = m.TypeID    
</cfquery>

<cfset PageTitle = "Types">
<cfset PageDescription = "A list of types of movies">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">
<div class="holder_content">
<section class="group2">
<table>
<cfoutput query="GetTypes">

    <tr>
    <td>
    	<a href="Type.cfm?ID=#TypeID#">#TypeName#</a>
    </td>
    </tr>

    
</cfoutput>
</table>
</section>
</div>

<cfinclude template="Footer.cfm">