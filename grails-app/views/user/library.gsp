<html>
	<head>
		<title>
			Library for ${user.username}
		</title>

    <r:script disposition='head'>
      var itemCategories = ${itemCategories};
      var libraryItems = ${libraryItems};
      var gamePlatforms = ${gamePlatforms};
      var movieFormats = ${movieFormats};
      var albumFormats = ${albumFormats};
      var userId = ${user.id};
      
    </r:script>
    <meta name="layout" content="main"/>
	</head>
	<body>
    <div id="friendlyApp">
      <div ng-show="${(flash.message != null)}" class="flash">${flash.message}</div>
      <div ng-show="${viewingSelf}" ng-controller="AddItemsController">  <!--interface for adding items -->
        <h1>Add Items</h1>
        <g:render template="addItem"/>
        <g:render template="addItemList" />
      </div>
      <div class="clear"></div>


      
      <h1>Library for <g:link controller="user" action="profile" id="${user.id}">${user.username}</g:link></h1>

      <div id="allItems" class="main" ng-controller="LibraryController">
        <div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="libTabs">
          <!-- list for tab titles -->
          <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
            <li ng-repeat="category in itemCategories" 
                class="ui-state-default ui-corner-top"
                ng-class="{'ui-tabs-selected':(category=='all'), 'ng-state-active':(category == 'all')}">
              <a href="#libTabs-{{category}}" style="text-transform: capitalize">{{category}}</a>
            </li>
          </ul>
          <ul ng-repeat="category in itemCategories">
            <li>{{category}}</li>
            <li>{{libraryItems[category]}}</li>
          </ul>
            
          
          
          
          
        </div>
      </div>
      
    </div>
	</body>
</html>

