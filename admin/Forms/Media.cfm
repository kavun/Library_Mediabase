<cfquery name="GetMedia" datasource="librarymedia">
SELECT *
FROM Media
ORDER BY MediaTitle
</cfquery>

<cfset PageTitle = "Media">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">
<section class="group1">

<h1><a style="padding-left:30px;" href="Medium.cfm?ID=0">Add Media</a></h1>
</section>
<section class="group2">
<table>
<cfoutput query="GetMedia">
<tr>
	<td>#MediaTitle#</td>
    <td><a href="Medium.cfm?ID=#MediaID#">Edit</a> | 
    	<a href="MediumDeleteCheck.cfm?ID=#MediaID#">Delete</a></td>
</tr>
</cfoutput>
</table>

</section>
</div>

<cfinclude template="Footer.cfm">
