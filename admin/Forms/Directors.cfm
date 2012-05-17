<cfquery name="GetDirectors" datasource="librarymedia">
SELECT *
FROM Directors
ORDER BY DirectorLastName
</cfquery>

<cfset PageTitle = "Directors">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">
<section class="group1" style="width:auto;">

<h1><a style="padding-left:30px;" href="Director.cfm?DirectorID=0">Add Director</a></h1>
</section>
<section class="group2">
<table>
<cfoutput query="GetDirectors">
<tr>
	<td>#DirectorLastName#, #DirectorFirstName#</td>
    <td><a href="Director.cfm?DirectorID=#DirectorID#">Edit</a> | 
    	<a href="DirectorDeleteCheck.cfm?DirectorID=#DirectorID#">Delete</a></td>
</tr>
</cfoutput>
</table>

</section>
</div>

<cfinclude template="Footer.cfm">
