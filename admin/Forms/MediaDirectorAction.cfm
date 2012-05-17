<cfdump var="#FORM#">

<!--- ADD ITEM --->
<cfif URL.DirectorID IS 0>

<cfset nameArr = FORM.DirectorName.split(" ")>
<cfif ArrayLen(nameArr) GT 2>
	<cfset FirstName = "#nameArr[1]# #nameArr[2]#">
    <cfset LastName = "#nameArr[3]#">
<cfelse>
	<cfset FirstName = "#nameArr[1]#">
    <cfset LastName = "#nameArr[2]#">
</cfif>

<cfquery name="GetDirectorID" datasource="librarymedia">
	SELECT *
    FROM Directors
    WHERE DirectorFirstName = '#FirstName#' AND DirectorLastName = '#LastName#'
</cfquery>

    <cfquery name="InsertMediaDirector" datasource="librarymedia">
        INSERT INTO MediaDirectors(MediaID, DirectorID)
        VALUES('#URL.MediaID#', '#GetDirectorID.DirectorID#')
    </cfquery>

<!--- UPDATE ITEM --->
<cfelse>

</cfif>
<cfoutput>
	<cflocation url="Medium.cfm?ID=#URL.MediaID#">
</cfoutput>