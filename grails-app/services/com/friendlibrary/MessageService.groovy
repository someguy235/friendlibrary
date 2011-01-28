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
	String itemRequest(params){
		def requestedUser = User.findByUsername(params.requestedUser)
		assert requestedUser != null
		def requestingUser = User.findByUsername(params.requestingUser)
		assert requestingUser != null
		def requestedItem = Item.get(params.requestedMedia)
		assert requestedItem != null
    def alreadyRequested = false
    Message.findAllBySentToAndSentFrom(requestedUser.username, requestingUser.username).each{
      if ((it.item == requestedItem)&&(it.type=="Item Request")){
        alreadyRequested = true
      }
    }
    if(!alreadyRequested){
      def requestMessage = new Message(
        sentFrom:params.requestingUser,
        sentTo:params.requestedUser,
        body:"${params.requestingUser} has asked to borrow the ${requestedItem.mediaType} \"${requestedItem.title}\" ",
        type:"Item Request",
        item:requestedItem
      )
      requestMessage.save(failOnError:true)
      def user = User.findByUsername(params.requestedUser)
      user.addToMessages(requestMessage)
      requestedItem.requested = true
      requestedItem.save(failOnError:true)
      return "success"
    }
    else{
      return "You have already requested that item."
    }
	}

  /*
  //Send a message requesting the return of a specific item
	*/
  void requestReturn(params){
		
	}

  /*
  // Remove a specific request for an item, leaving all others intact
  */
 //TODO: not tested, does this work at all?
	void removeRequest(params){
		def requestedItem = Item.get(params.requestedMedia)
    assert requestedItem != null
    def requestedUser = User.findByUsername(params.requestedUser)
    assert requestedUser != null
    def requestingUser = User.findByUsername(params.requestingUser)
    assert requestingUser != null
    // Assume that the item will be un-requested afterwards,
    //  but check as we walk through the messages
    def stillRequested = false
    (Message.findAllBySentToAndItem(requestedUser.username, requestedItem)).each{
      if(it.sentFrom == requestingUser.username){
        requestedUser.removeFromMessages(it)
        it.delete()
      }
      else{
        // If any request message exists from another user
        stillRequested = true
      }
      requestedItem.requested = stillRequested
    }
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
        it.delete()
      }
      requestedItem.requested = false
    }
  }

  /*
  //Confirm a request to borrow an item
  */
 void confirmItemRequest(params){
   def requestedItem = Item.get(params.requestedMedia)
   assert requestedItem != null
   def requestedUser = User.findByUsername(params.requestedUser)
   assert requestedUser != null
   def requestingUser = User.findByUsername(params.requestingUser)
   assert requestingUser != null
   def confirmMessage = new Message(
     sentFrom:requestedUser.username,
     sentTo:requestingUser.username,
     body:"${requestedUser.username} has agreed to laon you the ${requestedItem.mediaType} \
       \"${requestedItem.title}\", and will bring it to you soon",
      type:"Item Request Confirm",
      item:requestedItem
    )
    confirmMessage.save(failOnError:true)
    requestingUser.addToMessages(confirmMessage)
    requestedItem.loanedOut = true
    requestedItem.loanedTo = requestingUser
    requestedItem.save(failOnError:true)

    removeRequest(params)
  }

}
