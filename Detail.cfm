<cfif not IsDefined("URL.ID")>
 <cflocation url="Index.cfm">
</cfif>

<cfquery name="GetMedia" datasource="librarymedia">
	SELECT m.*, t.*, r.*
    FROM Media m, Types t, Ratings r
    WHERE m.MediaID = #URL.ID# AND t.TypeID = m.TypeID AND r.RatingID = m.RatingID
</cfquery>

<cfif GetMedia.RecordCount IS 0>
 <cflocation url="Index.cfm">
</cfif>

<cfset MediaID=#GetMedia.MediaID#>

<cfquery name="GetItems" datasource="librarymedia">
	SELECT i.*, f.*, r.*
    FROM Items i, Formats f, Ratings r
    WHERE i.MediaID = #MediaID# AND i.FormatID = f.FormatID AND i.RatingID = r.RatingID
</cfquery>

<cfquery name="GetTypes" datasource="librarymedia">
	SELECT t.*
    FROM Types t, Media m
    WHERE m.MediaID = #MediaID# AND t.TypeID = m.TypeID
</cfquery>

<cfquery name="GetRating" datasource="librarymedia">
	SELECT r.*
    FROM Ratings r, Media m
    WHERE r.RatingID = m.RatingID AND m.MediaID = #MediaID#    
</cfquery>

<cfquery name="GetMediaGenres" datasource="librarymedia">
	SELECT mg.*, g.*
    FROM MediaGenres mg, Genres g
    WHERE mg.MediaID = #MediaID# AND mg.GenreID = g.GenreID
</cfquery>

<cfquery name="GetMediaDirectors" datasource="librarymedia">
	SELECT md.*, d.*
    FROM MediaDirectors md, Directors d
    WHERE md.MediaID = #MediaID# AND d.DirectorID = md.DirectorID
</cfquery>

<cfquery name="GetMediaLists" datasource="librarymedia">
	SELECT ml.*, l.*
    FROM MediaLists ml, Lists l
    WHERE ml.MediaID = #MediaID# AND ml.ListID = l.ListID
</cfquery>


<cfset PageTitle = "#GetMedia.MediaTitle#">
<cfset PageDescription = "#GetMedia.MediaDesc#">
<cfset PageKeywords = "">

<cfinclude template="Head.cfm">

<div class="holder_content">

<section id="intro">
<table width="100%">
    <col width="100px" />
    <cfoutput query="GetMedia">
        <tr>
            <td>
            Release Date
            </td>
            <td>
            #DateFormat(MediaReleaseDate, "dddd, mmmm d, yyyy")#
            </td>
        </tr>
        <tr>
            <td>
            IMDB
            </td>
            <td>
                <cfif MediaIMDB IS NOT "">
                    <a href="http://www.imdb.com/title/#MediaIMDB#">Find on IMDB</a>
                <cfelse>
                    <a href="http://www.imdb.com/find?q=#MediaTitle#&s=all">Find on IMDB</a>
                </cfif>  
            </td>
        </tr>
        <tr>
            <td>
            Type Name
            </td>
            <td>
            <a href="Type.cfm?ID=#TypeID#">#TypeName#</a>
            </td>
        </tr>
        <tr>
            <td>
            Rating
            </td>
            <td>
            <a href="Rating.cfm?ID=#RatingID#">
            #RatingName#
            </a>
            </td>
        </tr>
    </cfoutput>
    <tr>
        <td>
        Genres
        </td>
        <td>
            <cfoutput query="GetMediaGenres">
            	<a href="Genre.cfm?ID=#GenreID#">#GenreName#</a> <cfif #RecordCount# GT 1 AND #CurrentRow# LT #RecordCount#>,</cfif>
            </cfoutput>
        </td>
    </tr>
    <tr>
        <td>
        Directors
        </td>
        <td>
            <cfoutput query="GetMediaDirectors">
            	<a href="Director.cfm?ID=#DirectorID#">#DirectorFirstName# #DirectorLastName#</a><cfif #RecordCount# GT 1 AND #CurrentRow# LT #RecordCount#>,</cfif>
            </cfoutput>
        </td>
    </tr>
    <tr>
        <td>
        Lists
        </td>
        <td>
            <cfoutput query="GetMediaLists">
            	<a href="#ListURL#">#ListName#</a> - #ListYear#<cfif #RecordCount# GT 1 AND #CurrentRow# LT #RecordCount#>,</cfif>
            </cfoutput>
        </td>
    </tr>
</table>

</section>
</div>

<div class="holder_content">

<h3>Items</h3>
<cfif GetItems.RecordCount IS 0>
No Items In Database
<cfelse>
<cfset i = 1>
<cfoutput query="GetItems">
<section class="group1">
<cfset i = i + 1>
<div class="item">
    <table>
        <tr>
        <td>
        	<img src="http://images.amazon.com/images/P/#ItemASIN#.01.THUMBZZZ.jpg" />
        </td>
        </tr>
        <tr>
            <td>
            #ItemDesc# - #FormatName# - #RatingName# - (#DateFormat(ItemReleaseDate, "yyyy")#)
            </td>
        </tr>
        <tr>
            <td>
            #DateFormat(ItemDateAdded, "dddd, mmmm d, yyyy")#
            </td>
        </tr>

        <tr>
            <td>
            <a href="http://www.amazon.com/exec/obidos/ASIN/#ItemASIN#">Buy It On Amazon</a> - #ItemASIN#
            </td>
        </tr>
        <tr>
            <td>
            <a href="http://uu.worldcat.org/oclc/#ItemOCLC#">Find it in Union's Library</a> - #ItemCallNumber#
            </td>
        </tr>
	</table>
    </div>
    <br />
    </section>
</cfoutput>
</cfif>
</div>


<cfinclude template="Footer.cfm">