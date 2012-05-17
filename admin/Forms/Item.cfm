<cfif NOT IsDefined("URL.ID") OR NOT IsDefined("URL.MediaID")>
	<cflocation url="Media.cfm">
</cfif>

<!--- EDIT ITEM --->
<cfif URL.ID NEQ 0>
    <cfquery name="GetItem" datasource="librarymedia">
        SELECT *
        FROM Items
        WHERE ItemID = #URL.ID#
    </cfquery>
    
    <cfset FormatID = #GetItem.FormatID#>
    <cfset ItemASIN = #GetItem.ItemASIN#>
    <cfset ItemCallNumber = #GetItem.ItemCallNumber#>
    <cfset ItemDateAdded = #GetItem.ItemDateAdded#>
    <cfset ItemDesc = #GetItem.ItemDesc#>
    <cfset ItemID = #GetItem.ItemID#>
    <cfset ItemOCLC = #GetItem.ItemOCLC#>
    <cfset ItemReleaseDate = #GetItem.ItemReleaseDate#>
    <cfset MediaID = #URL.MediaID#>
    <cfset RatingID = #GetItem.RatingID#>
    
    <cfoutput>
    <cfset PageTitle = "Edit Item">
    <cfset PageDescription = "">
    <cfset PageKeywords = "">
    </cfoutput>
    

<!--- ADD ITEM --->
<cfelse>

    <cfset FormatID = "">
    <cfset ItemASIN = "">
    <cfset ItemCallNumber = "">
    <cfset ItemDateAdded = "">
    <cfset ItemDesc = "">
    <cfset ItemID = "">
    <cfset ItemOCLC = "">
    <cfset ItemReleaseDate = "">
    <cfset MediaID = #URL.MediaID#>
    <cfset RatingID = "">
    
    <cfoutput>
    <cfset PageTitle = "Add Item">
    <cfset PageDescription = "">
    <cfset PageKeywords = "">
    </cfoutput>

</cfif>

<cfinclude template="Head.cfm">
    <div class="holder_content">
        <section class="group2">
            <table>
            <cfform action="ItemAction.cfm?ID=#URL.ID#" method="post">
            <cfinput name="MediaID" value="#MediaID#" style="display:none;">
                <tr><td><img src="http://images.amazon.com/images/P/#ItemASIN#.01.THUMBZZZ.jpg" /></td></tr>
                <tr><td>Format</td>
                    <td>
                        <cfquery name="GetFormats" datasource="librarymedia">
                            SELECT *
                            FROM Formats
                        </cfquery>
                        <cfselect class="input" name="FormatID" query="GetFormats" value="FormatID" selected="#FormatID#" display="FormatName"></cfselect>
                    </td>
                </tr>
                <tr><td>Item ASIN</td>
                    <td><cfinput class="input" type="text" name="ItemASIN" message="Please enter an ASIN number." value="#ItemASIN#" size="20" maxlength="50" validate="maxlength" validateat="onserver,onsubmit"></td>
                </tr>
                <tr><td>Call Number</td>
                    <td><cfinput class="input" type="text" name="ItemCallNumber" message="Please enter a library call number." value="#ItemCallNumber#" size="20" maxlength="50" validate="maxlength" validateat="onserver,onsubmit"></td>
                </tr>
                <tr><td>Date Added</td>
                    <td><cfinput class="input" type="DateField" name="ItemDateAdded" message="Please enter a the date added to the library" validate="date" validateat="onserver,onsubmit" required="yes" value="#DateFormat(ItemDateAdded, "m/d/yyyy")#"></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><cftextarea class="input" name="ItemDesc" cols="23" rows="5"><cfoutput>#ItemDesc#</cfoutput></cftextarea></td>
                </tr>
                <tr><td>Item OCLC</td>
                    <td><cfinput class="input" type="text" name="ItemOCLC" message="Please enter an OCLC number." value="#ItemOCLC#" size="20" maxlength="50" validate="maxlength" validateat="onserver,onsubmit"></td>
                </tr>
                  <tr><td>Release</td>
                    <td><cfinput class="input" type="DateField" name="ItemReleaseDate" message="Please enter a the date released" validate="date" validateat="onserver,onsubmit" required="yes" value="#DateFormat(ItemReleaseDate, "m/d/yyyy")#"></td>
                </tr>
                <tr>
                <td colspan="2" align="right">
                <cfoutput>
                <input class="input" type="submit" value="#PageTitle#"  />
                </cfoutput>
                </td>
                </tr>
            </cfform>
            </table>
        </section>
        </div>
<cfinclude template="Footer.cfm">