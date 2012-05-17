<cfquery name="GetMediaFromGenre" datasource="librarymedia">
	SELECT DISTINCT m.*, g.GenreName
    FROM Media m, MediaGenres mg, Genres g, Items i
    WHERE mg.GenreID = #URL.ID# AND mg.MediaID = m.MediaID AND g.GenreID = mg.GenreID AND i.MediaID = m.MediaID
    ORDER BY m.MediaTitle ASC
</cfquery>

<!---

SELECT DISCTINCT m.*, g.GenreName
FROM items i, formats f, mediagenre mg, media m, genres g
WHERE mg.GenreID = #URL.ID# AND 
f. FormatID = i.FormatID AND 
i.MediaID = m.MediaID AND 
m.MediaID = mg.MediaID AND 
mg.GenreID = g.GenreID

--->



<cfset PageTitle = "#GetMediaFromGenre.GenreName#">
<cfset PageDescription = "">
<cfset PageKeywords = "">

<cfinclude template="Head.cfm">

<div class="holder_content">
<section class="group2">
<table>
	<cfoutput query="GetMediaFromGenre">
        <tr><td>
        	<a href="Detail.cfm?ID=#MediaID#">#MediaTitle#</a>
        </td></tr>
    </cfoutput>
</table>

</section>
</div>

<cfinclude template="Footer.cfm">
