<cfif not IsDefined("URL.ID")>
 <cflocation url="Types.cfm">
</cfif>

<cfquery name="GetMediaTypes" datasource="librarymedia">
	SELECT m.*, t.TypeName
    FROM Media m, Types t
    WHERE #URL.ID# = m.TypeID AND m.TypeID = t.TypeID  
</cfquery>

<cfset PageTitle = "#GetMediaTypes.TypeName#">
<cfset PageDescription = "Movies of type #GetMediaTypes.TypeName#">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">
<div class="holder_content">
<section class="group2">
	<table>
<cfoutput query="GetMediaTypes">

    <tr><td>
    	<a href="Detail.cfm?ID=#MediaID#">#MediaTitle#</a>
    </td></tr>

    
</cfoutput>
   </table>
</section>
</div>

<cfinclude template="Footer.cfm">