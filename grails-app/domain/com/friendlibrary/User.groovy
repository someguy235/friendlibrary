package com.friendlibrary

class User {
  boolean enabled
	
  String username
  String passwd
  String email
  Date dateCreated
		
  String userFirstName
  String userLastName
	
  Library library
	
  static hasMany = [ authorities:Role, friends:User, inMessages:Message, outMessages:Message ]
  static mappedBy = [inMessages:"sentTo", outMessages:"sentFrom"]
  static belongsTo = Role

  static constraints = {
    username(size:3..30, nullable:false, unique:true)
    passwd(size:6..64, nullable:false)
    email(nullable:false, blank:true)
    dateCreated(nullable:true)
    userFirstName(size:0..64, nullable:true, blank:true)
    userLastName(size:0..64, nullable:true, blank:true)
    library(nullable:false)
  }

  static mapping = {  }

  String toString(){
    "${username}"
  }
}
