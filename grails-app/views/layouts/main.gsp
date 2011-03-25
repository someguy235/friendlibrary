<html>
  <head>
    <title><g:layoutTitle default="FriendLibrary" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'960gs.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css/custom-theme',file:'jquery-ui-1.8.7.custom.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'tablesorter-style.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <g:javascript src="jquery/jquery-1.5.1.min.js"/>
    <g:javascript src="jquery/jquery-ui-1.8.11.custom.min.js"/>
    <g:javascript src="jquery/jquery.tablesorter.min.js"/>
    <g:javascript library="application" />
    <g:layoutHead />
  </head>
  <body>
    <div class="container_12 content">
      <div id="spinner" class="spinner" style="display:none;">
        <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
      </div>
      <a href="/friendlibrary"><div id="header"></div></a>
      <br />
      <g:layoutBody />
      
    </div>
    <div class="clear" ></div>
    <div class="footer">
      <g:isLoggedIn>
        <g:set var="loggedInUsername" value="${loggedInUserInfo(field:'username')}" />
        <g:set var="loggedInUserId" value="${loggedInUserInfo(field:'id')}" />
                Welcome, ${loggedInUsername}
        <br />
        <g:link controller="user" action="library" id="${loggedInUserId}">library</g:link> |
        <g:link controller="user" action="profile" id="${loggedInUserId}">profile</g:link> |
        <g:link controller="user" action="friends" id="${loggedInUsername}">friends</g:link> |
        <g:link controller="search" action=" ">search</g:link> |
        <g:link controller="logout">logout</g:link>
      </g:isLoggedIn>
      <g:isNotLoggedIn>
        Welcome, guest
        <br />
        <g:link controller="login">log in</g:link> |
        <g:link controller="register">sign up</g:link>
      </g:isNotLoggedIn>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
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
