class BootStrap {
	// include this line to encode password for ACEGI
	def authenticateService 
	
	def init = { servletContext ->
		//create admin user
	    def password = authenticateService.encodePassword("password") 
	    //if (null == User.findByUsername("admin").id){
	    	def superadmin = new com.friendlibrary.User(
		    		username:"admin",
		    		email:"email@example.com",
		    		userFirstName:"Ad",
		    		userLastName:"ministrator",
		    		passwd:password,
		    		enabled:true,
		    		library:new com.friendlibrary.Library()
		    	).save()
			//superadmin
	    	//create admin role
		    def sudo = new com.friendlibrary.Role(authority:"ROLE_ADMIN",description:"Site Administrator")
			// now add the User to the role
	    	if (null != superadmin){
	    		//superadmin.library = library
			    
	    		sudo.addToPeople(superadmin)
	    		sudo.save()
	    	}
			def role_user = new com.friendlibrary.Role(authority:"ROLE_USER",description:"User").save()
			def defaultRole = role_user
		
			//}
	
	 }
	 def destroy = {
	 }

} 