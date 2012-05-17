<!--- Query Last Five Media Added --->
<cfquery name="GetLastFive" datasource="librarymedia" maxrows="5">
	SELECT m.*, i.*
    FROM Media m, Items i
    WHERE m.MediaID = i.MediaID
    ORDER BY i.ItemDateAdded DESC
</cfquery>

<!--- Query All Genres --->
<cfquery name="GetGenres" datasource="librarymedia">
	SELECT DISTINCT g.*
    FROM Genres g, MediaGenres mg
    WHERE g.GenreID = mg.GenreID
</cfquery>

<!--- Query Random Directors --->
<cfquery name="GetRandomDirectors" datasource="librarymedia">
	SELECT DISTINCT d.*
    FROM MediaDirectors md, Directors d
    WHERE md.DirectorID = d.DirectorID
</cfquery>
<cfquery name="GetMaxDirectorID" datasource="librarymedia">
	SELECT MAX(md.DirectorID) as "MaxID"
    FROM MediaDirectors md    
</cfquery>


<!--- Get Types --->

<cfquery name="GetTypes" datasource="librarymedia">
	SELECT t.*
    FROM Types t
</cfquery>



<cfset PageTitle = "Home">
<cfset PageDescription = "Union University's Library Media Database">
<cfset PageKeywords = "">

<cfinclude template="Head.cfm">
<div class="holder_content">

<!--- Last Five Added Output --->
<section class="group2">
<h3>Last Five Added</h3>
<table>
	<cfoutput query="GetLastFive">
    	<tr><td>
        	<a href="Detail.cfm?ID=#MediaID#">#MediaTitle#</a> - added on #DateFormat(ItemDateAdded)#
        </td></tr>
    </cfoutput>
</table>


</section>
<section class="group2">
<!--- Genres Output --->
<h3>Genres</h3>
<table>
	<cfoutput query="GetGenres">
    	<tr><td>
        	<a href="Genre.cfm?ID=#GenreID#">#GenreName#</a>
        </td></tr>
    </cfoutput>
</table>




</section>
<section class="group2">
<!--- Random Directors List --->
<h3>Directors</h3>
<table>
<cfset randList = "0">
    <cfloop from="1" to="5" index="i">
        <cfset randID = RandRange(1,#GetRandomDirectors.RecordCount#) /> 
        <cfscript>
			while(ListContains(randList, randID))
			{
				randID = RandRange(1,#GetRandomDirectors.RecordCount#);
			}
		</cfscript>
        <cfset randList = ListAppend(randList, randID)>
        <cfoutput>
            <tr><td>
                <a href="Director.cfm?ID=#GetRandomDirectors.DirectorID[randID]#">
                    #GetRandomDirectors.DirectorFirstName[randID]# #GetRandomDirectors.DirectorLastName[randID]# 
                </a>
            </td></tr>
        </cfoutput>
    </cfloop>
</table>
</section>
<!--- Types --->



<!--- Formats --->

<!--- Recent 100 List --->

<!--- Release Date List --->
<section class="group2" style="clear:both;">
<!--- AFI Link --->
<table>
<tr><td>
<a href="List.cfm?ID=1">AFI 100 Years 100 Films</a>
</td>
</tr>
</table>
</section>
</div>
<cfinclude template="Footer.cfm">