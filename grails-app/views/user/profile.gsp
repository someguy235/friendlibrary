<html>
	<head>
	   <title>FriendlyLibrary - Profile for ${params.id}</title>
	   <meta name="layout" content="main"/>
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
				3 contacts:<br />
				one<br />
				two<br />
				three<br />
			</div>
			<div class="clear"></div>
		</div>
		<!-- TODO: if viewingself check here -->
		<br />
		
		<div class="ui-widget-content ui-corner-bottom" id="messages">
			<table id="messages-table" class="tablesorter">
				<thead>
					<tr>
						<th style="width:10%;">Type</th>
						<th style="width:80%;">Message</th>
						<th style="width:10%;">Action</th>
					</tr>
				</thead>
				<tbody>
					<g:if test="${user.messages.size() == 0}">
						<tr><td colspan="3">You have no messages</td></tr>
					</g:if>
					<g:else>
						<g:each in="${user.messages}" var="message">
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
	</body>
</html>