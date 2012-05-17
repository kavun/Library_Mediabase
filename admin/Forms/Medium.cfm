<cfif NOT IsDefined("URL.ID")>
	<cflocation url="Media.cfm">
</cfif>

<cfquery name="GetTypes" datasource="librarymedia">
    SELECT *
    FROM Types
    ORDER BY TypeName
</cfquery>
<cfquery name="GetRatings" datasource="librarymedia">
	SELECT *
    FROM Ratings
</cfquery>
<cfquery name="GetGenres" datasource="librarymedia">
	SELECT *
    FROM Genres
    ORDER BY GenreName
</cfquery>


<cfif URL.ID IS 0>
	<cfset MediaTitle = "">
    <cfset PageTitle = "Add Media">
    <cfset MediaDesc = "">
    <cfset MediaIMDB = "">
    <cfset MediaReleaseDate = "">
    <cfset RatingID = "">
    <cfset TypeID = "">
<cfelse>
	<cfquery name="GetMedia" datasource="librarymedia">
        SELECT *
        FROM Media
        WHERE MediaID = #URL.ID#
    </cfquery>
    <cfquery name="GetMediaGenres" datasource="librarymedia">
		SELECT *
        FROM Genres g, MediaGenres mg
        WHERE mg.MediaID = #URL.ID# AND g.GenreID = mg.GenreID
    </cfquery>
    <cfquery name="GetMediaLists" datasource="librarymedia">
    	SELECT l.*, ml.*
        FROM Lists l, MediaLists ml
        WHERE ml.MediaID = #URL.ID# AND l.ListID = ml.ListID
    </cfquery>
    <cfquery name="GetMediaDirectors" datasource="librarymedia">
    	SELECT *
        FROM Directors d, MediaDirectors md
        WHERE md.MediaID = #URL.ID# AND d.DirectorID = md.DirectorID
    </cfquery>
    <cfset PageTitle = "Edit Media">
    <cfset MediaTitle = "#GetMedia.MediaTitle#">
    <cfset MediaDesc = "#GetMedia.MediaDesc#">
    <cfset MediaIMDB = "#GetMedia.MediaIMDB#">
    <cfset MediaReleaseDate = "#GetMedia.MediaReleaseDate#">
    <cfset RatingID = "#GetMedia.RatingID#">
    <cfset TypeID = "#GetMedia.TypeID#">
</cfif>

<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">
<section class="group2">

<table>
<cfform action="MediaAction.cfm?ID=#URL.ID#" method="post">
<tr>
	<td>Title</td>
    <td><cfinput class="input" type="text" name="MediaTitle" required="yes" message="Please enter a media title" value="#MediaTitle#"  size="30" maxlength="50" validate="maxlength" validateat="onServer,onSubmit"></td>
</tr>
<tr>
	<td>Description</td>
    <td><cftextarea class="input" name="MediaDesc" cols="29" rows="5"><cfoutput>#MediaDesc#</cfoutput></cftextarea></td>
</tr>

<tr>
	<td>IMDB</td>
    <td><cfinput class="input" type="text" name="MediaIMDB" message="Please enter a IMDB number" value="#MediaIMDB#" size="30" maxlength="50" validate="maxlength" validateat="onServer,onSubmit"></td>
</tr>

<tr>
	<td>Release Date</td>
    <cfoutput>
    <td><cfinput class="input" type="datefield" style="font-size:14px" id="MediaReleaseDate" name="MediaReleaseDate" message="Please enter a release date" required="yes" validate="date" validateat="onServer,onSubmit" value="#DateFormat(MediaReleaseDate, "m/d/yyyy")#">
    </td>
	</cfoutput>
    <!---<script>
			$("#MediaReleaseDate").kendoDatePicker();
    </script>--->
</tr>

<tr>
	<td>Type</td>
    <td><cfselect class="input" name="TypeID" query="GetTypes" value="TypeID" selected="#TypeID#" display="TypeName"></cfselect>
</tr>


<tr>
	<td>Rating</td>
    <td><cfselect class="input" name="RatingID" query="GetRatings" value="RatingID" selected="#RatingID#" display="RatingName"></cfselect>
</tr>

<!--- Media Genres --->
<tr>
	<td>Genres</td>
    <td> Select multiple with <br />CTRL + Click (Windows) or <br />CMD + Click (OS X)<br />
    	<cfselect class="input" name="SelectGenres" multiple="yes" >
			<cfoutput>
                <cfloop query="GetGenres">
                    <cfset found = false>
                    <cfif URL.ID IS NOT 0>
                        <cfloop query="GetMediaGenres">
                            <cfif GetMediaGenres.GenreID IS GetGenres.GenreID>
                                <cfset found = true>
                            </cfif>
                        </cfloop>
                    </cfif>
                    <option value="#GenreName#" <cfif found>selected</cfif>>#GenreName#</option>
                </cfloop>
        	</cfoutput>
    	</cfselect>
	</td>
</tr>
		<cfif URL.ID NEQ 0>
<!--- Media Lists --->
        <cfoutput>
<tr>
	<td valign="top">Lists<br /><a href="MediaList.cfm?MediaID=#URL.ID#&amp;ListID=0" style="font-weight:bold">Add List</a></td>
    <cfif GetMediaLists.RecordCount NEQ 0>
    <td>
    <table>
        <cfloop query="GetMediaLists">
        <tr>
                <td>#MediaListDesc# - <a href="#ListURL#">#ListName#</a> (#ListYear#)<br /></td>
                <td><a style="color:##F00" href="MediaListDeleteCheck.cfm?ListID=#ListID#&amp;MediaID=#MediaID#">Remove</a></td>
        </tr>
        </cfloop>

    </table>
    </td>
    </cfif>
</tr>

<!--- Media Directors --->

<tr>
	<td>Directors<br /><a href="MediaDirector.cfm?MediaID=#URL.ID#&amp;DirectorID=0" style="font-weight:bold">Add Director</a></td>
    <cfif GetMediaDirectors.RecordCount NEQ 0>
    <td>
    <table>
        <cfloop query="GetMediaDirectors">
        <tr>
        	<td>#DirectorFirstName#</td>
            <td>#DirectorLastName#</td>
            <td><a style="color:##F00" href="MediaDirectorDeleteCheck.cfm?DirectorID=#DirectorID#&amp;MediaID=#URL.ID#">Remove</a></td>
        </tr>
        </cfloop>


        </tbody>
    </table>
    </td>
    </cfif>
</tr>
        </cfoutput>
        </cfif>

<!--- SUBMIT --->
<tr>
	<td colspan="2" align="right"><cfoutput><input class="input" type="submit" value="#PageTitle#"></cfoutput></td>
</tr>
</cfform>
</table>



</section>

<cfif URL.ID NEQ 0>
<cfquery name="GetItems" datasource="librarymedia">
	SELECT *
    FROM Items
    WHERE MediaID = #URL.ID#
</cfquery>
<cfoutput>
    <section class="group2">
    <h3><a href="Item.cfm?ID=0&amp;MediaID=#URL.ID#">Add Item</a></h3>
    </section>
</cfoutput>
<cfif #GetItems.RecordCount# NEQ 0>
<section class="group2">
                    <table>
<cfoutput query="GetItems">
                    <cfquery name="GetFormats" datasource="librarymedia">
                        SELECT *
                        FROM Formats
                        WHERE Formats.FormatID = #FormatID#
                    </cfquery>

                    <tr>
                    <td>
                    <img src="http://images.amazon.com/images/P/#ItemASIN#.01.THUMBZZZ.jpg" />
                    </td>
                    <td>
                    #ItemDesc#<br />(#GetFormats.FormatName#)
                    </td>
                    <td>
                    <a href="Item.cfm?ID=#ItemID#&amp;MediaID=#URL.ID#">Edit</a>
                    </td>
                    <td>
                    | <a href="ItemDeleteCheck.cfm?ID=#ItemID#&amp;MediaID=#URL.ID#">Delete</a>
                    </tr>

                    </cfoutput>
                    </table>
</section>
</cfif>
</cfif>


</div> <!-- end holder_content -->


<cfinclude template="Footer.cfm">

