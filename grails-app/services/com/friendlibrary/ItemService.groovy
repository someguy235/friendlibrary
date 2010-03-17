package com.friendlibrary


class ItemException extends RuntimeException{
	String message
	Item item
}

class ItemService{
	boolean transactional = true
	Item addItem(String, username, String itemDescription, String mediaType, String title, String format, String author, String platform){
		def user = User.findByUsername(username)
		if(user){
			def item = new Item(itemDescription:itemDescription, mediaType:mediaType, title:title, format:format, author:author, platform:platform)
			user.addToItem(item)
			if(user.save()){
				return item
			}else{
				throw new ItemException(message: "Invalid or empty item", item:item)
			}
		}
		throw new ItemException(message:"Invalid Username")
	}
}

//def serviceMethod() {
//}
