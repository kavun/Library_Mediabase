

<cfif NOT ISDEFINED("URL.MediaID") OR NOT ISDEFINED('URL.ListID')>
	<cflocation url="Media.cfm">
</cfif>

<cfquery name="GetMediaList" datasource="librarymedia">
	SELECT *
    FROM MediaLists
    WHERE MediaID = #URL.MediaID# AND ListID = #URL.ListID#
</cfquery>
<cfoutput>
<cfset PageTitle = "Delete #GetMediaList.MediaListDesc#?">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">
    Are you sure you want to delete #GetMediaList.MediaListDesc#?<br /><br />
    <section class="button">
        <a style="text-align:center" href="MediaListDeleteAction.cfm?MediaID=#URL.MediaID#&amp;ListID=#URL.ListID#">Yes</a>
    </section>
    <section class="button">
        <a href="Medium.cfm?ID=#URL.MediaID#">No</a>
    </section>
</div>


</cfoutput>

<cfinclude template="Footer.cfm">