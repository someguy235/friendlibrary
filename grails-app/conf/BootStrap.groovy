class BootStrap {

  def springSecurityService
	
  def init = { servletContext ->
    //create admin user
    if (!com.friendlibrary.User.findByUsername("admin")){
      def password = springSecurityService.encodePassword("password")
      password = "password"
      def superadmin = new com.friendlibrary.User(
        username:"admin",
        email:"email@example.com",
        userFirstName:"Ad",
        userLastName:"ministrator",
        password:password,
        enabled:true,
        library:new com.friendlibrary.Library()
      ).save(flush: true, failOnError:true)
      
      //password = springSecurityService.encodePassword("catfood")
      password = "catfood"
      def buster = new com.friendlibrary.User(
        username:"buster",
        email:"buster@example.com",
        userFirstName:"Buster",
        userLastName:"Cat",
        password:password,
        enabled:true,
        library:new com.friendlibrary.Library()
      ).save(flush: true, failOnError:true)
      
//      def id = com.friendlibrary.User.findByUsername("buster").id
//      println id
//      def user = com.friendlibrary.User.get(id)
//      println user
//      def lib = user.library
//      println lib
      //create admin role
      def sudo = new com.friendlibrary.Role(authority:"ROLE_ADMIN",description:"Site Administrator").save()
      // now add the User to the role
      if (null != superadmin){
        //def roleUser = com.friendlibrary.Role.findByAuthority('ROLE_ADMIN')
        com.friendlibrary.UserRole.create(superadmin, sudo)
        //sudo.addToPeople(superadmin)
        //sudo.save()
      }
        
      def role_user = new com.friendlibrary.Role(authority:"ROLE_USER",description:"User").save()
      //def defaultRole = role_user
      if (null != buster){
        com.friendlibrary.UserRole.create(buster, role_user)
        //role_user.addToPeople(buster)
        //role_user.save()
      }
      
    }
//    def id = com.friendlibrary.User.findByUsername("buster").id
//    println id
//    def user = com.friendlibrary.User.get(id)
//    println user
//    def lib = user.library
//    println lib
//    println(com.friendlibrary.User.findByUsername("buster").id)
  }
  
  def destroy = {
  }
}
