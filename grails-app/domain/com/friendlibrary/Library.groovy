package com.friendlibrary

class Library {

    static belongsTo = [ user:User ]
    
	//static hasMany = [ items:Item ]
    static hasMany = [ books:Book, games:Game, albums:Album, movies:Movie ]
	
	def items = [books, games, albums, movies]
	
    static constraints = {
    }

    
}
