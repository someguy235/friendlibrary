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
				1 of 1 games available<br />
				1 of 1 books available<br />
				1 of 1 movies available<br />
				1 of 1 albums available<br />
			</div>
			<div class="profile_column profile_column_right">
				3 contacts:<br />
				one<br />
				two<br />
				three<br />
			</div>
			<div class="clear"></div>
		</div>
	</body>
</html>