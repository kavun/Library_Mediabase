<cfif NOT ISDEFINED('URL.DirectorID')>
	<cflocation url="Directors.cfm">
</cfif>

<cfquery name="DeleteDirector" datasource="librarymedia">
	DELETE FROM Directors
    WHERE DirectorID = #URL.DirectorID#
</cfquery>
<cfoutput>
<cflocation url="Directors.cfm">
</cfoutput>