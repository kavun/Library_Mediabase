<cfif URL.ID IS 0>
	<!--- INSERT --->
    <cfquery name="InsertGenre" datasource="librarymedia">
		INSERT INTO Genres(GenreName)
        VALUES('#FORM.GenreName#')
    </cfquery>
<cfelse>
	<!--- UPDATE --->
    <cfquery name="UpdateGenre" datasource="librarymedia">
		UPDATE Genres
        SET GenreName = '#FORM.GenreName#'
        WHERE GenreID = #URL.ID#
    </cfquery>
</cfif>

<cflocation url="Genres.cfm">