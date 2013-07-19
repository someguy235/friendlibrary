//security {
//
//	// see DefaultSecurityConfig.groovy for all settable/overridable properties
//
//	active = true
//	cacheUsers = false
//
//	loginUserDomainClass = "com.friendlibrary.User"
//	authorityDomainClass = "com.friendlibrary.Role"
//	//requestMapClass = "Requestmap"
//		
//	userName = "username"
//	password = "passwd"
//		
//	useRequestMapDomainClass = false
//	
//	//def role_user = new com.friendlibrary.Role(authority:"ROLE_USER",description:"User").save()
//	//def defaultRole = role_user
//	
//	requestMapString = """\
//	CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
//	PATTERN_TYPE_APACHE_ANT
//	/=IS_AUTHENTICATED_ANONYMOUSLY
//	/captcha/**=IS_AUTHENTICATED_ANONYMOUSLY
//	/css/**=IS_AUTHENTICATED_ANONYMOUSLY
//	/images/**=IS_AUTHENTICATED_ANONYMOUSLY
//	/index/**=IS_AUTHENTICATED_ANONYMOUSLY
//	/index/index=IS_AUTHENTICATED_ANONYMOUSLY
//  /item/additem/**=IS_AUTHENTICATED_REMEMBERED
//  /item/edititem/**=IS_AUTHENTICATED_REMEMBERED
//  /item/library=IS_AUTHENTICATED_REMEMBERED
//	/item/results=IS_AUTHENTICATED_REMEMBERED
//	/item/search=IS_AUTHENTICATED_REMEMBERED
//	/js/**=IS_AUTHENTICATED_ANONYMOUSLY
//	/library/index/**=IS_AUTHENTICATED_REMEMBERED
//	/login/**=IS_AUTHENTICATED_ANONYMOUSLY
//	/login/auth=IS_AUTHENTICATED_ANONYMOUSLY
//	/logout/**=IS_AUTHENTICATED_ANONYMOUSLY
//	/message/**=IS_AUTHENTICATED_REMEMBERED
//	/plugins/**=IS_AUTHENTICATED_ANONYMOUSLY
//  /user/library/**=IS_AUTHENTICATED_REMEMBERED
//	/user/profile/**=IS_AUTHENTICATED_REMEMBERED
//	/user/results=IS_AUTHENTICATED_REMEMBERED
//	/register/**=IS_AUTHENTICATED_ANONYMOUSLY
//	/search=IS_AUTHENTICATED_ANONYMOUSLY
//	/**=ROLE_ADMIN
//	"""
//}