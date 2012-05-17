    <cfquery name="GetLists" datasource="librarymedia">
    	SELECT DISTINCT l.*
        FROM Lists l
        WHERE l.ListID NOT IN 
            (SELECT DISTINCT ml.ListID
            FROM MediaLists ml
            WHERE ml.MediaID = #URL.MediaID#)
    </cfquery>

<cfquery name="GetMediaTitle" datasource="librarymedia">
	SELECT m.*
    FROM Media m
    WHERE m.MediaID = #URL.MediaID#
</cfquery>
<cfoutput>
<cfset PageTitle = "Add List Association to Media: #GetMediaTitle.MediaTitle#">
</cfoutput>
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">

<section class="group2">

<cfif GetLists.RecordCount IS 0>

No List left to associate with!

<cfelse>

<table>
<cfform action="MediaListAction.cfm?ListID=#URL.ListID#&amp;MediaID=#URL.MediaID#" method="post">

<tr> 
<td>List</td>
<td>
	<cfselect class="input" name="ListName">
			<cfoutput>
                <cfloop query="GetLists">
                    <option value="#ListName#">#ListName#</option>
                </cfloop>
        	</cfoutput>
    	</cfselect>
</td>
</tr>
<tr>
	<td>Description</td>
    <td><cfinput class="input" type="text" name="MediaListDesc" required="yes" maxlength="50" validate="maxlength" validateat="onserver,onsubmit">
</tr>
<tr>
	<td colspan="2" align="right"><cfinput class="input" type="submit" name="submit" value="Add List Association"></td>
</tr>
</cfform>
</table>
</cfif>
</section>
</div>

<cfinclude template="Footer.cfm">