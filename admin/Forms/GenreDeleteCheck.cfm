<cfif NOT ISDEFINED("URL.GenreID")>
	<cflocation url="Genres.cfm">
</cfif>
<cfquery name="GetGenre" datasource="librarymedia">
    SELECT *
    FROM Genres
    WHERE GenreID = #URL.GenreID#
</cfquery>
<cfoutput>
<cfset PageTitle = "Delete #GetGenre.GenreName#?">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">
<div class="holder_content">
    Are you sure you want to delete #GetGenre.GenreName#?<br /><br />
    <section class="button">
        <a style="text-align:center" href="GenreDeleteAction.cfm?GenreID=#URL.GenreID#">Yes</a>
    </section>
    <section class="button">
        <a href="Genres.cfm">No</a>
    </section>
</div>
</cfoutput>
<cfinclude template="Footer.cfm">