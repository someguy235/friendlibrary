<html>
  <head>
    <title>Search Results</title>
    <meta name="layout" content="main"/>
  </head>
  <body>
    <h1>Search Results</h1>
    <h2>Searched
      for users matching '<em><g:each in="${term}">${it}</g:each></em>'.
      Found <strong>${users.size()}</strong>:
    </h2>
    <br />
      <div class="search_result">
      <g:each var="user" in="${users}">
        <li><g:link controller="user" action="profile" id="${user.id}">${user.username}</g:link>
            (<g:link controller="user" action="library" id="${user.id}">library</g:link>)
        </li>
      </g:each>
      </div>
    <br />
    <br />
    <g:link action='search'>Search Again</g:link>
  </body>
</html>

