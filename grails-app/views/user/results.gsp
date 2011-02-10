<html>
  <head>
    <title>Search Results</title>
    <meta name="layout" content="main"/>
  </head>
  <body>
    <h1>Search Results</h1>
    <p>Searched 
      for users matching <em><g:each in="${term}">${it} </g:each></em>.
      Found <strong>${users.size()}</strong> hits.
    </p>
    <br />
    <ul>
      <g:each var="user" in="${users}">
        <li><g:link controller="user" action="profile" id="${user.id}">${user.username}</g:link></li>
      </g:each>
    </ul>
    <br />
    <g:link action='search'>Search Again</g:link>
  </body>
</html>

