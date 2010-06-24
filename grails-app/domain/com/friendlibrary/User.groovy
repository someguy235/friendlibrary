package com.friendlibrary

class User {
		String username
		String password
		String userFullName
		boolean enabled
		//String homepage
		//Date dateCreated
		//Profile profile
    static hasMany = [ authorities:Role, items:Item, friends:User ]
    static belongsTo = Role

    static constraints = {
			username(size:3..20, unique:true)
			password(size:6..64)
			userFullName(size:0..64)
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
