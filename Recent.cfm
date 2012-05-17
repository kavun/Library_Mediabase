<cfquery name="GetRecent" datasource="librarymedia">
	SELECT m.*, i.*
    FROM Media m, Items i
    WHERE m.MediaID = i.MediaID
    ORDER BY i.ItemDateAdded DESC
</cfquery>

<cfset PageTitle = "Recently Added">
<cfset PageDescription = "A list of recently added of movies">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">
<div class="holder_content">
<section class="group2">
	<table>
<cfoutput query="GetRecent">

    <tr><td>
    	<a href="Detail.cfm?ID=#MediaID#">#MediaTitle#</a> - added on #DateFormat(ItemDateAdded)#
    </td></tr>

    
</cfoutput>
    </table>
</section>
</div>

<cfinclude template="Footer.cfm">