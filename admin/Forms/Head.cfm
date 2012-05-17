<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../../CSS/styles.css"/>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>

<!--- KENDO UI --->
    <link href="../../Styles/kendo.common.min.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/kendo.default.min.css" rel="stylesheet" type="text/css" />



<cfoutput>

<meta name="description" content="#PageDescription#" />
<meta name="keywords" content="#PageKeywords#" />
<title>#PageTitle# | Library Media</title>
</cfoutput>

</head>
<body>


<!--- KENDO UI --->
    <script src="../../JS/jquery.min.js" type="text/javascript"></script>
    <script src="../../JS/kendo.web.min.js" type="text/javascript"></script>


<div class="bg">
<div id="container">
<header>
<cfoutput>

<a href="../../Index.cfm" id="logo">Library Media</a>
<!--- Search Form --->
<cfform action="search.cfm" method="POST" id="search_field">
<cfinput class="input" type="text" name="Keyword" size="15" maxlength="30" required="yes" message="Enter Search Term">
<input class="input" type="submit" value="Search">
</cfform>
<nav>
<ul>
<li><a href="Index.cfm"<cfif Find("Hi",PageTitle)> class="current"</cfif>>Home</a></li>
<li><a href="Media.cfm"<cfif PageTitle IS "Media"> class="current"</cfif>>Media</a></li>
<li><a href="Directors.cfm"<cfif PageTitle IS "Directors"> class="current"</cfif>>Directors</a></li>
<li><a href="Genres.cfm"<cfif PageTitle IS "Genres"> class="current"</cfif>>Genres</a></li>
<li><a href="Logout.cfm"<cfif PageTitle IS "Log Out"> class="current"</cfif>>Log Out</a></li>

</ul>
</nav>


</header>

   <section id="intro"> 
      <hgroup> 
      <h1>#PageTitle# </h1>
      <h2>#PageDescription#</h2>
      </hgroup> 
   </section> 


</cfoutput>



