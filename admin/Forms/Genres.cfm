<cfquery name="GetGenres" datasource="librarymedia">
	SELECT *
    FROM Genres
    ORDER BY GenreName
</cfquery>

<cfset PageTitle = "Genres">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">
<section class="group1">

<h1><a href="Genre.cfm?ID=0">Add Genre</a></h1>
</section>

<section class="group2">
<table>
	<cfoutput query="GetGenres">
        <tr>
            <td>#GenreName#</td>
            <td align="right">
                <a href="Genre.cfm?ID=#GenreID#">Edit</a> | 
                <a href="GenreDeleteCheck.cfm?GenreID=#GenreID#">Delete</a>
            </td>
        </tr>
    </cfoutput>
</table>

</section>
</div>
<cfinclude template="Footer.cfm">