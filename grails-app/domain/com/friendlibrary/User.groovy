package com.friendlibrary

class User {
	String username
	String passwd
	//String userFullName
	boolean enabled
	
	String email
	String userRealName
	
	boolean emailShow = false
	//String homepage
	//Date dateCreated
	//Profile profile
    static hasMany = [ authorities:Role, items:Item, friends:User ]
    static belongsTo = Role

    static constraints = {
		username(size:3..20, unique:true)
		passwd(size:6..64)
		userRealName(size:0..64, nullable:true, blank:true)
		email(nullable:true, blank:true)
		//homepage(url: true, nullable: true)
		//profile(nullable:true)
    }

	static mapping = {
		//profile lazy:false
	}

	String toString(){
		"${username} (${id})"
	}
}
