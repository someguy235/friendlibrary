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
	void makeFriendRequest(params){
    def requestedUser = User.get(params.requestedUserId)
    assert requestedUser != null
    def requestingUser = User.get(params.requestingUserId)
    assert requestingUser != null
		def requestMessage = new Message(
			sentFrom: requestingUser,
			sentTo: requestedUser,
			body:"You have a new friend request from ${requestingUser.username}",
			type:"Friend Request"
		)
		requestMessage.save(failOnError:true)
		requestedUser.addToInMessages(requestMessage)
    requestingUser.addToOutMessages(requestMessage)
	}

  /*
  // Cancel a previously submitted friend request
  */
  void removeFriendRequest(params){
    def requestedUser = User.get(params.requestedUserId)
    assert requestedUser != null
    def requestingUser = User.get(params.requestingUserId)
    assert requestingUser != null
    def message = requestedUser.inMessages.find{
			(it.type == 'Friend Request')&&
			(it.sentFrom == requestingUser)
		}
		assert message != null
		requestedUser.removeFromInMessages(message)
    requestingUser.removeFromOutMessages(message)
		message.delete()
  }
  
  /*
  //Ignore a submitted friend request, removes request message from profile
  */
	void denyFriendRequest(params){
    def message = Message.get(params.messageId)
    assert message != null
    assert message.sentFrom != null
    assert message.sentTo != null
    message.delete()
	}

  /*
  //Confirm a submitted friend request
  */
	void confirmFriendRequest(params){
    def message = Message.get(params.messageId)
    assert message != null
    assert message.sentFrom != null
    assert message.sentTo != null
    message.sentFrom.addToFriends(message.sentTo)
    message.sentTo.addToFriends(message.sentFrom)
		message.delete()
	}
  
  /*
  //Unfriend
  */
	void removeFriend(params){
		def requestedUser = User.get(params.requestedUserId)
		assert requestedUser != null
		def requestingUser = User.get(params.requestingUserId)
		assert requestingUser != null
		requestedUser.removeFromFriends(requestingUser)
		requestingUser.removeFromFriends(requestedUser)
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
	void removeRequest(messageId){
    def message = Message.get(messageId)
    assert message != null
		//def requestedItem = Item.get(params.requestedMedia)
    def requestedItem = message.item
    assert requestedItem != null
    //def requestedUser = User.findByUsername(params.requestedUser)
    def requestedUser = message.sentTo
    assert requestedUser != null
    //def requestingUser = User.findByUsername(params.requestingUser)
    def requestingUser = message.sentFrom
    assert requestingUser != null
    // Assume that the item will be un-requested afterwards,
    //  but check as we walk through the messages
    def stillRequested = false
    (Message.findAllBySentToAndItem(requestedUser, requestedItem)).each{
      if(it.sentFrom == requestingUser){
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
   //def requestedItem = Item.get(params.requestedMedia)
   System.out.println(params.messageId)
   def message = Message.get(params.messageId)
   assert message != null
   System.out.println(message.item.id)
   //def requestedItem = Item.get(message.item.id)
   def requestedItem = message.item
   assert requestedItem != null
   def requestedUser = User.findByUsername(params.requestedUser)
   assert requestedUser != null
   def requestingUser = User.findByUsername(params.requestingUser)
   assert requestingUser != null
   def confirmMessage = new Message(
     sentFrom:requestedUser.username,
     sentTo:requestingUser.username,
     body:"${requestedUser.username} has agreed to loan you the ${requestedItem.mediaType} \
       \"${requestedItem.title}\", and will bring it to you soon",
      type:"Item Request Confirm",
      item:requestedItem
    )
    confirmMessage.save(failOnError:true)
    requestingUser.addToMessages(confirmMessage)
    requestedItem.loanedOut = true
    requestedItem.loanedTo = requestingUser
    requestedItem.save(failOnError:true)

    removeRequest(params.messageId)
  }

  /*
  //Removes a notification message from a user
  */
  void dismissMessage(params){
    def messgae = Message.get(params.messageId)
    assert message != null
    user = User.findByUsername(message.sentTo)
    assert requestedUser != null
    user.removeFromMessages(message)
    message.delete()
  }

}
