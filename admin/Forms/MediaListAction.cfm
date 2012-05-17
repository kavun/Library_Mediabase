<cfdump var="#FORM#">

<!--- ADD ITEM --->
<cfif URL.ListID IS 0>

<cfquery name="GetListID" datasource="librarymedia">
	SELECT *
    FROM Lists
    WHERE ListName = '#FORM.ListName#'
</cfquery>

    <cfquery name="InsertMediaList" datasource="librarymedia">
        INSERT INTO MediaLists(MediaID, ListID, MediaListDesc)
        VALUES('#URL.MediaID#', '#GetListID.ListID#', '#FORM.MediaListDesc#')
    </cfquery>

<!--- UPDATE ITEM --->
<cfelse>

</cfif>
<cfoutput>
	<cflocation url="Medium.cfm?ID=#URL.MediaID#">
</cfoutput>