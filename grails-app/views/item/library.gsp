<html>
	<head>
		<title>
			Library for ${user.profile.fullName}
		</title>
		<meta name="layout" content="main"/>
	</head>
	<body>
  	<h1>Have something to add to your library?</h1>
			<div id="newItem">
				<g:form action="addItem" id="${params.id}">
					<table>
						<tr>
							<td><label for="itemDescription">Item Description</label></td>
							<td><g:textField id="itemDescription" name="itemDescription"/></td>
						</tr>
						<tr>
							<td><label for="mediaType">Media Type</label></td>
							<td><g:textField id="mediaType" name="mediaType"/></td>
						</tr>
						<tr>
							<td><label for="platform">Platform</label></td>
							<td><g:textField id="platform" name="platform"/></td>
						</tr>
						<tr>
							<td><label for="format">Format</label></td>
							<td><g:textField id="format" name="format"/></td>
						</tr>
						<tr>
							<td><label for="title">Title</label></td>
							<td><g:textField id="title" name="title"/></td>
						</tr>
					</table>
				<g:submitButton name="post" value="Add"/>
			</g:form>
		</div>
		<h1>Library for ${user.profile.fullName}</h1>
			<g:if test="${flash.message}">
				<div class="flash">
					${flash.message}
				</div>
			</g:if>
		<div class="allItems">
			<g:each in="${user.items}" var="item">
				<div class="itemEntry">
					<div class="itemText">
						${item.itemDescription}
					</div>
					<div class="itemDate">
						${item.mediaType} : ${item.title} - ${item.platform}
					</div>
				</div>
			</g:each>
		</div>
	</body>
</html>

