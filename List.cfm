<cfif not IsDefined("URL.ID")>
 <cflocation url="Index.cfm">
</cfif>

<cfquery name="GetList" datasource="librarymedia">
	SELECT m.*, ml.*
    FROM MediaLists ml, Media m
    WHERE m.MediaID = ml.MediaID AND ml.ListID = #URL.ID#
    ORDER BY MediaListDesc ASC
</cfquery>

<cfquery name="GetTitle" datasource="librarymedia">
	SELECT l.*
    FROM Lists l
    WHERE l.ListID = #URL.ID#
</cfquery>


<cfset PageTitle = "#GetTitle.ListName#">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">
<div class="holder_content">
<section class="group2">
<table>
	<cfoutput query="GetList">
        <tr><td>
            #MediaListDesc# - 
                <a href="Detail.cfm?ID=#MediaID#">
                	#MediaTitle#
                </a>
       </td></tr>
    </cfoutput>
</table>
</section>
</div>

<cfinclude template="Footer.cfm">