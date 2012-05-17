<cfif ISDEFINED("SESSION.Access")><cflocation url="forms"></cfif>

<cfset PageTitle = "Administrator Login">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">
<div class="holder_content">
<section class="group2">
<cfform name="login" action="EntranceAction.cfm" method="post">

<table>
<tr>
    <td>
    User Name
    </td>
    <td>
    <cfinput type="text" name="UserName" maxlength="30" validateat="onserver,onsubmit">
    </td>
</tr>
<tr>
    <td>
    Password
    </td>
    <td>
    <cfinput type="password" name="Password" maxlength="30" validateat="onserver,onsubmit">
    </td>
</tr>
<tr>
	<td colspan="2">
    <cfinput align="right" type="submit" name="Login" label="Login">
    </td>
</tr>

</table>

</cfform>

</section>
</div>
<cfinclude template="Footer.cfm">