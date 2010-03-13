package com.friendlibrary

class User {
		String username
		String password
		String homepage
		Date dateCreated
		Profile profile
    static hasMany = [ items : Item, friends : User ]		

    static constraints = {
			username(size:3..20, unique:true)
			password(size:6..64)
			homepage(url: true, nullable: true)
			profile(nullable:true)
    }

		static mapping = {
			profile lazy:false
		}

		String toString(){
			"${username} (${id})"
		}
}
