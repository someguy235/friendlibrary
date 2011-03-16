package com.friendlibrary

class Library {

    static belongsTo = [ user:User ]
    
    static hasMany = [ books:Book, games:Game, albums:Album, movies:Movie ]
    HashMap available = ["book": 0, "game": 0, "album": 0, "movie": 0]
    int availableBooks=0
    int availableGames=0
    int availableAlbums=0
    int availableMovies=0
    
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
