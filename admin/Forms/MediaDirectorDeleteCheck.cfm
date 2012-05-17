

<cfif NOT ISDEFINED("URL.MediaID") OR NOT ISDEFINED('URL.DirectorID')>
	<cflocation url="Media.cfm">
</cfif>

<cfquery name="GetMediaDirector" datasource="librarymedia">
	SELECT md.*, d.*, m.*
    FROM MediaDirectors md, Directors d, Media m
    WHERE md.MediaID = #URL.MediaID# AND md.DirectorID = #URL.DirectorID# AND md.DirectorID = d.DirectorID AND m.MediaID = #URL.MediaID#
</cfquery>
<cfoutput>
<cfset PageTitle = "Remove #GetMediaDirector.DirectorFirstName# #GetMediaDirector.DirectorLastName# from #GetMediaDirector.MediaTitle#?">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">
    Are you sure you want to remove #GetMediaDirector.DirectorFirstName# #GetMediaDirector.DirectorLastName# from #GetMediaDirector.MediaTitle#?<br /><br />
    <section class="button">
        <a style="text-align:center" href="MediaDirectorDeleteAction.cfm?MediaID=#URL.MediaID#&amp;DirectorID=#URL.DirectorID#">Yes</a>
    </section>
    <section class="button">
        <a href="Medium.cfm?ID=#URL.MediaID#">No</a>
    </section>
</div>


</cfoutput>

<cfinclude template="Footer.cfm">