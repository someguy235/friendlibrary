<html>
	<head>
		<title>Library for ${user.username}</title>

    <r:script disposition='head'>
      var itemCategories = ${itemCategories};
      var libraryItems = ${libraryItems};
      var gamePlatforms = ${gamePlatforms};
      var movieFormats = ${movieFormats};
      var albumFormats = ${albumFormats};
      var userId = ${user.id};
      var viewingSelf = ${viewingSelf};
      var viewUser = ${viewUser};
    </r:script>
    <meta name="layout" content="main"/>
	</head>
	<body>
    <div id="friendlyApp">
      <div ng-show="${(flash.message != null)}" class="flash">${flash.message}</div>
      <div ng-show="{{viewingSelf}}" ng-controller="AddItemsController">  <!--interface for adding items -->
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
          <div ng-repeat="category in itemCategories" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="libTabs-{{category}}">
            <div ng-show="libraryItems[category].length == 0"class="noItems">There are no items in this category yet.</div>
            <table ng-hide="libraryItems[category].length == 0" id="libTabs-{{category}}-content" class="tablesorter">
              <thead>
                <tr>
                  <th class="library_all_col_available">Available &nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <th class="library_all_col_media">Media &nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <th class="library_all_col_title">Title &nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <th ng-show="category == 'all'" class="library_all_col_artist">Artist &nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <th ng-show="category == 'all'" class="library_all_col_author">Author &nbsp;&nbsp;&nbsp;&nbsp;</th>  
                  <th ng-show="category == 'all'" class="library_all_col_format">Format &nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <th ng-show="category == 'all'" class="library_all_col_platform">Platform &nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <th ng-show="category == 'music'" class="library_all_col_artist">Artist &nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <th ng-show="category == 'books'" class="library_all_col_author">Author &nbsp;&nbsp;&nbsp;&nbsp;</th>  
                  <th ng-show="category == 'music'" class="library_all_col_format">Format &nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <th ng-show="category == 'movies'" class="library_all_col_format">Format &nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <th ng-show="category == 'games'" class="library_all_col_platform">Platform &nbsp;&nbsp;&nbsp;&nbsp;</th>
                </tr>
              </thead>
              <tbody class="library_table_body">
                <tr ng-repeat="item in libraryItems[category]">
                  <td ng-controller="ItemOptionsController" align="center" class="lib_table_options">
                    <g:render template="optionsPanel"/>
                  </td>
                  <td align="center" class="lib_table_media">
                    <img height="20" width="20" src="/friendlibrary/images/icons/{{item.mediaType}}.png" alt="{{item.mediaType}}" title="{{item.mediaType}}"/>
                  </td>
                  <td class="lib_table_title">
                    <div id="item_title_{{item.id}}">{{item.title}}</div>
                  </td>
                  <td ng-show="item.mediaType == 'album'" class="lib_table_artist">{{item.artist}}</td>
                  <td ng-show="item.mediaType != 'album' && category == 'all'">&nbsp;</td>
                  <td ng-show="item.mediaType == 'book'" class="lib_table_artist">{{item.author}}</td>
                  <td ng-show="item.mediaType != 'book' && category == 'all'">&nbsp;</td>
                  <td ng-show="item.mediaType == 'album' || item.mediaType == 'movie'" class="lib_table_artist">{{item.platform}}</td>
                  <td ng-show="item.mediaType != 'album' && item.mediaType != 'movie' && category == 'all'">&nbsp;</td>
                  <td ng-show="item.mediaType == 'game'" class="lib_table_artist">{{item.platform}}</td>
                  <td ng-show="item.mediaType != 'game' && category == 'all'">&nbsp;</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
	</body>
</html>

