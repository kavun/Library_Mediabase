<cfquery name="GetFormats" datasource="librarymedia">
	SELECT DISTINCT f.*
    FROM Formats f, Items i
    WHERE f.FormatID = i.FormatID    
</cfquery>

<cfset PageTitle = "Formats">
<cfset PageDescription = "A list of formats of movies">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">
<section class="group2">
	<table>
<cfoutput query="GetFormats">

    <tr><td>
    	<a href="Format.cfm?ID=#FormatID#">#FormatName#</a>
    </td></tr>

    
</cfoutput>
    </table>
</section>
</div>


<cfinclude template="Footer.cfm">