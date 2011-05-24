class BootStrap {
  // include this line to encode password for ACEGI
  def authenticateService
	
  def init = { servletContext ->
    //create admin user
    def password = authenticateService.encodePassword("password")
    def superadmin = new com.friendlibrary.User(
      username:"admin",
      email:"email@example.com",
      userFirstName:"Ad",
      userLastName:"ministrator",
      passwd:password,
      enabled:true,
    ).save()
    

    password = authenticateService.encodePassword("catfood")
    def buster = new com.friendlibrary.User(
      username:"buster",
      email:"buster@example.com",
      userFirstName:"Buster",
      userLastName:"Cat",
      passwd:password,
      enabled:true,
    ).save()

    //create admin role
    def sudo = new com.friendlibrary.Role(authority:"ROLE_ADMIN",description:"Site Administrator")
    // now add the User to the role
    if (null != superadmin){
      superadmin.addToLibraries(new com.friendlibrary.Library(name:"owned"))
      superadmin.addToLibraries(new com.friendlibrary.Library(name:"borrowed"))
      sudo.addToPeople(superadmin)
      sudo.save()
    }

    def role_user = new com.friendlibrary.Role(authority:"ROLE_USER",description:"User").save()
    def defaultRole = role_user
    if (null != buster){
      buster.addToLibraries(new com.friendlibrary.Library(name:"owned"))
      buster.addToLibraries(new com.friendlibrary.Library(name:"borrowed"))
      role_user.addToPeople(buster)
      role_user.save()
    }
  }
  
  def destroy = { }
} 