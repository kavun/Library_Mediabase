<cfif NOT ISDEFINED("URL.ID") OR NOT ISDEFINED("URL.MediaID")>
	<cflocation url="Media.cfm">
</cfif>

<cfquery name="GetItem" datasource="librarymedia">
    SELECT *
    FROM Items
    WHERE ItemID = #URL.ID#
</cfquery>

<cfoutput>
<cfset PageTitle = "Delete #GetItem.ItemDesc#?">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">
Are you sure you want to delete #GetItem.ItemDesc#?<br /><br />
<section class="button"><a style="text-align:center" href="ItemDeleteAction.cfm?ID=#URL.ID#&amp;MediaID=#URL.MediaID#">Yes</a></section><section class="button"><a href="Medium.cfm?ID=#URL.MediaID#">No</a></section>




</section>
</div>


</cfoutput>

<cfinclude template="Footer.cfm">