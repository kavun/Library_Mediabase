<cfif NOT ISDEFINED('URL.MediaID') OR NOT ISDEFINED('URL.ListID')>
	<cflocation url="Media.cfm">
</cfif>

<cfquery name="DeleteMediaList" datasource="librarymedia">
	DELETE FROM MediaLists
    WHERE MediaID = #URL.MediaID# AND ListID = #URL.ListID#
</cfquery>
<cfoutput>
<cflocation url="Medium.cfm?ID=#URL.MediaID#">
</cfoutput>