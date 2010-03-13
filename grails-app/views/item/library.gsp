<html>
	<head>
		<title>
			Library for ${user.profile.fullName}
		</title>
		<meta name="layout" content="main"/>
	</head>
	<body>
		<h1>Library for ${user.profile.fullName}</h1>
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

