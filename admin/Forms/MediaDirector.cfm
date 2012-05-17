    <cfquery name="GetDirectors" datasource="librarymedia">
    	SELECT DISTINCT d.*
        FROM Directors d
        WHERE d.DirectorID NOT IN 
            (SELECT DISTINCT md.DirectorID
            FROM MediaDirectors md
            WHERE md.MediaID = #URL.MediaID#)
    </cfquery>

<cfquery name="GetMediaTitle" datasource="librarymedia">
	SELECT m.*
    FROM Media m
    WHERE m.MediaID = #URL.MediaID#
</cfquery>
<cfoutput>
<cfset PageTitle = "Add Director Association to Media: #GetMediaTitle.MediaTitle#">
</cfoutput>
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">

<section class="group2">

<cfif GetDirectors.RecordCount IS 0>

No Directors left to associate with!

<cfelse>

<table>
<cfform action="MediaDirectorAction.cfm?DirectorID=#URL.DirectorID#&amp;MediaID=#URL.MediaID#" method="post">

<tr> 
<td>Director</td>
<td>
	<cfselect class="input" name="DirectorName">
			<cfoutput>
                <cfloop query="GetDirectors">
                    <option>#DirectorFirstName# #DirectorLastName#</option>
                </cfloop>
        	</cfoutput>
    	</cfselect>
</td>
</tr>
<tr>
	<td colspan="2" align="right"><cfinput class="input" type="submit" name="submit" value="Add Director Association"></td>
</tr>
</cfform>
</table>
</cfif>
</section>
</div>

<cfinclude template="Footer.cfm">