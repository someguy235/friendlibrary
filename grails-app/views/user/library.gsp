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
                          <!-- options panel -->
                          <div id="item_options-${item.id}" class="library_item_options" title="${item.title}">
                            <g:set var="needConfirmItemRequestForm" value="false" />
                            <g:if test="${item.loanedOut == true}">
                              <g:set var="item_status_message" value="this item is loaned out" />
                              <g:set var="buttonColor" value="red" />
                              <g:if test="${viewingSelf}">
                                <g:set var="item_status_message" value="this item is loaned out to ${item.loanedTo.username}" />
                                <g:set var="formAction" value="requestItemReturn" />
                                <g:set var="buttonTitle" value="request this item be returned" />
                              </g:if>
                              <g:else>
                                <g:if test="${item.loanedTo.id == viewUser.id}">
                                  <g:set var="formAction" value="" />
                                  <g:set var="buttonTitle" value="you have this item" />
                                </g:if>
                                <g:else>
                                  <g:set var="formAction" value="makeItemRequest" />
                                  <g:set var="buttonTitle" value="request this item when it is returned" />
                                </g:else>
                              </g:else>
                            </g:if>
                            <g:elseif test="${item.reserved == true}">
                              <g:set var="item_status_message" value="this item is reserved" />
                              <g:set var="buttonColor" value="yellow" />
                              <g:if test="${viewingSelf}">
                                <g:set var="formAction" value="removeItemRequest" />
                                <g:set var="buttonTitle" value="remove reserved status from this item" />
                              </g:if>
                              <g:else>
                                <g:set var="formAction" value="makeItemRequest" />
                                <g:set var="buttonTitle" value="request this item when it is available" />
                              </g:else>
                            </g:elseif>
                            <g:elseif test="${item.requestQueue.size()}">
                              <g:set var="item_status_message" value="this item has been requested" />
                              <g:set var="buttonColor" value="yellow" />
                              <g:if test="${viewingSelf}">
                                <g:set var="needConfirmItemRequestForm" value="true" />
                                <g:set var="formAction" value="removeAllItemRequests" />
                                <g:set var="buttonTitle" value="remove all requests from this item" />
                              </g:if>
                              <g:else>
                                <g:if test="${item.requestQueue.contains(viewUser.id)}">
                                  <g:set var="formAction" value="removeItemRequest" />
                                  <g:set var="buttonTitle" value="remove your request for this item" />
                                </g:if>
                                <g:else>
                                  <g:set var="formAction" value="itemRequest" />
                                  <g:set var="buttonTitle" value="request this item when it is returned" />
                                </g:else>
                              </g:else>
                            </g:elseif>
                            <g:else> <!-- item is available -->
                              <g:set var="item_status_message" value="this item is available" />
                              <g:set var="buttonColor" value="green" />
                              <g:if test="${viewingSelf}">
                                <g:set var="formAction" value="makeItemRequest" />
                                <g:set var="buttonTitle" value="place a hold on this item" />
                              </g:if>
                              <g:else>
                                <g:set var="formAction" value="makeItemRequest" />
                                <g:set var="buttonTitle" value="request this item" />
                              </g:else>
                            </g:else>
                            <g:set var="buttonImage" value="${buttonColor}light.png" />
                            <div class="library_item_status">
                              ${item_status_message}
                            </div>
                            <g:if test="${needConfirmItemRequestForm == 'true'}">
                              <div class="library_item_option">
                                <g:form controller="message" action="confirmItemRequest">
                                  <input type="hidden" id="requestingUser" name="requestingUser" value="${item.requestQueue[0]}" />
                                  <input type="hidden" id="requestedUser" name="requestedUser" value="${user.id}" />
                                  <input type="hidden" id="requestedMedia" name="requestedMedia" value="${item.id}" />
                                  <button aria-disabled="false" role="button" id="button" title="${buttonTitle}">
                                    <img height="15" width="15" src="${resource(dir:'images/icons',file:"greenlight.png")}" />
                                  </button>
                                  mark this item as delivered
                                </g:form>
                              </div>
                            </g:if>
                            <div class="library_item_option">
                              <g:form controller="message" action="${formAction}">
                                <input type="hidden" id="requestingUser" name="requestingUser" value="${viewUser.id}" />
                                <input type="hidden" id="requestedUser" name="requestedUser" value="${user.id}" />
                                <input type="hidden" id="requestedMedia" name="requestedMedia" value="${item.id}" />
                                <button aria-disabled="false" role="button" id="button" title="${buttonTitle}">
                                  <img height="15" width="15" src="${resource(dir:'images/icons',file:buttonImage)}" />
                                </button>
                                ${buttonTitle}
                              </g:form>
                            </div>
                            <g:if test="${viewingSelf}">
                              <div class="library_item_option">
                                <g:form controller="item" action="deleteItem" id="${user.id}">
                                  <input type="hidden" id="requestedMedia" name="requestedMedia" value="${item.id}" />
                                  <button aria-disabled="false" role="button" id="button" title="delete item">
                                    <img height="15" width="15" src="${resource(dir:'images/icons',file:"delete.png")}" />
                                  </button>
                                  delete this item
                                </g:form>
                              </div>
                            </g:if>
                          </div>
                          <button class="option_button" id="option_button-${item.id}" title="options">
                            <img height="15" width="15" src="${resource(dir:'images/icons',file:buttonImage)}" />
                          </button>
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

