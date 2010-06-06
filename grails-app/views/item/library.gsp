<html>
	<head>
		<title>
			Library for ${user.profile.fullName}
		</title>
		<meta name="layout" content="main"/>
		<g:javascript>
			$(function() {
				$("#newTabs").tabs({ selected: 0 });
			});
			$(function() {
				$("#libTabs").tabs({ selected: 0 });
			});
		</g:javascript>
	</head>
	<body>
		<div >
  	<div id="newItem" class="main centered">
			<h2>Have something to add to your library?</h2>
				<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="newTabs">
					<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
						<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#newTabs-game">Game</a></li>
						<li class="ui-state-default ui-corner-top"><a href="#newTabs-book">Book</a></li>
						<li class="ui-state-default ui-corner-top"><a href="#newTabs-movie">Movie</a></li>
						<li class="ui-state-default ui-corner-top"><a href="#newTabs-music">Music</a></li>
					</ul>

					<div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="newTabs-game">
						<g:form action="addItem" id="${params.id}" mediaType="game">
							<table>
								<tr>
									<td><label for="title">Title&nbsp</label></td>
									<td><g:textField id="title" name="title"/></td>
								</tr>
								<tr>
									<g:set var="platforms" value="${['PS3', 'XBox360', 'Wii']}" />
									<td><label for="platform">Platform&nbsp</label></td>
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
									<td><label for="title">Title&nbsp</label></td>
									<td><g:textField id="title" name="title"/></td>
								</tr>
								<tr>
									<td><label for="author">Author&nbsp</label></td>
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
									<td><label for="title">Title&nbsp</label></td>
									<td><g:textField id="title" name="title"/></td>
								</tr>
								<tr>
									<g:set var="formats" value="${['DVD', 'BlueRay', 'VHS', 'File']}" />
									<td><label for="format">Format&nbsp</label></td>
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
									<td><label for="title">Title&nbsp</label></td>
									<td><g:textField id="title" name="title"/></td>
								</tr>
								<tr>
									<td><label for="artist">Artist&nbsp</label></td>
									<td><g:textField id="artist" name="artist"/></td>
								</tr>
								<tr>
									<g:set var="formats" value="${['File', 'CD']}" />
									<td><label for="format">Format&nbsp</label></td>
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
			<h2>Import items</h2>
			<g:form action="addItem" id="${params.id}">
				<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="newTabs">
					<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
						<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#newTabs-game">Game</a></li>
						<li class="ui-state-default ui-corner-top"><a href="#newTabs-book">Book</a></li>
						<li class="ui-state-default ui-corner-top"><a href="#newTabs-movie">Movie</a></li>
						<li class="ui-state-default ui-corner-top"><a href="#newTabs-movie">Music</a></li>
					</ul>
					<div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="newTabs-game">
						<table>
							<tr>
								<g:set var="platforms" value="${['PS3', 'XBox360', 'Wii']}" />
								<td><label for="platform">Platform&nbsp</label></td>
								<td>
								<div class="ui-widget">
									<g:select from="${platforms}" value="PS3" name="platform" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select>
								</div>
								</td>
							</tr>
							<tr>
								<td><label for="title">Title&nbsp</label></td>
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
		</div>
		<div class="clear"></div>
		<br />
		<h1>Library for ${user.profile.fullName}</h1>
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
				<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="libTabs-all">
					<table>
						<g:each in="${user.items}" var="item">
							<div class="itemEntry">
								<tr>
									<td>${item.mediaType}&nbsp&nbsp</td>
									<td>${item.title}&nbsp&nbsp</td>
									<td>${item.platform}</td>
								</tr>
							</div>
						</g:each>
					</table>
				</div>
				<div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="libTabs-games">
					<table>
						<tr>
							<td><h2>Title&nbsp&nbsp</h2></td>
							<td><h2>Platform</h2></td>
						</tr>
						<g:each in="${user.items}" var="item">
							<g:if test="${item.mediaType == 'game'}">
								<div class="itemEntry">
									<tr>
										<td>${item.title}&nbsp&nbsp</td>
										<td>${item.platform}</td>
									</tr>
								</div>
							</g:if>
						</g:each>
					</table>
				</div>
				<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="libTabs-books">
					<table>
						<tr>
							<td><h2>Title&nbsp&nbsp</h2></td>
							<td><h2>Author</h2></td>
						</tr>
						<g:each in="${user.items}" var="item">
							<g:if test="${item.mediaType == 'book'}">
								<div class="itemEntry">
									<tr>
										<td>${item.title}&nbsp&nbsp</td>
										<td>${item.author}</td>
									</tr>
								</div>
							</g:if>
						</g:each>
					</table>
				</div>
				<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="libTabs-movies">
					<table>
						<tr>
							<td><h2>Title&nbsp&nbsp</h2></td>
							<td><h2>Format</h2></td>
						</tr>
						<g:each in="${user.items}" var="item">
							<g:if test="${item.mediaType == 'movie'}">
								<div class="itemEntry">
									<tr>
										<td>${item.title}&nbsp&nbsp</td>
										<td>${item.format}</td>
									</tr>
								</div>
							</g:if>
						</g:each>
					</table>
				</div>
				<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="libTabs-music">
					<table>
						<tr>
							<td><h2>Title&nbsp&nbsp</h2></td>
							<td><h2>Artist&nbsp&nbsp</h2></td>
							<td><h2>Format</h2></td>
						</tr>
						<g:each in="${user.items}" var="item">
							<g:if test="${item.mediaType == 'music'}">
								<div class="itemEntry">
									<tr>
										<td>${item.title}&nbsp&nbsp</td>
										<td>${item.artist}&nbsp&nbsp</td>
										<td>${item.format}</td>
									</tr>
								</div>
							</g:if>
						</g:each>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>

