<cfquery name="MediaTitles" datasource="librarymedia">
SELECT DISTINCT m.*
FROM Media m
WHERE m.MediaTitle LIKE '%#FORM.Keyword#%'
ORDER BY m.MediaTitle
</cfquery>



<cfoutput>
<cfset PageTitle = "Search Results for #FORM.Keyword#">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">


</cfoutput>
<div class="holder_content">
<section class="group2">
<table>
<cfoutput query="MediaTitles">
<tr>
<td>
<a href="Detail.cfm?ID=#MediaID#">#MediaTitle#</a> - #MediaDesc#
</td>
</tr>
</cfoutput>
</table>
</section>
</div>
<cfinclude template="Footer.cfm">
