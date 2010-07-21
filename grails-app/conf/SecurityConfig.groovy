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
	
	requestMapString = """\
	CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
	PATTERN_TYPE_APACHE_ANT
	/=IS_AUTHENTICATED_ANONYMOUSLY
	/captcha/**=IS_AUTHENTICATED_ANONYMOUSLY
	/css/**=IS_AUTHENTICATED_ANONYMOUSLY
	/images/**=IS_AUTHENTICATED_ANONYMOUSLY
	/index/**=IS_AUTHENTICATED_ANONYMOUSLY
	/item/list=IS_AUTHENTICATED_ANONYMOUSLY
	/item/create=IS_AUTHENTICATED_ANONYMOUSLY
	/js/**=IS_AUTHENTICATED_ANONYMOUSLY
	/login/auth=IS_AUTHENTICATED_ANONYMOUSLY
	/login/**=IS_AUTHENTICATED_ANONYMOUSLY
	/plugins/**=IS_AUTHENTICATED_ANONYMOUSLY
	/user/create=IS_AUTHENTICATED_ANONYMOUSLY
	/user/**=IS_AUTHENTICATED_ANONYMOUSLY
	/register/**=IS_AUTHENTICATED_ANONYMOUSLY
	/**=IS_AUTHENTICATED_REMEMBERED
	"""
}
