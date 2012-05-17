<cfif NOT IsDefined("URL.DirectorID")>
	<cflocation url="Directors.cfm">
</cfif>
<cfif URL.DirectorID IS 0>
	<cfset FirstName = "">
    <cfset LastName = "">
	<cfset PageTitle = "Add Director">
    <cfset PageDescription = "">
    <cfset PageKeywords = "">
<cfelse>
    <cfquery name="GetDirectors" datasource="librarymedia">
        SELECT *
        FROM Directors
        WHERE DirectorID = #URL.DirectorID#
    </cfquery>
    <cfset FirstName = "#GetDirectors.DirectorFirstName#">
    <cfset LastName = "#GetDirectors.DirectorLastName#">
	<cfset PageTitle = "Edit Director">
    <cfset PageDescription = "">
    <cfset PageKeywords = "">
</cfif>

<cfinclude template="Head.cfm">
<div class="holder_content">
<section class="group2">
<table align="center">
    <cfform action="DirectorAction.cfm?DirectorID=#URL.DirectorID#" method="POST">
        <tr>
            <td>
                First Name
            </td>
            <td>
                <cfinput class="input" type="text" name="DirectorFirstName" 
                    required="yes" 
                    message="Please enter first name." 
                    value="#FirstName#" maxlength="50" validate="maxlength" validateat="onserver,onsubmit">
            </td>
        </tr>
                <tr>
            <td>
                Last Name
            </td>
            <td>
                <cfinput class="input" type="text" name="DirectorLastName" 
                    required="yes" 
                    message="Please enter last name." 
                    value="#LastName#" maxlength="50" validate="maxlength" validateat="onserver,onsubmit">
            </td>
        </tr>
        <tr>
        	<td colspan="2">
				<cfoutput>
                	<input class="input" type="submit" value="#PageTitle#">
                </cfoutput>
            </td>
        </tr>
    </cfform>
</table>

</section>
</div>
<cfinclude template="Footer.cfm">