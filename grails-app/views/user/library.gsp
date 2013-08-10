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
      var viewUserId = ${viewUser.id};
      //TODO: fix this
      var flashMessage;
      
    </r:script>
    <meta name="layout" content="main"/>
	</head>
	<body>
    <div id="friendlyApp">
      <div ng-controller="FlashController">
<!--        <div ng-show="{(flashMessage != null)}" class="flash">{{flashMessage}}</div>-->
      </div>
      <div ng-controller="AddItemsController">
        <div ng-show="viewingSelf">  <!--interface for adding items -->
          <h1>Add Items</h1>
          <g:render template="addItem"/>
          <g:render template="addItemList" />
        </div>
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
                    <button class="option_button" id="option_button_{{category}}_{{item.id}}" title="options" onclick="options_panel({{item.id}});">
                      <img height="15" width="15" ng-src="/friendlibrary/images/icons/{{buttonImage}}" />
                    </button>
                    
                    <div class="options_panel" id="options_panel-{{item.id}}" class="library_item_options" style="display:none;">
                      <div class="library_item_status">
                        {{item_status_message}}
                      </div>
                      <g:if test="{{needConfirmItemRequestForm == 'true'}}"> 
                        <div class="library_item_option"> 
                          <g:form controller="message" action="confirmItemRequest"> 
                            <input type="hidden" id="requestingUser" name="requestingUser" value="{{item.requestQueue[0]}}" /> 
                            <input type="hidden" id="requestedUser" name="requestedUser" value="{{user.id}}" /> 
                            <input type="hidden" id="requestedMedia" name="requestedMedia" value="{{item.id}}" /> 
                            <button aria-disabled="false" role="button" id="button" title="{{buttonTitle}}"> 
                              <img height="15" width="15" ng-src="/friendlibrary/images/icons/greenlight.png" /> 
                            </button> 
                            <span class="library_item_option_text">mark as delivered</span> 
                          </g:form> 
                        </div> 
                      </g:if> 
                      <div class="library_item_option"> 
                        <g:form controller="message" action="{{formAction}}"> 
                          <input type="hidden" id="requestingUser" name="requestingUser" value="{{viewUser.id}}" /> 
                          <input type="hidden" id="requestedUser" name="requestedUser" value="{{user.id}}" /> 
                          <input type="hidden" id="requestedMedia" name="requestedMedia" value="{{item.id}}" /> 
                          <button aria-disabled="false" role="button" id="button" title="{{buttonTitle}}"> 
                            <img height="15" width="15" ng-src="/friendlibrary/images/icons/{{buttonImage}}" /> 
                          </button> 
                          <span class="library_item_option_text">{{buttonTitle}}</span> 
                        </g:form> 
                      </div> 
                      <g:if test="{{viewingSelf}}"> 
                        <g:if test="{{notLoanedOut}}"> 
                          <div class="library_item_option"> 
                            <button aria-disabled="false" role="button" onclick="edit_panel({{item.id}});" id="button" class="edit_button" title="edit item"> 
                              <img height="15" width="15" ng-src="/friendlibrary/images/icons/yellowlight.png" /> 
                            </button> 
                            <span class="library_item_option_text">edit</span> 
                          </div> 
                          <div class="clear"></div> 
                        </g:if> 
                        <div class="library_item_option"> 
                          <button aria-disabled="false" role="button" onclick="delete_panel({{item.id}});" id="button" class="delete_button" title="delete item"> 
                              <img height="15" width="15" ng-src="/friendlibrary/images/icons/delete.png" /> 
                          </button> 
                          <span class="library_item_option_text">delete</span> 
                        </div> 
                      </g:if> 
                    </div>
                    
                    <div class="edit_panel" id="edit_panel-{{item.id}}" title="Edit: {{item.title}}" style="display:none;">
                      <form ng-submit="editItem('{{item.id}}', '{{item.mediaType}}')" onsubmit="return false;">
                        <input type="hidden" id="requestedMedia" name="requestedMedia" value="{{item.id}}" />
                        <input type="hidden" id="requestedMediaType" name="requestedMediaType" value="{{item.mediaType}}" />
                        <img height="20" width="20" ng-src="/friendlibrary/images/icons/{{item.mediaType}}.png" alt="{{item.mediaType}}" title="{{item.mediaType}}"/>
                        <div class="clear"></div>
                        <div class="edit_label"><label for="edit_title">Title:</label></div>
                        <div class="edit_field"><input ng-model="mediaTitle" type="text" name="edit_title" value="{{item.title}}" /></div>
                        <div class="clear"></div> 
                        <div ng-show="item.mediaType == 'album'">
                          <div class="edit_label"><label for="edit_artist">Artist:</label></div>
                          <div class="edit_field"><input ng-model="albumArtist" type="text" name="edit_artist" value="{{item.artist}}" /></div>
                          <div class="edit_label"><label for="edit_format">Format:</label></div>
                          <div class="edit_field"><select ng-model="albumFormats.format" ng-options="a for a in albumFormats"></select></div>
                          <div class="clear"></div>
                        </div>
                        <div ng-show="item.mediaType == 'book'">
                          <div class="edit_label"><label for="edit_author">Author:</label></div>
                          <div class="edit_field"><input ng-model="bookAuthor" type="text" name="edit_author" value="{{item.author}}" /></div>
                          <div class="clear"></div>
                        </div>
                        <div ng-show="item.mediaType == 'movie'">
                          <div class="edit_label"><label for="edit_format">Format:</label></div>
                          <div class="edit_field"><select ng-model="movieFormats.format" ng-options="a for a in movieFormats"></select></div>
                          <div class="clear"></div>
                        </div>
                        <div ng-show="item.mediaType == 'game'">
                          <div class="edit_label"><label for="edit_platform">Platform:</label></div>
                          <div class="edit_field"><select ng-model="gamePlatforms.platform" ng-options="g for g in gamePlatforms"></select></div>
                          <div class="clear"></div> 
                        </div>
                        <br />
                        <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button">
                          <span class="ui-button-text">Update</span>
                        </button>
                      </form>
                    </div>
                    <div class="clear"></div>
                    
                    <div class="delete_panel" id="delete_panel-{{item.id}}" title="Delete: {{item.title}}?" style="display:none;">
                      <g:form controller="item" action="deleteItem" id="{{user.id}}">
                        <input type="hidden" id="requestedMedia" name="requestedMedia" value="{{item.id}}" />
                        <img height="20" width="20" ng-src="/friendlibrary/images/icons/{{item.mediaType}}.png" alt="{{item.mediaType}}" title="{{item.mediaType}}"/>
                        <div class="clear"></div>
                        <button aria-disabled="false" role="button" class="delete_item_button" id="button" title="Yes, get rid of it!">
                          Yes, get rid of it!
                        </button>
                      </g:form>
                      <button aria-disabled="false" role="button" class="delete_item_button" id="button" onclick="close_delete_panel({{item.id}});" title="No, just kidding.">
                        No, just kidding.
                      </button>
                    </div>
                    
                  </td>
                  <td align="center" class="lib_table_media">
                    <img height="20" width="20" ng-src="/friendlibrary/images/icons/{{item.mediaType}}.png" alt="{{item.mediaType}}" title="{{item.mediaType}}"/>
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

