<cfif not IsDefined("URL.ID")>
 <cflocation url="Index.cfm">
</cfif>

<cfquery name="GetDirectorMedia" datasource="librarymedia">
	SELECT m.*
    FROM Media m, MediaDirectors md
    WHERE m.MediaID = md.MediaID AND md.DirectorID = #URL.ID#
</cfquery>
<cfquery name="GetDirector" datasource="libraryMedia">
	SELECT d.*
    FROM Directors d
    WHERE d.DirectorID = #URL.ID#
</cfquery>




<cfset PageTitle = "#GetDirector.DirectorFirstName# #GetDirector.DirectorLastName#'s Films">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">
<cfoutput>


<div class="holder_content">
<section class="group2">
</cfoutput>

<table>
<cfoutput query="GetDirectorMedia">
<tr><td>
<a href="Detail.cfm?ID=#MediaID#">
#MediaTitle#
</a>
</td></tr>
</cfoutput>
</table>
</section>
</div>

<cfinclude template="Footer.cfm">
