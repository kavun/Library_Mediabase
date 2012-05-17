<cfdump var="FORM">

<!--- ADD ITEM --->
<cfif URL.ID IS 0>

    <cfquery name="InsertItem" datasource="librarymedia">
        INSERT INTO Items(MediaID, FormatID, ItemASIN, ItemCallNumber, ItemDateAdded, ItemDesc, ItemOCLC, ItemReleaseDate)
        VALUES('#FORM.MediaID#', '#FORM.FormatID#', '#FORM.ItemASIN#', '#FORM.ItemCallNumber#', #CREATEODBCDATETIME('#FORM.ItemDateAdded#')#, '#FORM.ItemDesc#', '#FORM.ItemOCLC#', #CREATEODBCDATETIME('#FORM.ItemReleaseDate#')#)
    </cfquery>

<!--- UPDATE ITEM --->
<cfelse>

    <cfquery name="UpdateItem" datasource="librarymedia">
        UPDATE Items
        SET FormatID = '#FORM.FormatID#',
              ItemASIN = '#FORM.ItemASIN#', 
              ItemCallNumber = '#FORM.ItemCallNumber#',
              ItemDateAdded = #FORM.ItemDateAdded#,
              ItemDesc = '#FORM.ItemDesc#',
              ItemOCLC = '#FORM.ItemOCLC#',
              ItemReleaseDate = #FORM.ItemReleaseDate#
        WHERE ItemID = #URL.ID#
    </cfquery>


</cfif>
<cfoutput>
	<cflocation url="Medium.cfm?ID=#FORM.MediaID#">
</cfoutput>