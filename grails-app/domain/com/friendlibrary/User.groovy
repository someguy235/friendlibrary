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
	
	static hasMany = [ authorities:Role, friends:User, messages:Message ]
    static belongsTo = Role

    static constraints = {
		username(size:3..30, unique:true)
		passwd(size:6..64)
		email(nullable:false, blank:true)
		userFirstName(size:0..64, nullable:true, blank:true)
		userLastName(size:0..64, nullable:true, blank:true)
    }

	static mapping = {
	}

	String toString(){
		"${username}"
	}
}
