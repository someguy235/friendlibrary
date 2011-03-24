<html>
	<head>
		<title>
			Library for ${user.username}
		</title>

    <meta name="layout" content="main"/>
    
		<g:javascript>
      $.fx.speeds._default = 250;
			$(function() {
        $( ".item_options" ).dialog({
          autoOpen: false,
          modal: true
        });

        $( ".option_button" ).click(function() {
          var id = $(this).attr("id");
          id = id.substring(id.indexOf("-")+1);
          $( '#item_options-'+id+'' ).dialog( "open" );
          return false;
        });

        $(".accordion").accordion({ header: "h2" });
        $(".accordion").last().accordion("option", "icons", false);

				$("#newItemTabs").tabs({ selected: 0 });
        $("#newItemListTabs").tabs({ selected: 0 });
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
	  		<div class="import_box grid_6">
					<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="newItemTabs">
						<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
							<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#newItemTabs-game">Game</a></li>
							<li class="ui-state-default ui-corner-top"><a href="#newItemTabs-book">Book</a></li>
							<li class="ui-state-default ui-corner-top"><a href="#newItemTabs-movie">Movie</a></li>
							<li class="ui-state-default ui-corner-top"><a href="#newItemTabs-music">Music</a></li>
						</ul>
	
						<div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="newItemTabs-game">
							<g:form controller="item" action="addItem" id="${user.id}">
								<table>
									<tr>
										<td><label for="title">Title&nbsp;</label></td>
										<td><g:textField id="title" name="title"/></td>
									</tr>
									<tr>
										<g:set var="platforms" value="${['PS3', 'XBox360', 'Wii']}" />
										<td><label for="platform">Platform&nbsp;</label></td>
										<td>
											<div class="ui-widget">
												<g:select from="${platforms}" value="PS3" name="platform" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select>
											</div>
										</td>
									</tr>
								</table>
								<br />
								<input type="hidden" id="mediaType" name="mediaType" value="game" />
								<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
							</g:form>
						</div>
	
						<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemTabs-book">
							<g:form controller="item" action="addItem" id="${user.id}">
								<table>
									<tr>
										<td><label for="title">Title&nbsp;</label></td>
										<td><g:textField id="title" name="title"/></td>
									</tr>
									<tr>
										<td><label for="author">Author&nbsp;</label></td>
										<td><g:textField id="author" name="author"/></td>
									</tr>
								</table>
								<br />
								<input type="hidden" id="mediaType" name="mediaType" value="book" />
								<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
							</g:form>
						</div>
	
						<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemTabs-movie">
							<g:form controller="item" action="addItem" id="${user.id}">
								<table>
									<tr>
										<td><label for="title">Title&nbsp;</label></td>
										<td><g:textField id="title" name="title"/></td>
									</tr>
									<tr>
										<g:set var="formats" value="${['DVD', 'BlueRay', 'VHS', 'File']}" />
										<td><label for="format">Format&nbsp;</label></td>
										<td>
											<div class="ui-widget">
												<g:select from="${formats}" value="DVD" name="format" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select>
											</div>
										</td>
									</tr>
								</table>
								<br />
								<input type="hidden" id="mediaType" name="mediaType" value="movie" />
								<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
							</g:form>
						</div>
						
						<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemTabs-music">
							<g:form controller="item" action="addItem" id="${user.id}">
								<table>
									<tr>
										<td><label for="title">Title&nbsp;</label></td>
										<td><g:textField id="title" name="title"/></td>
									</tr>
									<tr>
										<td><label for="artist">Artist&nbsp;</label></td>
										<td><g:textField id="artist" name="artist"/></td>
									</tr>
									<tr>
										<g:set var="formats" value="${['File', 'CD']}" />
										<td><label for="format">Format&nbsp;</label></td>
										<td>
											<div class="ui-widget">
												<g:select from="${formats}" value="File" name="format" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select>
											</div>
										</td>
									</tr>
								</table>
								<br />
								<input type="hidden" id="mediaType" name="mediaType" value="album" />
								<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
							</g:form>
						</div>
				</div>
			</div>
			
			<div class="import_box grid_6">
        <div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="newItemListTabs">
          <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
            <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#newItemListTabs-game">Games</a></li>
            <li class="ui-state-default ui-corner-top"><a href="#newItemListTabs-book">Books</a></li>
            <li class="ui-state-default ui-corner-top"><a href="#newItemListTabs-movie">Movies</a></li>
            <li class="ui-state-default ui-corner-top"><a href="#newItemListTabs-movie">Music</a></li>
          </ul>
          <div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="newItemListTabs-game">
            <table>
              <tr>
                <g:set var="platforms" value="${['PS3', 'XBox360', 'Wii']}" />
                <td><label for="platform">Platform&nbsp;</label></td>
                <td>
                <div class="ui-widget">
                  <g:select from="${platforms}" value="PS3" name="platform" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select>
                </div>
                </td>
              </tr>
              <tr>
                <td><label for="title">Title&nbsp;</label></td>
                <td><g:textField id="title" name="title"/></td>
              </tr>
            </table>
          </div>
          <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemListTabs-book">
            <g:form controller="item" action="addItemList" id="${user.id}">
              <table>
                <tr>
                  <g:set var="source" value="${['GoodReads', 'CSV']}" />
                  <td><label for="source">Source&nbsp;</label></td>
                  <td>
                    <div class="ui-widget">
                      <g:select from="${source}" value="GoodReads" name="source" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td><label for="remoteUserId">User Id&nbsp;</label></td>
                  <td><g:textField id="remoteUserId" name="remoteUserId"/></td>
                </tr>
              </table>
              <br />
              <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Import List</span></button>
            </g:form>
          </div>
          <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemListTabs-movie">
            Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.
          </div>
          <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemListTabs-music">
            Nam dui erat, auctor a, dignissim quis, entesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.
          </div>
        </div>
        <br />
			</div>
			</g:if>
		</div>
		
		<div class="clear"></div>
		
    <p><h1>Library for <g:link controller="user" action="profile" id="${user.id}">${user.username}</g:link></h1></p>
		
		<g:if test="${flash.message}">
			<div class="flash">${flash.message}</div>
		</g:if>

    <g:set var="item_categories" value="${['all', 'games', 'books', 'movies', 'music']}" />
    
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
                          <div id="item_options-${item.id}" class="item_options" title="${item.title}">
                            <g:if test="${item.loanedOut == true}">
                              <g:set var="item_status_message" value="this item is loaned out" />
                              <g:set var="buttonColor" value="red" />
                              <g:if test="${viewingSelf}">
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
	</body>
</html>

