package com.friendlibrary

//class MessageException extends RuntimeException{
//	String messageString
//	Message message
//}

class MessageService {

    boolean transactional = true
	
	void friendRequest(params){
		def requestMessage = new Message(
			sentFrom:params.requestingUser, 
			sentTo:params.requestedUser, 
			body:"You have a new friend request from ${params.requestingUser}", 
			type:"Friend Request"
		)
		requestMessage.save(failOnError:true)
		def user = User.findByUsername(params.requestedUser)
		user.addToMessages(requestMessage)
	}
	
	void confirmFriendRequest(params){
		def requestedUser = User.findByUsername(params.requestedUser)
		assert requestedUser != null 
		def requestingUser = User.findByUsername(params.requestingUser)
		assert requestingUser != null
		requestedUser.addToFriends(requestingUser)
		requestingUser.addToFriends(requestedUser)
		def message = requestedUser.messages.find{
			(it.type == 'Friend Request')&&
			(it.sentFrom == params.requestingUser)
		}
		assert message != null
		requestedUser.removeFromMessages(message)
		message.delete()
	}
	void denyFriendRequest(params){
		def requestedUser = User.findByUsername(params.requestedUser)
		assert requestedUser != null
		def requestingUser = User.findByUsername(params.requestingUser)
		assert requestingUser != null
		//requestedUser.addToFriends(requestingUser)
		//requestingUser.addToFriends(requestedUser)
		def message = requestedUser.messages.find{
			(it.type == 'Friend Request')&&
			(it.sentFrom == params.requestingUser)
		}
		assert message != null
		requestedUser.removeFromMessages(message)
		message.delete()
		
	}
	void removeFriend(params){
		def requestedUser = User.findByUsername(params.requestedUser)
		assert requestedUser != null
		def requestingUser = User.findByUsername(params.requestingUser)
		assert requestingUser != null
		requestedUser.removeFromFriends(requestingUser)
		requestingUser.removeFromFriends(requestedUser)
		//def message = requestedUser.messages.find{
		//	(it.type == 'Friend Request')&&
		//	(it.sentFrom == params.requestingUser)
		//}
		//assert message != null
		//requestedUser.removeFromMessages(message)
		//message.delete()
	}
	void itemRequest(params){
		def requestedUser = User.findByUsername(params.requestedUser)
		assert requestedUser != null
		def requestingUser = User.findByUsername(params.requestingUser)
		assert requestingUser != null
		def requestedItem = Item.get(1)
		assert requestedItem != null
		def requestMessage = new Message(
			sentFrom:params.requestingUser, 
			sentTo:params.requestedUser, 
			body:"${params.requestingUser} has asked to borrow the ${requestedItem.mediaType} \"${requestedItem.title}\" ", 
			type:"Item Request"
		)
		requestMessage.save(failOnError:true)
		def user = User.findByUsername(params.requestedUser)
		user.addToMessages(requestMessage)
		requestedItem.requested = true
		requestedItem.save(failOnError:true)
		
	}
}
