<html>
  <head>
    <title>Search Results</title>
    <meta name="layout" content="main"/>
  </head>
  <body>
    <h1>Results</h1>
    <p>Searched ${com.friendlibrary.Item.count()} records
      for items matching <em>${term}</em>.
      Found <strong>${items.size()}</strong> hits.
    </p>
    <ul>
      <g:each var="item" in="${items}">
        <li>${item.itemId}</li>
      </g:each>
    </ul>
    <g:link action='search'>Search Again</g:link>
  </body>
</html>

