<cfif NOT ISDEFINED("URL.ID")>
	<cflocation url="Media.cfm">
</cfif>

<cfquery name="GetMedia" datasource="librarymedia">
	SELECT *
    FROM Media
    WHERE MediaID = #URL.ID#
</cfquery>
<cfoutput>
<cfset PageTitle = "Delete #GetMedia.MediaTitle#?">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">
Are you sure you want to delete #GetMedia.MediaTitle#?<br /><br />
<section class="button"><a style="text-align:center" href="MediumDeleteAction.cfm?ID=#URL.ID#">Yes</a></section><section class="button"><a href="Media.cfm">No</a></section>




</section>
</div>


</cfoutput>

<cfinclude template="Footer.cfm">