<html>
	<head>
		<title>
			Library for ${user.username}
		</title>

    <meta name="layout" content="main"/>
    
		<g:javascript>
      $.fx.speeds._default = 250;

      $(function() {

        $(".edit_panel").dialog({
          autoOpen: false,
          show: "blind",
          hide: "blind"
        });
        
        $("#newItemTabs").tabs({ selected: 0 });
        $("#newItemListTabs").tabs({ selected: 0 });
        
        $("#borrowedTabs").tabs({ selected: 0 });
        $("#libTabs").tabs({ selected: 0 });

        <g:each in="${itemCategories}" var="category">
          $("#borrowedTabs-${category}-content").tablesorter( {sortList: [[1,0],[2,0]]} );
          $("#libTabs-${category}-content").tablesorter( {sortList: [[1,0],[2,0]]} );
        </g:each>
      	
    	});

      function edit_panel(itemId){
        $( '#edit_panel-'+itemId+'' ).dialog( "open" );
        return false;
      };
      
		</g:javascript>
	</head>
	<body>
    <g:if test="${flash.message}">
			<div class="flash">${flash.message}</div>
		</g:if>
    
		<div > <!-- interface for adding items -->
			<g:if test="${viewingSelf}">
        <g:render template="addItem" model="['gamePlatforms':gamePlatforms]" />
        <g:render template="addItemList" />
			</g:if>
		</div>
		<div class="clear"></div>

    <g:if test="${viewingSelf}">
      <p><h1>Borrowed Items</h1></p>
      <div id="borrowedItems" class="main">
        <div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="borrowedTabs">

          <!-- list for tab titles -->
          <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
            <g:each in="${itemCategories}" var="category">
              <g:set var="ul_classes" value="ui-state-default ui-corner-top" />
              <g:if test="${category == 'all'}">
                <g:set var="ul_classes" value="ui-state-default ui-corner-top ui-tabs-selected ui-state-active" />
              </g:if>
              <li class="${ul_classes}"><a href="#borrowedTabs-${category}">${category.capitalize()}</a></li>
            </g:each>
          </ul>

          <!-- create a hashmap of lists of items for this category
            each item type gets its own list, even if there is only one item type -->
          <g:each in="${itemCategories}" var="category">
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
		
		<div id="allItems" class="main">
			<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="libTabs">

        <!-- list for tab titles -->
				<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
          <g:each in="${itemCategories}" var="category">
            <g:set var="ul_classes" value="ui-state-default ui-corner-top" />
            <g:if test="${category == 'all'}">
              <g:set var="ul_classes" value="ui-state-default ui-corner-top ui-tabs-selected ui-state-active" />
            </g:if>
            <li class="${ul_classes}"><a href="#libTabs-${category}">${category.capitalize()}</a></li>
          </g:each>
				</ul>

        <!-- create a hashmap of lists of items for this category
          each item type gets its own list, even if there is only one item type -->
        <g:each in="${itemCategories}" var="category">
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
                        <td align="center" class="lib_table_options">
                          <g:render template="optionsPanel" model="['item':item,'viewingSelf':viewingSelf]"/>
                          <g:render template="editPanel" model="['item':item,'viewingSelf':viewingSelf]"/>
                        </td>
                        <td align="center" class="lib_table_media">
                          <g:set var="mediaImage" value="${item.mediaType}.png" />
                          <img height="20" width="20" src="${resource(dir:'images/icons',file:mediaImage)}" alt="${item.mediaType}" title="${item.mediaType}"/>
                        </td>
                        <td class="lib_table_title">
                          <div id="item_title_${item.id}">
                            ${item.title}
                          </div>
                        </td>
                        <g:if test="${item.mediaType == 'album'}">
                          <td class="lib_table_artist">${item.artist}</td>
                        </g:if>
                        <g:elseif test="${category == 'all'}">
                          <td class="lib_table_artist">&nbsp;</td>
                        </g:elseif>
                        <g:if test="${item.mediaType == 'book'}">
                          <td class="lib_table_author">${item.author}</td>
                        </g:if>
                        <g:elseif test="${category == 'all'}">
                          <td class="lib_table_author">&nbsp;</td>
                        </g:elseif>
                        <g:if test="${(item.mediaType == 'album')||(item.mediaType == 'movie')}">
                          <td class="lib_table_format">${item.format}</td>
                        </g:if>
                        <g:elseif test="${category == 'all'}">
                          <td class="lib_table_format">&nbsp;</td>
                        </g:elseif>
                        <g:if test="${item.mediaType == 'game'}">
                          <td class="lib_table_platform">${item.platform}</td>
                        </g:if>
                        <g:elseif test="${category == 'all'}">
                          <td class="lib_table_platform">&nbsp;</td>
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

