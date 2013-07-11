<html>
	<head>
		<title>
			Library for ${user.username}
		</title>

    <r:script disposition='head'>
      var itemCategories = ${itemCategories};
      var libraryItems = ${libraryItems};
      var albumFormats = ${albumFormats};
      
    </r:script>
    <meta name="layout" content="main"/>
	</head>
	<body>
    <div id="friendlyApp">
      <div ng-show="${flash.message}" class="flash">${flash.message}</div>
      <div ng-show="${viewingSelf}" ng-controller="AddItemsController">  <!--interface for adding items -->
        <h1>Add Items</h1>
        <g:render template="addItem" model="['gamePlatforms':gamePlatforms]" />
        <g:render template="addItemList" />
      </div>
      <div class="clear"></div>


      
      
      <table ng-controller="LibraryController">
        <thead>
          <tr ng-repeat="category in itemCategories">
            <th>{{category}}</th>
          </tr>
        </thead>
      </table>
    </div>
	</body>
</html>

