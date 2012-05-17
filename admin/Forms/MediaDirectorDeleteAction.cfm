<cfif NOT ISDEFINED('URL.MediaID') OR NOT ISDEFINED('URL.DirectorID')>
	<cflocation url="Media.cfm">
</cfif>

<cfquery name="DeleteMediaDirector" datasource="librarymedia">
	DELETE FROM MediaDirectors
    WHERE MediaID = #URL.MediaID# AND DirectorID = #URL.DirectorID#
</cfquery>
<cfoutput>
<cflocation url="Medium.cfm?ID=#URL.MediaID#">
</cfoutput>