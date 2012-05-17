<cfif not IsDefined("URL.ID")>
 <cflocation url="Ratings.cfm">
</cfif>

<cfquery name="GetMediaRatings" datasource="librarymedia">
	SELECT m.*, r.RatingName
    FROM Media m, Ratings r
    WHERE #URL.ID# = m.RatingID AND m.RatingID = r.RatingID  
</cfquery>

<cfset PageTitle = "#GetMediaRatings.RatingName#">
<cfset PageDescription = "Movies of rating #GetMediaRatings.RatingName#">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">
<div class="holder_content">
<section class="group2">
	<table>
<cfoutput query="GetMediaRatings">

    <tr><td>
    	<a href="Detail.cfm?ID=#MediaID#">#MediaTitle#</a>
    </td></tr>

    
</cfoutput>
    </table>
</section>
</div>

<cfinclude template="Footer.cfm">