package com.friendlibrary

class ItemException extends RuntimeException{
	String message
	Item item
}

class ItemService{
	boolean transactional = true
	void addItem(params){
		def user = User.get(params.id)
		def library = user?.library
		if(library){
			def item
			switch(params.mediaType){
				case "album":
					item = new Album(artist:params.artist, genre:params.genre, format:params.format)
					library.availableAlbums+=1
					break
				case "book":
					item = new Book(title:params.title, author:params.author)
					library.availableBooks+=1
					break
				case "game":
					item = new Game(platform:params.platform)
					library.availableGames+=1
					break
				case "movie":
					item = new Movie(format:params.format)
					library.availableMovies+=1
					break
				default:
					throw new ItemException(message: "Invalid item type", item:item)
			}
			item.title = params.title 
			item.library = library
			item.save(failOnError:true)
			if(library.save(failOnError:true)){
				return
			}else{
				throw new ItemException(message: "Invalid or empty item", item:item)
			}
		}
		throw new ItemException(message:"Item Exception: Invalid Username")
	}
}
