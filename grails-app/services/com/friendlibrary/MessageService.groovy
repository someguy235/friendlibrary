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
	String makeItemRequest(params){
		def requestedUser = User.get(params.requestedUser)
		assert requestedUser != null
		def requestingUser = User.get(params.requestingUser)
		assert requestingUser != null
		def requestedItem = Item.get(params.requestedMedia)
		assert requestedItem != null
    def alreadyRequested = requestedItem.requestQueue.contains(requestingUser.id)

    //Self-requests mark the item as reserved
    if(requestingUser == requestedUser){
      requestedItem.reserved = true
      return "${requestedItem.title} item is now reserved"
    }
    else{
      if(!alreadyRequested){
        def requestMessage = new Message(
          sentFrom:requestingUser,
          sentTo:requestedUser,
          body:"${requestingUser.username} has asked to borrow the ${requestedItem.mediaType} \"${requestedItem.title}\" ",
          type:"Item Request",
          item:requestedItem
        )
        requestMessage.save(failOnError:true)
        requestedUser.addToInMessages(requestMessage)
        requestingUser.addToOutMessages(requestMessage)
        requestedItem.requestQueue.push(requestingUser.id)
        requestedItem.save(failOnError:true)
        return "success"
      }
      else{
        return "You have already requested that item."
      }
    }
	}

  /*
  // Deny a specific request for an item, leaving all others intact
  */
	void denyItemRequest(params){
    def message = Message.get(params.messageId)
    assert message != null
    message.item.requestQueue.remove(message.sentFrom.id)
    message.delete()
	}

  /*
  // Remove a request for an item
  */
  void removeItemRequest(params){
    if(params.requestingUser == params.requestedUser){
      Item.get(params.requestedMedia).reserved = false
    }
    else{
      def message = Message.find("from Message as m where \
                                    m.sentFrom = ${params.requestingUser} and \
                                    m.sentTo = ${params.requestedUser} and \
                                    m.item = ${params.requestedMedia}")
      assert message != null
      message.item.requestQueue.remove(message.sentFrom.id)
      message.delete()
    }
  }
  
  /*
  //Removes all requests for an item and marks it as available
  */
  void removeAllItemRequests(params){
    def messages = Message.findAll("from Message as m where \
                                    m.sentFrom = ${params.requestedUser} and \
                                    m.item = ${params.requestedMedia}")
    messages.each{
      params.requestedMedia.requestQueue.remove(it.sentFrom.id)
      it.delete()
    }
  }

  /*
  //Send a message requesting the return of a specific item
	*/
  void requestItemReturn(params){
		
	}

  /*
  //Confirm a request to borrow an item
  */
 void confirmItemRequest(params){
   System.out.println(params.messageId)
   def message = Message.get(params.messageId)
   assert message != null
   def requestedItem = message.item
   assert requestedItem != null
   def requestedUser = message.sentTo
   assert requestedUser != null
   def requestingUser = message.sentFrom
   assert requestingUser != null
   def confirmMessage = new Message(
     sentFrom:requestedUser,
     sentTo:requestingUser,
     body:"${requestedUser.username} has loaned you the ${requestedItem.mediaType} \
       \"${requestedItem.title}\". ",
      type:"Item Request Confirm",
      item:requestedItem
    )
    confirmMessage.save(failOnError:true)
    requestingUser.addToInMessages(confirmMessage)
    requestedUser.addToOutMessages(confirmMessage)
    requestedItem.loanedOut = true
    requestedItem.loanedTo = requestingUser
    requestedItem.save(failOnError:true)

    message.item.requestQueue.remove(message.sentFrom.id)
    message.delete()
  }

  /*
  //Removes a notification message from a user
  */
  void dismissMessage(params){
    def message = Message.get(params.messageId)
    assert message != null
    message.delete()
  }

}
