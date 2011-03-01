package com.friendlibrary

//class ItemException extends RuntimeException{
//	String message
//	Item item
//}

class ItemService{

	boolean transactional = true

  //
  // Add a single item to a user's library
  //
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

  void addList(params){
    def f = params['file']
    def id = params['id']
    
    if(!f.empty) {
      def is = f.getInputStream()
      def rl = is.readLines()
      def tkns
      rl.each{e ->
        tkns = e.split(',')
        println "${tkns[2]}: ${tkns[1]}"
      }
    }
    else {
      println 'file cannot be empty'
    }
  }
}
