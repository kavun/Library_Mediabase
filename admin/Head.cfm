<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../CSS/styles.css"/>
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

<a href="../Index.cfm" id="logo">Library Media</a>
<!--- Search Form --->
<cfform action="search.cfm" method="POST" id="search_field">
<cfinput class="input" type="text" name="Keyword" size="15" maxlength="30" required="yes" message="Enter Search Term">
<input class="input" type="submit" value="Search">
</cfform>

</header>

   <section id="intro"> 
      <hgroup> 
      <h1>#PageTitle# </h1>
      <h2>#PageDescription#</h2>
      </hgroup> 
   </section> 


</cfoutput>



