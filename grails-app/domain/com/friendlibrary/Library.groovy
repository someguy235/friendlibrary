package com.friendlibrary

class Library {

    static belongsTo = [ user:User ]
    
	//static hasMany = [ items:Item ]
    static hasMany = [ books:Book, games:Game, albums:Album, movies:Movie ]
	//Set books = new HashSet()
	//Set games = new HashSet()
	//Set albums = new HashSet()
	//Set movies = new HashSet()
	def items = [books, games, albums, movies]
	
    static constraints = {
    }

    
}
