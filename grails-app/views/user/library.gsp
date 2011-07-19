<html>
	<head>
		<title>
			Library for ${user.username}
		</title>

    <meta name="layout" content="main"/>
    
		<g:javascript>
      $.fx.speeds._default = 250;
			$(function() {
        $( ".library_item_options" ).dialog({
          autoOpen: false,
          modal: true
        });

        $( ".option_button" ).click(function() {
          var id = $(this).attr("id");
          id = id.substring(id.indexOf("-")+1);
          $( '#item_options-'+id+'' ).dialog( "open" );
          return false;
        });

        $("#newItemTabs").tabs({ selected: 0 });
        $("#newItemListTabs").tabs({ selected: 0 });
        
        $("#borrowedTabs").tabs({ selected: 0 });
      	$("#borrowedTabs-all-content").tablesorter( {sortList: [[1,0],[2,0]]} );
      	$("#borrowedTabs-games-content").tablesorter( {sortList: [[1,0],[2,0]]} );
      	$("#borrowedTabs-books-content").tablesorter( {sortList: [[1,0],[2,0]]} );
      	$("#borrowedTabs-movies-content").tablesorter( {sortList: [[1,0],[2,0]]} );
      	$("#borrowedTabs-music-content").tablesorter( {sortList: [[1,0],[2,0]]} );

        $("#libTabs").tabs({ selected: 0 });
      	$("#libTabs-all-content").tablesorter( {sortList: [[1,0],[2,0]]} ); 
      	$("#libTabs-games-content").tablesorter( {sortList: [[1,0],[2,0]]} );
      	$("#libTabs-books-content").tablesorter( {sortList: [[1,0],[2,0]]} );
      	$("#libTabs-movies-content").tablesorter( {sortList: [[1,0],[2,0]]} );
      	$("#libTabs-music-content").tablesorter( {sortList: [[1,0],[2,0]]} );
    	});
		</g:javascript>
	</head>
	<body>
    
		<div > <!-- interface for adding items -->
			<g:if test="${viewingSelf}">
        <g:render template="addItem" />
        <g:render template="addItemList" />
			</g:if>
		</div>
		<div class="clear"></div>

    <!--TODO: do this better -->
    <g:set var="item_categories" value="${['all', 'games', 'books', 'movies', 'music']}" />

    <g:if test="${viewingSelf}">
      <p><h1>Borrowed Items</h1></p>
      <div id="borrowedItems" class="main">
        <div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="borrowedTabs">

          <!-- list for tab titles -->
          <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
            <g:each in="${item_categories}" var="category">
              <g:set var="ul_classes" value="ui-state-default ui-corner-top" />
              <g:if test="${category == 'all'}">
                <g:set var="ul_classes" value="ui-state-default ui-corner-top ui-tabs-selected ui-state-active" />
              </g:if>
              <li class="${ul_classes}"><a href="#borrowedTabs-${category}">${category.capitalize()}</a></li>
            </g:each>
          </ul>

          <g:each in="${item_categories}" var="category">
            <!-- create a hashmap of lists of items for this category
                 each item type gets its own list, even if there is only one item type -->
            <g:if test="${category == 'all'}">
              <g:set var="category_list" value="${borrowedItems}" />
            </g:if>
            <g:else>
              <g:set var="category_list" value='${[category: borrowedItems[category]]}' />
            </g:else>
            <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="borrowedTabs-${category}">
              <!-- check for empty categories -->
              <g:set var="empty_category" value="${true}" />
              <g:each in="${category_list}" var="category_list_entry">
                <g:if test="${category_list_entry.value.size() != 0}">
                  <g:set var="empty_category" value="${false}" />
                </g:if>
              </g:each>
              <g:if test="${empty_category == true}">
                <div class="noItems">There are no items in this category yet.</div>
              </g:if>
              <g:else>
                <table id="borrowedTabs-${category}-content" class="tablesorter">
                  <thead>
                    <tr>
                      <th class="library_all_col_available">Available &nbsp;&nbsp;&nbsp;&nbsp;</th>
                      <th class="library_all_col_media">Media &nbsp;&nbsp;&nbsp;&nbsp;</th>
                      <th class="library_all_col_title">Title &nbsp;&nbsp;&nbsp;&nbsp;</th>
                      <th class="library_all_col_owner">Owner &nbsp;&nbsp;&nbsp;&nbsp;</th>
                    </tr>
                  </thead>
                  <tbody class="library_table_body">
                    <g:each in="${category_list}" var="itemCategory">
                      <g:each in="${itemCategory.value}" var="item">
                        <tr>
                          <td>true</td>
                          <td align="center">
                            <g:set var="mediaImage" value="${item.mediaType}.png" />
                            <img height="20" width="20" src="${resource(dir:'images/icons',file:mediaImage)}" alt="${item.mediaType}" title="${item.mediaType}"/>
                          </td>
                          <td>${item.title}</td>
                          <td>${item.library.user.username}</td>
                        </tr>
                      </g:each>
                    </g:each>
                  </tbody>
                </table>
              </g:else>
            </div>
          </g:each>
        </div>
      </div>
		</g:if>

		<div class="clear"></div>
    <p><h1>Library for <g:link controller="user" action="profile" id="${user.id}">${user.username}</g:link></h1></p>
		
		<g:if test="${flash.message}">
			<div class="flash">${flash.message}</div>
		</g:if>

		<div id="allItems" class="main">
			<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="libTabs">

        <!-- list for tab titles -->
				<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
          <g:each in="${item_categories}" var="category">
            <g:set var="ul_classes" value="ui-state-default ui-corner-top" />
            <g:if test="${category == 'all'}">
              <g:set var="ul_classes" value="ui-state-default ui-corner-top ui-tabs-selected ui-state-active" />
            </g:if>
            <li class="${ul_classes}"><a href="#libTabs-${category}">${category.capitalize()}</a></li>
          </g:each>
				</ul>

        <g:each in="${item_categories}" var="category">
          <!-- create a hashmap of lists of items for this category
               each item type gets its own list, even if there is only one item type -->
          <g:if test="${category == 'all'}">
            <g:set var="category_list" value="${allItems}" />
          </g:if>
          <g:else>
            <g:set var="category_list" value='${[category: allItems[category]]}' />
          </g:else>
          <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="libTabs-${category}">
            <!-- check for empty categories -->
            <g:set var="empty_category" value="${true}" />
            <g:each in="${category_list}" var="category_list_entry">
              <g:if test="${category_list_entry.value.size() != 0}">
                <g:set var="empty_category" value="${false}" />
              </g:if>
            </g:each>
            <g:if test="${empty_category == true}">
              <div class="noItems">There are no items in this category yet.</div>
            </g:if>
            <g:else>
              <table id="libTabs-${category}-content" class="tablesorter">
                <thead>
                  <tr>
                    <th class="library_all_col_available">Available &nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th class="library_all_col_media">Media &nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th class="library_all_col_title">Title &nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <g:if test="${(category == 'music') || (category == 'all')}">
                      <th class="library_all_col_artist">Artist &nbsp;&nbsp;&nbsp;&nbsp;</th>
                    </g:if>
                    <g:if test="${(category == 'books') || (category == 'all')}">
                      <th class="library_all_col_author">Author &nbsp;&nbsp;&nbsp;&nbsp;</th>
                    </g:if>
                    <g:if test="${(category == 'albums') || (category == 'movies') || (category == 'all')}">
                      <th class="library_all_col_format">Format &nbsp;&nbsp;&nbsp;&nbsp;</th>
                    </g:if>
                    <g:if test="${(category == 'games') || (category == 'all')}">
                      <th class="library_all_col_platform">Platform &nbsp;&nbsp;&nbsp;&nbsp;</th>
                    </g:if>
                  </tr>
                </thead>
                <tbody class="library_table_body">
                  <g:each in="${category_list}" var="itemCategory">
                    <g:each in="${itemCategory.value}" var="item">
                      <tr>
                        <td align="center">
                          <g:render template="optionsPanel" model="['item':item,'viewingSelf':viewingSelf]"/>
                          
                        </td>
                        <td align="center">
                          <g:set var="mediaImage" value="${item.mediaType}.png" />
                          <img height="20" width="20" src="${resource(dir:'images/icons',file:mediaImage)}" alt="${item.mediaType}" title="${item.mediaType}"/>
                        </td>
                        <td>${item.title}</td>
                        <g:if test="${item.mediaType == 'album'}">
                          <td>${item.artist}</td>
                        </g:if>
                        <g:elseif test="${category == 'all'}">
                          <td>&nbsp;</td>
                        </g:elseif>
                        <g:if test="${item.mediaType == 'book'}">
                          <td>${item.author}</td>
                        </g:if>
                        <g:elseif test="${category == 'all'}">
                          <td>&nbsp;</td>
                        </g:elseif>
                        <g:if test="${(item.mediaType == 'album')||(item.mediaType == 'movie')}">
                          <td>${item.format}</td>
                        </g:if>
                        <g:elseif test="${category == 'all'}">
                          <td>&nbsp;</td>
                        </g:elseif>
                        <g:if test="${item.mediaType == 'game'}">
                          <td>${item.platform}</td>
                        </g:if>
                        <g:elseif test="${category == 'all'}">
                          <td>&nbsp;</td>
                        </g:elseif>
                      </tr>
                    </g:each>
                  </g:each>
                </tbody>
              </table>
            </g:else>
          </div>
        </g:each>
			</div>
		</div>

    <div class="clear"></div>

	</body>
</html>

