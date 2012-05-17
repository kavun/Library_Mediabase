<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="CSS/styles.css"/>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
<cfoutput>

<meta name="description" content="#PageDescription#" />
<meta name="keywords" content="#PageKeywords#" />
<title>#PageTitle# | Library Media</title>
</cfoutput>

</head>
<body>
<div class="bg">
<div id="container">
<header>
<cfoutput>
<!---
      <!--start logo-->
      <a href="#" id="logo"><img src="images/logo.png" width="180" height="43" alt="logo"/></a>    
      <!--end logo-->
      <!--start menu-->
  	   <nav>
         <ul>
         <li><a href="#" class="current">Home</a></li>
         <li><a href="#">About us</a></li>
     	   <li><a href="#">Services</a></li>
     	   <li><a href="#">Portfolio</a></li>
         <li><a href="#">News</a></li>
         <li><a href="#">Contact</a></li>
         </ul>
      </nav> --->

<a href="Index.cfm" id="logo">Library Media</a>
<!--- Search Form --->
<cfform action="Search.cfm" method="POST" id="search_field">
<cfinput class="input" type="text" name="Keyword" size="15" maxlength="30" required="yes" message="Enter Search Term">
<input class="input" type="submit" value="Search">
</cfform>
<nav>
<ul>
<li><a href="Index.cfm"<cfif PageTitle IS "Home"> class="current"</cfif>>Home</a></li>
<li><a href="Types.cfm"<cfif PageTitle IS "Types"> class="current"</cfif>>Types</a></li>
<li><a href="Ratings.cfm"<cfif PageTitle IS "Ratings"> class="current"</cfif>>Ratings</a></li>
<li><a href="Formats.cfm"<cfif PageTitle IS "Formats"> class="current"</cfif>>Formats</a></li>
<li><a href="Recent.cfm"<cfif PageTitle IS "Recently Added"> class="current"</cfif>>Recently Added</a></li>

</ul>
</nav>


</header>

   <section id="intro"> 
      <hgroup> 
      
      <h2><span style="font-size:36px;">#PageTitle#</span>&nbsp;&nbsp;&nbsp;#PageDescription#</h2>
      </hgroup> 
   </section> 


</cfoutput>



