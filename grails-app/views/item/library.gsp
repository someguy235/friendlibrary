<html>
	<head>
		<title>
			Library for ${user.profile.fullName}
		</title>
		<meta name="layout" content="main"/>
	</head>
	<body>
		<div id="newItem">
    	<h1>Have something to add to your library?</h1>
		  <p>
				<g:form action="addItem" id="${params.id}">
					<label for="itemDescription">Item Description</label>
					<g:textField id="itemDescription" name="itemDescription"/> 
					<label for="mediaType">Media Type</label>
					<g:textField id="mediaType" name="mediaType"/>
					<label for="platform">Platform</label>
					<g:textField id="platform" name="platform"/>
					<label for="format">Format</label>
					<g:textField id="format" name="format"/> 
					<label for="title">Title</label>
					<g:textField id="title" name="title"/> <br />
					<g:submitButton name="post" value="Add"/>
				</g:form>
			</p>
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

