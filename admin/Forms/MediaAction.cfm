<cfdump var="#FORM#">
<cfif IsDefined('FORM.SelectGenres')>
<cfdump var="#FORM#">
    <cfquery name="GetGenreID" datasource="librarymedia">
    	SELECT GenreID, GenreName
        FROM Genres
        WHERE GenreName IN (#ListQualify(FORM.SelectGenres, "'")#)
    </cfquery>
</cfif>
<cfif URL.ID IS 0>
	<!--- INSERT --->
    <cfquery name="InsertMedia" datasource="librarymedia">
        INSERT INTO Media(MediaTitle, MediaDesc, MediaReleaseDate, MediaIMDB, TypeID, RatingID)
        VALUES('#form.MediaTitle#', '#form.MediaDesc#', #CreateODBCDate(form.MediaReleaseDate)#, '#MediaIMDB#', '#TypeID#', '#RatingID#')
    </cfquery>
    
    <!--- INSERT GENRES --->
    <cfquery name="GetNewID" datasource="librarymedia">
    	SELECT MediaID
        FROM Media
        WHERE MediaTitle = '#FORM.MediaTitle#'
    </cfquery>
<cfif IsDefined('FORM.SelectGenres')>
    <cfloop query="GetGenreID">
        <cfquery name="InsertMediaGenres" datasource="librarymedia">
            INSERT INTO MediaGenres(MediaID, GenreID)
            VALUES(#GetNewID.MediaID#, #GetGenreID.GenreID#)
        </cfquery>
    </cfloop>
</cfif>
<cfelse>
	<!--- UPDATE --->
    <cfquery name="UpdateMedia" datasource="librarymedia">
        UPDATE Media
        SET MediaTitle = '#form.MediaTitle#',
              MediaDesc = '#form.MediaDesc#', 
              MediaReleaseDate = #form.MediaReleaseDate#
        WHERE MediaID = #URL.ID#
    </cfquery>
    
    <!--- UPDATE GENRES --->
    <!-- delete prexisting -->
    <cfquery name="DeleteExistingMediaGenres" datasource="librarymedia">
    	DELETE FROM MediaGenres
        WHERE MediaID = #URL.ID#
    </cfquery>
    <!-- add new -->
    <cfif IsDefined('FORM.SelectGenres')>
    <cfloop query="GetGenreID">
        <cfquery name="InsertMediaGenres" datasource="librarymedia">
            INSERT INTO MediaGenres(MediaID, GenreID)
            VALUES(#URL.ID#, #GetGenreID.GenreID#)
        </cfquery>
    </cfloop>
    </cfif>
</cfif>
<cflocation url="Media.cfm">