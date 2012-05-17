<cfif NOT ISDEFINED("SESSION.Access")><cflocation url="../Index.cfm"></cfif>

<cfset PageTitle = "Hi #SESSION.UserName#.">
<cfset PageDescription = "">
<cfset PageKeywords = "">
<cfinclude template="Head.cfm">

<div class="holder_content">


<a href="Media.cfm">
	<section class="group1" style="text-align:center; font-size:24px;">Media</section>
</a>


<a href="Directors.cfm">
	<section class="group1" style="text-align:center; font-size:24px;">Directors</section>
</a>


<cfif SESSION.Access IS 9>
	<!--- super user --->

    <a href="Genres.cfm">
    	<section class="group1" style="text-align:center; font-size:24px;">Genres</section>
    </a>
    

    <a href="lists.cfm"  style="color:#FF6464;">
    	<section class="group1" style="text-align:center;font-size:24px;">Lists</section>
    </a>
    

    <a href="Types.cfm"  style="color:#FF6464;">
    	<section class="group1" style="text-align:center; font-size:24px;">Types</section>
    </a>
    

    <a href="Formats.cfm"  style="color:#FF6464;">
    	<section class="group1" style="text-align:center; font-size:24px;">Formats</section>
    </a>
    

    <a href="Ratings.cfm"  style="color:#FF6464;">
    	<section class="group1" style="text-align:center; font-size:24px;">Ratings</section>
    </a>
    

<cfelseif SESSION.Access IS 1>
	<!--- non-super user --->
</cfif>



</section>
</div>
<cfinclude template="Footer.cfm">

