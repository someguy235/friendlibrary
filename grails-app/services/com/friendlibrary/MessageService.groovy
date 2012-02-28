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

  /*******************************/
  // User-related service actions
  /*******************************/

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
  // Can use a message, or two user id's as params
  */
  void removeFriendRequest(params){
    def requestedUser
    def requestingUser
    def message

    if(params.messageId != null){
      message = Message.get(params.messageId)
      requestedUser = message.sentTo
      requestingUser = message.sentFrom
    }else{
      requestedUser = User.get(params.requestedUserId)
      requestingUser = User.get(params.requestingUserId)
      message = Message.find("from Message as m where \
                                m.sentFrom = :sentFrom and \
                                m.sentTo = :sentTo and \
                                m.type = :type",
                                [sentFrom:requestingUser, sentTo:requestedUser, type:"Friend Request"]
                            )
    }
		message.delete()
  }
  
  /*
  // Confirm a submitted friend request
  // Can use a message, or two user id's as params
  */
	void confirmFriendRequest(params){
    def requestingUser
    def requestedUser
    def message

    if(params.messageId != null){
      message = Message.get(params.messageId)
      requestingUser = message.sentFrom
      requestedUser = message.sentTo
    }else{
      requestingUser = User.get(params.requestingUserId)
      requestedUser = User.get(params.requestedUserId)

      message = Message.find("from Message as m where \
                                m.sentFrom = :sentFrom and \
                                m.sentTo = :sentTo and \
                                m.type = :type",
                                [sentFrom:requestingUser, sentTo:requestedUser, type:"Friend Request"]
                            )
    }

    requestingUser.addToFriends(requestedUser)
    requestedUser.addToFriends(requestingUser)
    message.delete()
	}
  
  /*
  // Unfriend
  */
	void removeFriend(params){
		def requestedUser = User.get(params.requestedUserId)
		assert requestedUser != null
		def requestingUser = User.get(params.requestingUserId)
		assert requestingUser != null
		requestedUser.removeFromFriends(requestingUser)
		requestingUser.removeFromFriends(requestedUser)
	}

  /*******************************/
  // Item-related service actions
  /*******************************/

  /*
  // Send an item request message to the item-owning user and
  // mark the item as 'requested'
  */
	String makeItemRequest(params){
		def requestedUser = User.get(params.requestedUser)
		def requestingUser = User.get(params.requestingUser)
		def requestedItem = Item.get(params.requestedMedia)
    def alreadyRequested = requestedItem.requestQueue.contains(requestingUser)

    //Self-requests mark the item as reserved
    if(requestingUser == requestedUser){
      requestedItem.reserved = true
      requestedItem.library.available[requestedItem.mediaType + "s"] -= 1
      return "${requestedItem.title} is now reserved"
    }
    else{
      if(!alreadyRequested){
        def requestMessage = new Message(
          sentFrom:requestingUser,
          sentTo:requestedUser,
          body:"${requestingUser.username} has asked to borrow the ${requestedItem.mediaType} \"${requestedItem.title}\"",
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
      def requestedMedia = Item.get(params.requestedMedia)
      requestedMedia.reserved = false
      requestedMedia.library.available[requestedMedia.mediaType + 's'] += 1
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
  // Removes all requests for an item and marks it as available
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
  // Confirm a request to borrow an item
  */
  void confirmItemRequest(params){
    def message
    if (params.messageId){
      message = Message.get(params.messageId)
    }
    else{
      message = Message.find("from Message as m where \
                              m.sentFrom = ${params.requestingUser} and \
                              m.sentTo = ${params.requestedUser} and \
                              m.item = ${params.requestedMedia}")
    }
    def requestedItem = message.item
    def requestedUser = message.sentTo
    def requestingUser = message.sentFrom

    assert message != null
    assert requestedItem != null
    assert requestedUser != null
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
    //requestingUser.addToBorrowed(requestedItem)
    requestedItem.save(failOnError:true)
    requestedItem.library.available[requestedItem.mediaType + "s"] -= 1
    requestedItem.requestQueue.remove(requestingUser.id)
    message.delete()
  }

  /*
  // Send a message requesting the return of a specific item
  */
  void requestItemReturn(params){
    def requestedItem = Item.get(params.requestedMedia)
		assert requestedItem != null
    def requestedUser = requestedItem.loanedTo
    assert requestedUser != null
    def requestingUser = requestedItem.library.user
    assert requestingUser != null
    def requestMessage = new Message(
      sentFrom:requestingUser,
      sentTo:requestedUser,
      body:"${requestingUser.username} has asked you to return the ${requestedItem.mediaType} \"${requestedItem.title}\" ",
      type:"Item Return Request",
      item:requestedItem
    )
    requestMessage.save(failOnError:true)
    requestedUser.addToInMessages(requestMessage)
    requestingUser.addToOutMessages(requestMessage)
	}

  /*
  // Un-mark an item as loaned out, and inform the owner
  // Can take message (i.e. from profile page) or user/item id's (i.e. from library page)
  */
  void confirmReturnRequest(params){
    def message
    def requestedItem
    def requestingUser
    def requestedUser

    if(params.messageId != null){
      message = Message.get(params.messageId)
      requestedItem = message.item
      requestingUser = message.sentTo
      requestedUser = message.sentFrom
      message.delete()
    }else{
      requestedItem = Item.get(params.requestedMedia)
      requestingUser = User.get(params.requestingUser)
      requestedUser = User.get(params.requestedUser)
    }
    
    def confirmMessage = new Message(
      sentFrom:requestingUser,
      sentTo:requestedUser,
      body:"${requestingUser.username} has returned the ${requestedItem.mediaType} \"${requestedItem.title}\" ",
      type:"Item Return Confirm"
    )

    confirmMessage.save(failOnError:true)
    requestedUser.addToInMessages(confirmMessage)
    requestingUser.addToOutMessages(confirmMessage)

    requestedItem.loanedOut = false
    requestedItem.loanedTo = null
    requestedItem.save(failOnError:true)
    requestedItem.library.available[requestedItem.mediaType + "s"] += 1
  }

  /*
  // Removes a notification message from a user
  */
  void dismissMessage(params){
    def message = Message.get(params.messageId)
    assert message != null
    message.delete()
  }

}
