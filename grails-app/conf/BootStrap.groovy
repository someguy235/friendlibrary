class BootStrap {
	// include this line to encode password for ACEGI
	def authenticateService 
	
	def init = { servletContext ->
		//create admin user
	    def password = authenticateService.encodePassword("password") 
	    //if (null == User.findByUsername("admin").id){
		    def superadmin = new com.friendlibrary.User(
		    		username:"admin",
		    		userFullName:"Administrator",
		    		password:password,
		    		enabled:true,
		    	).save()
		
		    //create admin role
		    def sudo = new com.friendlibrary.Role(authority:"ROLE_ADMIN",description:"Site Administrator")
		    // now add the User to the role
	    	if (null != superadmin){
	    		sudo.addToPeople(superadmin)
	    		sudo.save()
	    		new com.friendlibrary.Role(authority:"ROLE_USER",description:"User").save()
	    	}
		//}
	
	 }
	 def destroy = {
	 }

} 