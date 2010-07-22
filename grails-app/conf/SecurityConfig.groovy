security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true
	cacheUsers = false

	loginUserDomainClass = "com.friendlibrary.User"
	authorityDomainClass = "com.friendlibrary.Role"
	//requestMapClass = "Requestmap"
		
	userName = "username"
	password = "passwd"
		
	useRequestMapDomainClass = false
	
	//def role_user = new com.friendlibrary.Role(authority:"ROLE_USER",description:"User").save()
	//def defaultRole = role_user
	
	requestMapString = """\
	CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
	PATTERN_TYPE_APACHE_ANT
	/=IS_AUTHENTICATED_ANONYMOUSLY
	/captcha/**=IS_AUTHENTICATED_ANONYMOUSLY
	/css/**=IS_AUTHENTICATED_ANONYMOUSLY
	/images/**=IS_AUTHENTICATED_ANONYMOUSLY
	/index/**=IS_AUTHENTICATED_ANONYMOUSLY
	/item/library=IS_AUTHENTICATED_REMEMBERED
	/item/results=IS_AUTHENTICATED_REMEMBERED
	/item/search=IS_AUTHENTICATED_REMEMBERED
	/js/**=IS_AUTHENTICATED_ANONYMOUSLY
	/login/**=IS_AUTHENTICATED_ANONYMOUSLY
	/plugins/**=IS_AUTHENTICATED_ANONYMOUSLY
	/user/results=IS_AUTHENTICATED_REMEMBERED
	/user/search=IS_AUTHENTICATED_REMEMBERED
	/register/**=IS_AUTHENTICATED_ANONYMOUSLY
	/**=ROLE_ADMIN
	"""
}
