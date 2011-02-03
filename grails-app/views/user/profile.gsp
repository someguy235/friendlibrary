<html>
	<head>
	   <title>FriendlyLibrary - Profile for ${user.username}</title>
	   <meta name="layout" content="main"/>
	   <g:javascript>
			$(function() {
				$("#messageTabs").tabs({ selected: 0 });
      	$("#messageTable").tablesorter( {sortList: [[0,0]]}  );
    	}); 
		</g:javascript>
	</head>
	<body>
		<h1>Profile for ${user.username}</h1>
		<div>
			<br />
			<hr></hr>
				<div class="profile_column profile_column_left">
				Info
				</div>
				<div class="profile_column profile_column_center">
				Library
				</div>
				<div class="profile_column profile_column_right">
				Social
				</div>
				<div class="clear"></div>
			<hr></hr>
			<br />
		</div>
		<div>
			<div class="profile_column profile_column_left">
				User: ${user.username}<br />
				Name: ${user.userFirstName} ${user.userLastName}<br />
				Email: ${user.email}<br />
				Joined: ${user.dateCreated.format('MM/dd/yy') }
			</div>
			<div class="profile_column profile_column_center">
				<div style="float:left;">
					<img height="20" width="20" src="${resource(dir:'images/icons',file:'game.png')}" alt="games" title="games"/>
				</div>
				<div style="height:20;" >
					&nbsp; <g:link controller="library" action="index" id="${user.username}">${user.library.availableGames} of ${user.library.games.size()} available</g:link>
				</div>
				<div style="float:left;">
					<img height="20" width="20" src="${resource(dir:'images/icons',file:'book.png')}" alt="books" title="books"/>
				</div>
				<div style="height:20;" >
					&nbsp; <g:link controller="library" action="index" id="${user.username}">${user.library.availableBooks} of ${user.library.books.size()} available</g:link>
				</div>
				<div style="float:left;">
					<img height="20" width="20" src="${resource(dir:'images/icons',file:'movie.png')}" alt="movies" title="movies"/>
				</div>
				<div style="height:20;" >
					&nbsp; <g:link controller="library" action="index" id="${user.username}">${user.library.availableMovies} of ${user.library.movies.size()} available</g:link>
				</div>
				<div style="float:left;">
					<img height="20" width="20" src="${resource(dir:'images/icons',file:'album.png')}" alt="albums" title="albums"/>
				</div>
				<div style="height:20;" >
					&nbsp; <g:link controller="library" action="index" id="${user.username}">${user.library.availableAlbums} of ${user.library.albums.size()} available</g:link>
				</div>
			</div>
			
			<div class="profile_column profile_column_right">
				${user.friends.size()} contacts:<br />
				<g:each in="${user.friends}" var="friend">
					<g:link controller="user" action="profile" id="${friend.username}">
						${friend.userFirstName} ${friend.userLastName}
					</g:link>
					(
					<g:link controller="library" action="index" id="${friend.username}">
						library
					</g:link>
					)
					<br />
				</g:each>
			</div>
			<div class="clear"></div>
		</div>
		<br />
		<br />
		<br />
		<g:if test="${viewingSelf}">
			<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="messageTabs">
				<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
					<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#messageTabs-received">Messages</a></li>
				</ul>
				<div class="ui-widget-content ui-corner-bottom" id="messageTabs-received">
					<table id="messageTable" class="tablesorter">
						<thead>
							<tr>
								<th style="width:10%;">From</th>
								<th style="width:15%;">Type</th>
								<th style="width:50%;">Message</th>
								<th style="width:20%;">Action</th>
							</tr>
						</thead>
						<tbody>
							<g:if test="${user.inMessages.size() == 0}">
								<tr><td align="center" colspan="4">You have no messages</td></tr>
							</g:if>
							<g:else>
								<g:each in="${user.inMessages}" var="message">
									<tr>
										<td><g:link controller="user" action="profile" id="${message.sentFrom.username}">${message.sentFrom.username}</g:link></td>
										<td>${message.type}</td>
										<td>${message.body}</td>
										<td>
                      <g:if test="${message.type == 'Item Request'}">
                        <g:set var="confirmAction" value="confirmItemRequest" />
                        <g:set var="confirmButtonText" value="Confirm" />
                        <g:set var="denyAction" value="removeRequest" />
                        <g:set var="denyButtonText" value="Deny" />
                      </g:if>
                      <g:elseif test="${message.type == 'Item Return Request'}">
                      </g:elseif>
                      <g:elseif test="${message.type == 'Friend Request'}">
                        <g:set var="confirmAction" value="confirmFriendRequest" />
                        <g:set var="confirmButtonText" value="Confirm" />
                        <g:set var="denyAction" value="denyFriendRequest" />
                        <g:set var="denyButtonText" value="Deny" />
                      </g:elseif>
                      <g:elseif test="${message.type == 'Item Request Confirm'}">
                        <g:set var="confirmAction" value="dismissMessage" />
                        <g:set var="confirmButtonText" value="Ok" />
                        <g:set var="denyAction" value="" />
                      </g:elseif>

                      <div id="action_buttons">
                        <div style="float:left;">
                          <g:form controller="message" action="${confirmAction}">
                            <input type="hidden" id="messageId" name="messageId" value="${message.id}" />
                            <input type="hidden" id="user" name="user" value="${user.id}" />
                            <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">${confirmButtonText}</span></button>
                          </g:form>
                        </div>
                        <g:if test="${denyAction != ''}">
                          <div>
                            <g:form controller="message" action="${denyRequest}">
                              <input type="hidden" id="messageId" name="messageId" value="${message.id}" />
                              <input type="hidden" id="user" name="user" value="${user.id}" />
                              <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">${denyButtonText}</span></button>
                            </g:form>
                          </div>
                        </g:if>
                      </div>
										</td>
									</tr>
								</g:each>
							</g:else>
						</tbody>
					</table>
				</div>
			</div>
		</g:if>
		<g:elseif test="${isFriend}">
			${user.userFirstName} is one of your contacts. 
			<g:form controller="message" action="removeFriend">
				<input type="hidden" id="requestingUserId" name="requestingUserId" value="${viewUser.id}" />
				<input type="hidden" id="requestedUserId" name="requestedUserId" value="${user.id}" />
				<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Remove Contact</span></button>
			</g:form>
		</g:elseif>
		<g:elseif test="${isFriendRequested}">
      <!--TODO: this doesn't work, need a new controller action-->
			You have requested ${user.userFirstName} as a contact (<g:link controller="message" action="removeRequest" requestedUser="${user.id}">cancel</g:link>).
		</g:elseif>
		<g:else>
			<g:form controller="message" action="friendRequest">
				<input type="hidden" id="requestingUserId" name="requestingUserId" value="${viewUser.id}" />
				<input type="hidden" id="requestedUserId" name="requestedUserId" value="${user.id}" />
				<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Contact</span></button>
			</g:form>
		</g:else>
	</body>
</html>