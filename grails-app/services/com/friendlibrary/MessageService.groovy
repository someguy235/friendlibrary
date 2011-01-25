package com.friendlibrary

//class MessageException extends RuntimeException{
//	String messageString
//	Message message
//}

/*
//Provide services for messages
*/
class MessageService {

  boolean transactional = true

  /*
  //Sends a friend request message from one user to another
  */
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

  /*
  //Confirm a submitted friend request
  */
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

  /*
  //Ignore a submitted friend request, removes request message from profile
  */
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

  /*
  //Unfriend
  */
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

  /*
  //Send an item request message to the item-owning user and
  //mark the item as 'requested'
  */
	void itemRequest(params){
		def requestedUser = User.findByUsername(params.requestedUser)
		assert requestedUser != null
		def requestingUser = User.findByUsername(params.requestingUser)
		assert requestingUser != null
		def requestedItem = Item.get(params.requestedMedia)
		assert requestedItem != null
		def requestMessage = new Message(
			sentFrom:params.requestingUser, 
			sentTo:params.requestedUser, 
			body:"${params.requestingUser} has asked to borrow the ${requestedItem.mediaType} \"${requestedItem.title}\" ", 
			type:"Item Request",
      item:requestedItem
		)
		requestMessage.save(failOnError:true)
		def user = User.findByUsername(params.requestedUser)
    //if(not already requested){
      user.addToMessages(requestMessage)
      requestedItem.requested = true
      requestedItem.save(failOnError:true)
    //}
	}

  /*
  //Send a message requesting the return of a specific item
	*/
  void requestReturn(params){
		
	}

  /*
  //Remove a specific request for an item, leaving all others intact
  */
	void removeRequest(params){
		//def requestedItem = Item.get(params.requestedMedia)
		//assert requestedItem != null



		//requestedItem.requested = false
	}

  /*
  //Removes all requests for an item and marks it as available
  */
  void removeAllRequests(params){
    def requestedItem = Item.get(params.requestedMedia)
    assert requestedItem != null
    def requestedUser = User.findByUsername(params.requestedUser)
    assert requestedUser != null
    (Message.findAllBySentTo(requestedUser.username)).each{
      if(it.item == requestedItem){
        requestedUser.removeFromMessages(it)
      }
      requestedItem.requested = false
    }
  }
}
