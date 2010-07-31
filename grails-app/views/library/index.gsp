<html>
	<head>
		<title>
			Library for ${user.username}
		</title>
		<meta name="layout" content="main"/>
		
		<g:javascript>
			$(function() {
				$("#newTabs").tabs({ selected: 0 });
			
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
	
		<div >
			<g:if test="${viewingSelf}">
	  			<div id="newItem" class="main centered">
				<h2>Add an item to your library.</h2>
					<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="newTabs">
						<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
							<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#newTabs-game">Game</a></li>
							<li class="ui-state-default ui-corner-top"><a href="#newTabs-book">Book</a></li>
							<li class="ui-state-default ui-corner-top"><a href="#newTabs-movie">Movie</a></li>
							<li class="ui-state-default ui-corner-top"><a href="#newTabs-music">Music</a></li>
						</ul>
	
						<div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="newTabs-game">
							<g:form url="[controller:'item', action:'addItem'] id="${params.id}" mediaType="game">
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
	
						<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newTabs-book">
							<g:form action="addItem" id="${params.id}" mediaType="book">
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
	
						<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newTabs-movie">
							<g:form action="addItem" id="${params.id}" mediaType="movie">
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
						
						<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newTabs-music">
							<g:form action="addItem" id="${params.id}" mediaType="music">
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
												<g:select from="${formats}" value="DVD" name="format" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select>
											</div>
										</td>
									</tr>
								</table>
								<br />
								<input type="hidden" id="mediaType" name="mediaType" value="music" />
								<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
							</g:form>
						</div>
				</div>
			</div>
			
			<div id="importItems" class="main centered">
				<h2>Import a list of items. (placeholder)</h2>
				<g:form action="addItem" id="${params.id}">
					<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="newTabs">
						<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
							<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#newTabs-game">Games</a></li>
							<li class="ui-state-default ui-corner-top"><a href="#newTabs-book">Books</a></li>
							<li class="ui-state-default ui-corner-top"><a href="#newTabs-movie">Movies</a></li>
							<li class="ui-state-default ui-corner-top"><a href="#newTabs-movie">Music</a></li>
						</ul>
						<div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="newTabs-game">
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
						<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newTabs-book">
							<table>
								<tr>
									<td>test</td>
								</tr>
							</table>
							Phasellus mattis tincidunt nibh. Cras orci urna, blandit id, pretium vel, aliquet ornare, felis. Maecenas scelerisque sem non nisl. Fusce sed lorem in enim dictum bibendum.
						</div>
						<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newTabs-movie">
							Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.
						</div>
						<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newTabs-music">
							Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.
						</div>
					</div>
					<br />
					<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
				</g:form>
			
			</div>
			</g:if>
		</div>
		
		
		<div class="clear"></div>
		<br />
		<h1>Library for <g:link controller="user" action="profile" id="${user.username}">${user.username}</g:link></h1>
		<br />
		<g:if test="${flash.message}">
			<div class="flash">
				${flash.message}
			</div>
		</g:if>
		
		
		<div id="allItems" class="main">
			<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="libTabs">
				<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
					<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#libTabs-all">All</a></li>
					<li class="ui-state-default ui-corner-top"><a href="#libTabs-games">Games</a></li>
					<li class="ui-state-default ui-corner-top"><a href="#libTabs-books">Books</a></li>
					<li class="ui-state-default ui-corner-top"><a href="#libTabs-movies">Movies</a></li>
					<li class="ui-state-default ui-corner-top"><a href="#libTabs-music">Music</a></li>
				</ul>
				<g:form action="requestitem" id="${params.id}">
					<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="libTabs-all">
						<table id="libTabs-all-content" class="tablesorter">
							<thead>
								<tr>
									<g:if test="${!viewingSelf}">
										<th>Request Item &nbsp;&nbsp;&nbsp;&nbsp;</th>
									</g:if>
									<g:else>
										<th>Loaned Out &nbsp;&nbsp;&nbsp;&nbsp;</th>
									</g:else>
									<th>Media &nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th>Title &nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th>Artist &nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th>Author &nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th>Format &nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th>Platform &nbsp;&nbsp;&nbsp;&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${user.library.items}" var="itemCategory">
									<g:each in="${itemCategory}" var="item">
										<tr>
											<g:if test="${!viewingSelf}">
												<td align="center"><g:checkBox name="${item.title}"></g:checkBox></td>
											</g:if>
											<g:else>
												<td align="center">	
													<g:if test="${item.loanedOut == null}">
														<g:link title="Request this item be returned">
															<span class="ui-icon ui-icon-mail-closed"></span>
														</g:link>
													</g:if>
												</td>
											</g:else>
											<td>${item.mediaType}</td>
											<td>${item.title}</td>
											<td>${item.artist}</td>
											<td>${item.author}</td>
											<td>${item.format}</td>
											<td>${item.platform}</td>
										</tr>
									</g:each>
								</g:each>
							</tbody>
						</table>
						<g:if test="${!viewingSelf}">
							<div align="left">
								<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Request Items</span></button>
							</div>
						</g:if>
					</div>
					<div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="libTabs-games">
						<table id="libTabs-games-content" class="tablesorter">
							<thead>
								<tr>
									<g:if test="${!viewingSelf}">
										<th>Request Item &nbsp;&nbsp;&nbsp;&nbsp;</th>
									</g:if>
									<g:else>
										<th>Loaned Out &nbsp;&nbsp;&nbsp;&nbsp;</th>
									</g:else>
									<th>Title &nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th>Platform &nbsp;&nbsp;&nbsp;&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${user.library.games}" var="item">
										<tr>
											<g:if test="${!viewingSelf}">
												<td align="center"><g:checkBox name="${item.title}"></g:checkBox></td>
											</g:if>
											<g:else>
												<td align="center">	
													<g:if test="${item.loanedOut == null}">
														<g:link title="Request this item be returned">
															<span class="ui-icon ui-icon-mail-closed"></span>
														</g:link>
													</g:if>
												</td>
											</g:else>
											<td>${item.title}</td>
											<td>${item.platform}</td>
										</tr>
								</g:each>
							</tbody>
						</table>
						<g:if test="${!viewingSelf}">
							<div align="left">
								<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Request Items</span></button>
							</div>
						</g:if>
					</div>
					<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="libTabs-books">
						<table id="libTabs-books-content" class="tablesorter">
							<thead>
								<tr>
									<g:if test="${!viewingSelf}">
										<th>Request Item &nbsp;&nbsp;&nbsp;&nbsp;</th>
									</g:if>
									<g:else>
										<th>Loaned Out &nbsp;&nbsp;&nbsp;&nbsp;</th>
									</g:else>
									<th>Title &nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th>Author &nbsp;&nbsp;&nbsp;&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${user.library.books}" var="item">
										<tr>
											<g:if test="${!viewingSelf}">
												<td align="center"><g:checkBox name="${item.title}"></g:checkBox></td>
											</g:if>
											<g:else>
												<td align="center">	
													<g:if test="${item.loanedOut == null}">
														<g:link title="Request this item be returned">
															<span class="ui-icon ui-icon-mail-closed"></span>
														</g:link>
													</g:if>
												</td>
											</g:else>
											<td>${item.title}</td>
											<td>${item.author}</td>
										</tr>
								</g:each>
							</tbody>					
						</table>
						<g:if test="${!viewingSelf}">
							<div align="left">
								<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Request Items</span></button>
							</div>
						</g:if>
					</div>
					<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="libTabs-movies">
						<table id="libTabs-movies-content" class="tablesorter">
							<thead>
								<tr>
								<g:if test="${!viewingSelf}">
										<th>Request Item &nbsp;&nbsp;&nbsp;&nbsp;</th>
									</g:if>
									<g:else>
										<th>Loaned Out &nbsp;&nbsp;&nbsp;&nbsp;</th>
									</g:else>
									<th>Title &nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th>Format &nbsp;&nbsp;&nbsp;&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${user.library.movies}" var="item">
										<tr>
											<g:if test="${!viewingSelf}">
												<td align="center"><g:checkBox name="${item.title}"></g:checkBox></td>
											</g:if>
											<g:else>
												<td align="center">	
													<g:if test="${item.loanedOut == null}">
														<g:link title="Request this item be returned">
															<span class="ui-icon ui-icon-mail-closed"></span>
														</g:link>
													</g:if>
												</td>
											</g:else>
											<td>${item.title}</td>
											<td>${item.format}</td>
										</tr>
								</g:each>
							</tbody>
						</table>
						<g:if test="${!viewingSelf}">
							<div align="left">
								<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Request Items</span></button>
							</div>
						</g:if>
					</div>
					<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="libTabs-music">
						<table id="libTabs-music-content" class="tablesorter">
							<thead>
								<tr>
									<g:if test="${!viewingSelf}">
										<th>Request Item &nbsp;&nbsp;&nbsp;&nbsp;</th>
									</g:if>
									<g:else>
										<th>Loaned Out &nbsp;&nbsp;&nbsp;&nbsp;</th>
									</g:else>
									<th>Title &nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th>Artist &nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th>Format &nbsp;&nbsp;&nbsp;&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${user.library.albums}" var="item">
										<tr>
											<g:if test="${!viewingSelf}">
												<td align="center"><g:checkBox name="${item.title}"></g:checkBox></td>
											</g:if>
											<g:else>
												<td align="center">	
													<g:if test="${item.loanedOut == null}">
														<g:link title="Request this item be returned">
															<span class="ui-icon ui-icon-mail-closed"></span>
														</g:link>
													</g:if>
												</td>
											</g:else>
											<td>${item.title}</td>
											<td>${item.artist}</td>
											<td>${item.format}</td>
										</tr>
								</g:each>
							</tbody>
						</table>
						<g:if test="${!viewingSelf}">
							<div align="left">
								<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Request Items</span></button>
							</div>
						</g:if>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>

