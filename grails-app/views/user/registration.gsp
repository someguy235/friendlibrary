<html>
	<head>
		<title>Register New User</title>
		<meta name="layout" content="main"/>
	</head>
	<body>
	<formset>
		<legend>Register New User</legend>
		<g:hasErrors>
			<div class="errors">
				<g:renderErrors bean="${user}" as="list" />
			</div>
		</g:hasErrors>
		<g:form action="register">
			<dl>
				<dt>Username</dt>
				<dd><g:textField name="username" value="${user?.username}"/></dd>
				<dt>Password</dt>
				<dd><g:passwordField name="password" value="${user?.password}"/></dd>
				<dt>Full Name</dt>
				<dd><g:textField name="profile.fullName" value="${user?.profile?.fullName}"/></dd>
				<dt>Bio</dt>
				<dd><g:textArea name="profile.bio" value="${user?.profile?.bio}"/></dd>
				<dt>Email</dt>
				<dd><g:textField name="profile.email" value="${user?.profile?.email}"/></dd>
				<dt><g:submitButton name="register" value="Register"/></dt>
			</dl>
		</g:form>
		</formset>
	</body>
</html>

