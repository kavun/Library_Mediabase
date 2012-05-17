<cfif IsDefined("FORM.Password")>
	<cfif FORM.Password IS "KevinReed">
    	<cfoutput>
        	<cfset session.access = 9>
            <cfset session.UserName = "#FORM.Username#">
            <cfset session.UserID = 1>
            <cflocation url="Forms/Index.cfm">
        </cfoutput>
	<cfelseif FORM.Password IS "CamTracy">
        <cfoutput>
            <cfset session.access = 1>
            <cfset session.UserName = "MargaretColson">
            <cfset session.UserID = 2>
            <cflocation url="Forms/Index.cfm">
        </cfoutput>
    <cfelse>
        <cflocation url="error.cfm?UserName=#FORM.UserName#">
    </cfif>
<cfelse>
	<cflocation url="./">
</cfif>