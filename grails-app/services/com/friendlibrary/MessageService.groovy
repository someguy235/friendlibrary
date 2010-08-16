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
		def requestingUser = User.findByUsername(params.requestingUser)
		requestedUser.addToFriends(requestingUser)
		requestingUser.addToFriends(requestedUser)
		for(message in requestedUser.messages){
			if((message.type == 'Friend Request')&&(message.sentFrom == params.requestingUser)){
				requestedUser.removeFromMessages(message)
				//message.delete()
			}
		}
		
		
	}
}
