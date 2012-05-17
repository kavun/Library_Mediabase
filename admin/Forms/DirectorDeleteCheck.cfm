<cfif NOT ISDEFINED("URL.DirectorID")>
	<cflocation url="Directors.cfm">
</cfif>
<cfquery name="GetDirector" datasource="librarymedia">
    SELECT *
    FROM Directors
    WHERE DirectorID = #URL.DirectorID#
</cfquery>
<cfoutput>
<cfset PageTitle = "Delete #GetDirector.DirectorFirstName# #GetDirector.DirectorLastName#?">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">
<div class="holder_content">
    Are you sure you want to delete #GetDirector.DirectorFirstName# #GetDirector.DirectorLastName#?<br /><br />
    <section class="button">
        <a style="text-align:center" href="DirectorDeleteAction.cfm?DirectorID=#URL.DirectorID#">Yes</a>
    </section>
    <section class="button">
        <a href="Directors.cfm">No</a>
    </section>
</div>
</cfoutput>
<cfinclude template="Footer.cfm">