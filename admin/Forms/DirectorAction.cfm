<cfif URL.DirectorID IS 0>
	<!--- INSERT --->
    <cfquery name="InsertDirector" datasource="librarymedia">
		INSERT INTO Directors(DirectorFirstName, DirectorLastName)
        VALUES('#FORM.DirectorFirstName#', '#FORM.DirectorLastName#')
    </cfquery>
<cfelse>
	<!--- UPDATE --->
    <cfquery name="UpdateDirector" datasource="librarymedia">
		UPDATE Directors
        SET DirectorFirstName = '#FORM.DirectorFirstName#', DirectorLastName = '#FORM.DirectorLastName#'
        WHERE DirectorID = #URL.DirectorID#
    </cfquery>
</cfif>

<cflocation url="Directors.cfm">