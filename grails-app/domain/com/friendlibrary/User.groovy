package com.friendlibrary

class User {

	transient springSecurityService

	String username
	String password
  //String passwd
  String email
  String userFirstName
  String userLastName
  
  Date dateCreated
  
  com.friendlibrary.Library library
  
  static hasMany = [ authorities:Role, friends:User, inMessages:Message, outMessages:Message ]
  static mappedBy = [inMessages:"sentTo", outMessages:"sentFrom"]
  
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		//username blank: false, unique: true
		//password blank: false
    username(size:3..30, nullable:false, unique:true)
    password(size:6..64, nullable:false)
    email(nullable:false, blank:true)
    dateCreated(nullable:true)
    userFirstName(size:0..64, nullable:true, blank:true)
    userLastName(size:0..64, nullable:true, blank:true)
    library(nullable:false)
	}

	static mapping = {
		password column: '`password`'
    
    // this resolves an issue with domain class names conflicting with sql reserved words
    table 'my_user'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
  
  String toString(){
    "${username}"
  }
}
