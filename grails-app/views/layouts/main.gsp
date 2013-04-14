<html>
  <head>
    <title><g:layoutTitle default="FriendLibrary" /></title>
    <g:layoutHead />
    <r:require module="common" />
    <r:layoutResources />
  </head>
  <body>
    <a href="/friendlibrary">
      <div id="header">
        <!--<img src="${resource(dir:'images',file:'books_header.png')}" alt="banner header" />-->
      </div>
    </a>
    <div class="container_12 content">
      <div id="spinner" class="spinner" style="display:none;">
        <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
      </div>
      <g:layoutBody />
    </div>
    <div class="clear" ></div>
    <div class="footer">
      <sec:ifLoggedIn>
        <g:set var="loggedInUsername" value="${sec.username()}" />
        <g:set var="loggedInUserId" value="${sec.loggedInUserInfo(field:'id')}" />
        <g:set var="newMessages" value="${viewUser.inMessages.size()}" />
        <div class="welcome_bar">
          <span class="welcome_message">Welcome, ${loggedInUsername}</span>
          <g:set var="message_classes">message_count message_count_0</g:set>
          <g:if test="${newMessages != 0}">
            <g:set var="message_classes">message_count message_count_n</g:set>
          </g:if>
          <g:set var="newMessagesTitle" value="${newMessages} new messages" />
          <g:if test="${newMessages != 1}">
            <g:set var="newMessagesTitle" value="${newMessages} new messages" />
          </g:if>
          
          <g:link controller="user" action="profile" id="${loggedInUserId}" title="${newMessagesTitle}">
            <div class="${message_classes}">
              ${newMessages}
            </div>
          </g:link>

        </div>
        <div class="clear"></div>
        <g:link controller="user" action="library" id="${loggedInUserId}">library</g:link> |
        <g:link controller="user" action="profile" id="${loggedInUserId}">profile</g:link> |
        <g:link controller="user" action="friends" id="${loggedInUsername}">friends</g:link> |
        <g:link controller="search" action=" ">search</g:link> |
        <g:link controller="logout">logout</g:link>
      </sec:ifLoggedIn>
      <sec:ifNotLoggedIn>
        Welcome, guest
        <br />
        <g:link controller="login">log in</g:link> |
        <g:link controller="login">sign up</g:link>
      </sec:ifNotLoggedIn>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <r:layoutResources />
  </body>
</html>
