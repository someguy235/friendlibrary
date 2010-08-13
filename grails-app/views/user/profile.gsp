<html>
	<head>
	   <title>FriendlyLibrary - Profile for ${params.id}</title>
	   <meta name="layout" content="main"/>
	   <g:javascript>
			$(function() {
				$("#messageTabs").tabs({ selected: 0 });
      	$("#inMessageTabs").tablesorter( {sortList: [[1,0],[2,0]]} );
      	$("#outMessageTabs").tablesorter( {sortList: [[1,0],[2,0]]} );
    	}); 
		</g:javascript>
	</head>
	<body>
		<h1>Profile for ${params.id}</h1>
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
				Name: ${user.userFirstName} ${user.userLastName.getAt(0)}.<br />
				Email: ${user.email}<br />
				Joined: ${user.dateCreated.format('MM/dd/yy') }
			</div>
			<div class="profile_column profile_column_center">
				${user.library.games.size()} games<br />
				${user.library.books.size()} books<br />
				${user.library.movies.size()} movies<br />
				${user.library.albums.size()} albums<br />
			</div>
			<div class="profile_column profile_column_right">
				${user.friends.size()} contacts:<br />
				<g:each in="${user.friends}" var="friend">
					<g:link controller="user" action="profile" id="${friend.id}">
						${friend.userFirstName} ${friend.userLastName.getAt(0)}
					</g:link>
					<g:link controller="library" action="index" id="${friend.id}">
						(library)
					</g:link>
					<br />
				</g:each>
			</div>
			<div class="clear"></div>
		</div>
		<g:if test="${viewingSelf}">
			<br />
			<br />
			<br />
			<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="messageTabs">
				<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
					<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#messageTabs-received">Received</a></li>
					<li class="ui-state-default ui-corner-top"><a href="#messageTabs-sent">Sent</a></li>
				</ul>
				<div class="ui-widget-content ui-corner-bottom" id="messageTabs-received">
					<table id="inMessages-table" class="tablesorter">
						<thead>
							<tr>
								<th style="width:10%;">Type</th>
								<th style="width:80%;">Message</th>
								<th style="width:10%;">Action</th>
							</tr>
						</thead>
						<tbody>
							<g:if test="${user.inMessages.size() == 0}">
								<tr><td colspan="3">You have no messages</td></tr>
							</g:if>
							<g:else>
								<g:each in="${user.inMessages}" var="message">
									<tr>
										<td>${message.type}</td>
										<td>${message.body}</td>
										<td>placeholder</td>
									</tr>
								</g:each>
							</g:else>
						</tbody>
					</table>
				</div>
				<div class="ui-widget-content ui-corner-bottom" id="messageTabs-sent">
					<table id="outMessages-table" class="tablesorter">
						<thead>
							<tr>
								<th style="width:10%;">Type</th>
								<th style="width:80%;">Message</th>
								<th style="width:10%;">Action</th>
							</tr>
						</thead>
						<tbody>
							<g:if test="${user.outMessages.size() == 0}">
								<tr><td colspan="3">You have sent no messages</td></tr>
							</g:if>
							<g:else>
								<g:each in="${user.outMessages}" var="message">
									<tr>
										<td>${message.type}</td>
										<td>${message.body}</td>
										<td>placeholder</td>
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
		</g:elseif>
		<g:elseif test="${isFriendRequested}">
			You have requested this person as a contact.
		</g:elseif>
		<g:else>
			<g:form controler="message" action="friendRequest">
				<input type="hidden" id="requestingUser" name="requestingUser" value="${viewUser}" />
				<input type="hidden" id="requestedUser" name="requestedUser" value="${user}" />
				<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Contact</span></button>
			</g:form>
		</g:else>
	</body>
</html>