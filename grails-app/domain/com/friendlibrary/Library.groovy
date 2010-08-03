package com.friendlibrary

class Library {

    static belongsTo = [ user:User ]
    
    static hasMany = [ books:Book, games:Game, albums:Album, movies:Movie ]
	//Set books = []
	//Set games = []
	//Set albums = []
	//Set movies = []
	//def allItems = [2,3,4]
	//def allItems = [(this.books as List)]
	//List allItems = [this.books, this.games, this.albums, this.movies] 
	
    static constraints = {
    }
}
