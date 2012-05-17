<cfif NOT ISDEFINED('URL.ID') OR NOT ISDEFINED('URL.MediaID')>
	<cflocation url="Media.cfm">
</cfif>

<cfquery name="DeleteItem" datasource="librarymedia">
	DELETE FROM Items
    WHERE ItemID = #URL.ID#
</cfquery>
<cfoutput>
<cflocation url="Medium.cfm?ID=#URL.MediaID#">
</cfoutput>