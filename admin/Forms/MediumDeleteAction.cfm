<cfif NOT ISDEFINED('URL.ID')>
	<cflocation url="Media.cfm">
</cfif>

<cfquery name="DeleteMediaGenres" datasource="librarymedia">
	DELETE FROM MediaGenres
    WHERE MediaID = #URL.ID#
</cfquery>

<cfquery name="DeleteMedia" datasource="librarymedia">
	DELETE FROM Media
    WHERE MediaID = #URL.ID#
</cfquery>

<cflocation url="Media.cfm">