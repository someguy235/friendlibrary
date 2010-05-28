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
		assert user != null
		if(user){
			def item = new Item(itemDescription:params.itemDescription, 
					mediaType:params.mediaType, 
					title:params.title, 
					format:params.format, 
					author:params.author, 
					platform:params.platform,
					user:user).save(failOnError:true)
			if(user.save(failOnError:true)){
				return
			}else{
				throw new ItemException(message: "Invalid or empty item", item:item)
			}
		}
		throw new ItemException(message:"Item Exception: Invalid Username")
	}
}
