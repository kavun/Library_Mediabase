<cfif NOT IsDefined("URL.ID")>
	<cflocation url="Genres.cfm">
</cfif>
<cfif URL.ID IS 0>
	<cfset GenreName = "">
	<cfset PageTitle = "Add Genre">
        <cfset PageDescription = "">
    <cfset PageKeywords = "">
<cfelse>
    <cfquery name="GetGenres" datasource="librarymedia">
        SELECT *
        FROM Genres
        WHERE GenreID = #URL.ID#
    </cfquery>
    <cfset GenreName = "#GetGenres.GenreName#">
	<cfset PageTitle = "Edit Genre">
        <cfset PageDescription = "">
    <cfset PageKeywords = "">
</cfif>

<cfinclude template="Head.cfm">

<div class="holder_content">
<section class="group2">
<table align="center">
    <cfform action="GenreAction.cfm?ID=#URL.ID#" method="POST">
        <tr>
            <td>
                Genre Name
            </td>
            <td>
                <cfinput class="input" type="text" name="GenreName" 
                    required="yes" 
                    message="Please enter genre name." 
                    value="#GenreName#" maxlength="50" validate="maxlength" validateat="onserver,onsubmit">
            </td>
        </tr>
        <tr>
        	<td colspan="2">
				<cfoutput>
                	<input class="input" type="submit" value="#PageTitle#">
                </cfoutput>
            </td>
        </tr>
    </cfform>
</table>
</section>
</div>
<cfinclude template="Footer.cfm">