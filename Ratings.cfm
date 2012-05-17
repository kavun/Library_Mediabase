<cfquery name="GetRatings" datasource="librarymedia">
	SELECT DISTINCT r.*
    FROM Ratings r, Media m
    WHERE r.RatingID = m.RatingID    
</cfquery>

<cfset PageTitle = "Ratings">
<cfset PageDescription = "A list of ratings of movies">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">
<div class="holder_content">
<section class="group2">
	<table>
<cfoutput query="GetRatings">

    <tr><td>
    	<a href="Rating.cfm?ID=#RatingID#">#RatingName#</a>
    </td></tr>

    
</cfoutput>
    </table>
</section>
</div>

<cfinclude template="Footer.cfm">