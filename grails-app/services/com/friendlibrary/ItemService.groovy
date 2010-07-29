package com.friendlibrary


class ItemException extends RuntimeException{
	String message
	Item item
}

class ItemService{
	boolean transactional = true
	void addItem(params){
		assert params.title != null
		def user = User.findByUsername(params.id)
		def library = user.library
		assert user != null
		if(library){
			def item = new Item(itemDescription:params.itemDescription, 
					mediaType:params.mediaType, 
					title:params.title, 
					format:params.format, 
					author:params.author, 
					platform:params.platform,
					artist:params.artist,
					genre:params.genre,
					requested:false,
					reserved:false,
					loanedOut:false,
					library:library).save(failOnError:true)
			if(library.save(failOnError:true)){
				return
			}else{
				throw new ItemException(message: "Invalid or empty item", item:item)
			}
		}
		throw new ItemException(message:"Item Exception: Invalid Username")
	}
}
