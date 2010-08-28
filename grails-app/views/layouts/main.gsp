<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css/custom-theme',file:'jquery-ui-1.8.1.custom.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'tablesorter-style.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:javascript library="jquery" />
        <g:javascript library="application" />
        <g:javascript library="resize" />
        <jq:plugin name="tablesorter" />
        <jq:plugin name="ui" />
        <g:layoutHead />
    </head>
    <body>
    	<div class="content">
    	<div id="spinner" class="spinner" style="display:none;">
      	<img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
      </div>
      <!-- <br /> -->
      <h1><a href="/friendlibrary">FriendlyLibrary</a></h1>
      <br />
      <g:layoutBody />
      <div class="footer">
      	<g:isLoggedIn>
	  		<g:set var="loggedInUsername" value="${loggedInUserInfo(field:'username')}" />
          	Welcome, ${loggedInUsername}
	      	<br />
	      	<g:link controller="library" action="index" id="${loggedInUsername}">library</g:link> | 
	      	<g:link controller="user" action="profile" id="${loggedInUsername}">profile</g:link> | 
	      	<g:link controller="user" action="friends" id="${loggedInUsername}">friends</g:link> | 
	      	<g:link controller="search" action=" ">search</g:link> | 
	      	<g:link controller="logout">logout</g:link>
	  	</g:isLoggedIn>
      	<g:isNotLoggedIn>
      		<g:link controller="login">log in</g:link> | 
      		<g:link controller="register">sign up</g:link>
      	</g:isNotLoggedIn>
      </div>
      <h3>
      	All: &copy 2010, Ethan Shepherd
      </h3>
      </div>
    </body>
    <g:javascript>
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</g:javascript>
	<g:javascript type="text/javascript">
		try {
			var pageTracker = _gat._getTracker("UA-16289542-1");
			pageTracker._trackPageview();
		} catch(err) {}
	</g:javascript>
</html>
