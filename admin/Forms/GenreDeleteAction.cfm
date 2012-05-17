<cfif NOT ISDEFINED('URL.GenreID')>
	<cflocation url="Genres.cfm">
</cfif>

<cfquery name="DeleteGenre" datasource="librarymedia">
	DELETE FROM Genres
    WHERE GenreID = #URL.GenreID#
</cfquery>
<cfoutput>
<cflocation url="Genres.cfm">
</cfoutput>