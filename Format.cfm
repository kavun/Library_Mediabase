<cfif not IsDefined("URL.ID")>
 <cflocation url="Formats.cfm">
</cfif>

<cfquery name="GetMediaFormats" datasource="librarymedia">
	SELECT DISTINCT m.*, f.FormatName
    FROM Media m, Formats f, Items i
    WHERE #URL.ID# = i.FormatID AND f.FormatID = #URL.ID# AND m.MediaID = i.MediaID  
</cfquery>

<cfset PageTitle = "#GetMediaFormats.FormatName#">
<cfset PageDescription = "Movies of format #GetMediaFormats.FormatName#">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">
<section class="group2">
	<table>
<cfoutput query="GetMediaFormats">

    <tr><td>
    	<a href="Detail.cfm?ID=#MediaID#">#MediaTitle#</a>
    </td></tr>

    
</cfoutput>
    </table>
</section>
</div>


<cfinclude template="Footer.cfm">