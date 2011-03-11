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
          show: "blind",
          hide: "blind"
        });

        $( ".option_button" ).click(function() {
          var id = $(this).attr("id");
          id = id.substring(id.indexOf("-")+1);
          $( '#item_options-'+id+'' ).dialog( "open" );
          return false;
        });

				$("#newItemTabs").tabs({ selected: 0 });
        $("#newItemListTabs").tabs({ selected: 0 });
				$("#libTabs").tabs({ selected: 0 });
      	$("#libTabs-all-content").tablesorter( {sortList: [[1,0],[2,0]]      } ); 
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
	  		<div id="newItem" class="main centered">
					<h2>Add an item to your library.</h2>
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
			
			<div id="importItems" class="main centered">
				<h2>Import a list of items.</h2>
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
								<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
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
            <li class="ui-state-default ui-corner-top"><a href="#libTabs-${category}">${category.capitalize()}</a></li>
          </g:each>
				</ul>

        <g:each in="${item_categories}" var="category">
          <!-- create a hashmap of lists of items for this category
               each item type gets its own list, even if there is only one item type -->
          <g:if test="${category == 'all'}">
            <g:set var="category_list" value="${allItems}" />
          </g:if>
          <g:else>
            <g:set var="category_list" value="${[ allItems[category] ]}" />
          </g:else>

          <g:each in="${category_list}" var="itemCategory">







          </g:each>

        </g:each>
        
			</div>
		</div>
	</body>
</html>

